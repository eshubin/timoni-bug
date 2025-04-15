package templates

#Service1Config: #CommonServiceConfig & {
    #commonGroups: #CommonGroups
    replicas: 1
    redis: #RedisConfig & {#default: #commonGroups.redis}
}

#Service1ConfigMap: #CommonConfigMap & {
    #config: #Config
    #component: "service1"

    let dataParams = {#configuration: #config, #service: #component}
    data: {
        #RedisConfigData & dataParams
        SERVICE1_VAR1: "A1"
        SERVICE1_VAR2: "A2"
    }
}

#Deployment1: #CommonDeployment & {
	#component: "service1"
}
