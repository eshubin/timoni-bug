package templates

#Service1Config: #CommonServiceConfig & {
    #commonGroups: #CommonGroups
    replicas: 1
    redis: #RedisConfig & {#default: #commonGroups.redis}
    var1: string
    var2: string
}

#Service1ConfigMap: #CommonConfigMap & {
    #config: #Config
    #component: "service1"

    let dataParams = {#configuration: #config, #service: #component}
    data: {
        #RedisConfigData & dataParams
        SERVICE1_VAR1: #config[#component].var1
        SERVICE1_VAR2: #config[#component].var2
    }
}

#Deployment1: #CommonDeployment & {
	#component: "service1"
}
