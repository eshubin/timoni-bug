package templates

#Service4ConfigMap: #CommonConfigMap & {
    #config: #Config
    #component: "service4"

    let dataParams = {#configuration: #config, #service: #component}
    data: {
        #MySQLConfigData & dataParams
        #RedisConfigData & dataParams
        #S3ConfigData & dataParams
        #MongoDBConfigData & dataParams
        SERVICE4_VAR1: #config[#component].var1
        SERVICE4_VAR2: #config[#component].var2
    }
}


#Service4Config: #CommonServiceConfig & {
    #commonGroups: #CommonGroups
    replicas: 2
    mysql: #MySQLConfig & {#default: #commonGroups.mysql}
    redis: #RedisConfig & {#default: #commonGroups.redis}
    s3: #S3Config & {#default: #commonGroups.s3}
    mongodb: #MongoDBConfig & {#default: #commonGroups.mongodb}

    var1: string
    var2: string
}


#Deployment4: #CommonDeployment & {
	#component: "service4"
}