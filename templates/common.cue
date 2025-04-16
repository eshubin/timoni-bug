package templates

import (
	appsv1 "k8s.io/api/apps/v1"
	corev1 "k8s.io/api/core/v1"
    timoniv1 "timoni.sh/core/v1alpha1"
)



#CommonServiceConfig: {
    #commonGroups: #CommonGroups
    // The image allows setting the container image repository,
    // tag, digest and pull policy.
    image: timoniv1.#Image & {
        repository: *"docker.io/nginx" | string
        tag:        *"1-alpine" | string
        digest:     *"" | string
    }


    // The resources allows setting the container resource requirements.
    // By default, the container requests 10m CPU and 32Mi memory.
    resources: timoniv1.#ResourceRequirements & {
        requests: {
            cpu:    *"10m" | timoniv1.#CPUQuantity
            memory: *"32Mi" | timoniv1.#MemoryQuantity
        }
    }

    // The number of pods replicas.
    replicas: int & >0
    ...
}

#CommonGroups : {
    mysql: #CommonMySQLConfig
    redis: #CommonRedisConfig
    s3: #CommonS3Config
}


#CommonDeployment: appsv1.#Deployment & {
	#config:    #Config
    #component: string
    #cm: string
	apiVersion: "apps/v1"
	kind:       "Deployment"

	metadata: timoniv1.#MetaComponent & {
		#Meta:      #config.metadata
		#Component: #component
	}
	spec: appsv1.#DeploymentSpec & {
		replicas: #config[#component].replicas
        _selector: {
			(timoniv1.#StdLabelName): metadata.name
		}

		selector: matchLabels: _selector
		template: {
			metadata: {
				labels: _selector
				if #config.pod.annotations != _|_ {
					annotations: #config.pod.annotations
				}
			}
			spec: corev1.#PodSpec & {
				containers: [
					{
						name:            #config.metadata.name
						image:           #config[#component].image.reference
						imagePullPolicy: #config[#component].image.pullPolicy
                        envFrom: [
                            {configMapRef: {name: #cm}}
                        ]
						ports: [
							{
								name:          "http"
								containerPort: 80
								protocol:      "TCP"
							},
						]
						readinessProbe: {
							httpGet: {
								path: "/"
								port: "http"
							}
							initialDelaySeconds: 5
							periodSeconds:       10
						}
						livenessProbe: {
							tcpSocket: {
								port: "http"
							}
							initialDelaySeconds: 5
							periodSeconds:       5
						}
						if #config.resources != _|_ {
							resources: #config.resources
						}
						if #config.securityContext != _|_ {
							securityContext: #config.securityContext
						}
					},
				]
				if #config.pod.affinity != _|_ {
					affinity: #config.pod.affinity
				}
				if #config.pod.imagePullSecrets != _|_ {
					imagePullSecrets: #config.pod.imagePullSecrets
				}
			}
		}
	}
}


#CommonConfigMap: corev1.#ConfigMap & {
	#config:       #Config
	#component: string
    apiVersion: "v1"
	kind:       timoniv1.#ConfigMapKind

	metadata: timoniv1.#MetaComponent & {
		#Meta:      #config.metadata
		#Component: #component
	}
}
