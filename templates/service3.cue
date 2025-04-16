package templates

#Service3ConfigMap: #CommonConfigMap & {
    #config: #Config
    #component: "service3"

    let dataParams = {#configuration: #config, #service: #component}
    data: {
        #MySQLConfigData & dataParams
        #RedisConfigData & dataParams
        #S3ConfigData & dataParams
        SERVICE3_VAR1: #config[#component].var1
        SERVICE3_VAR2: #config[#component].var1
    }
}


#Service3Config: #CommonServiceConfig & {
    #commonGroups: #CommonGroups
    replicas: 2
    mysql: #MySQLConfig & {#default: #commonGroups.mysql}
    redis: #RedisConfig & {#default: #commonGroups.redis}
    s3: #S3Config & {#default: #commonGroups.s3}

    var1: string
    var2: string
}


#Deployment3: #CommonDeployment & {
	#component: "service3"
}