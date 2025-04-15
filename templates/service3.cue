package templates

#Service3ConfigMap: #CommonConfigMap & {
    #config: #Config
    #component: "service3"

    let dataParams = {#configuration: #config, #service: #component}
    data: {
        #MySQLConfigData & dataParams
        #RedisConfigData & dataParams
        SERVICE3_VAR1: "C1"
        SERVICE3_VAR2: "C2"
    }
}


#Service3Config: #CommonServiceConfig & {
    #commonGroups: #CommonGroups
    replicas: 2
    mysql: #MySQLConfig & {#default: #commonGroups.mysql}
    redis: #RedisConfig & {#default: #commonGroups.redis}
}


#Deployment3: #CommonDeployment & {
	#component: "service3"
}