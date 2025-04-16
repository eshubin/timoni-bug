package templates

#Service6ConfigMap: #CommonConfigMap & {
    #config: #Config
    #component: "service6"

    let dataParams = {#configuration: #config, #service: #component}
    data: {
        #MySQLConfigData & dataParams
        #RedisConfigData & dataParams
        #S3ConfigData & dataParams
        #MongoDBConfigData & dataParams
        SERVICE6_VAR1: #config[#component].var1
        SERVICE6_VAR2: #config[#component].var2
    }
}


#Service6Config: #CommonServiceConfig & {
    #commonGroups: #CommonGroups
    replicas: 2
    mysql: #MySQLConfig & {#default: #commonGroups.mysql}
    redis: #RedisConfig & {#default: #commonGroups.redis}
    s3: #S3Config & {#default: #commonGroups.s3}
    mongodb: #MongoDBConfig & {#default: #commonGroups.mongodb}

    var1: string
    var2: string
}


#Deployment6: #CommonDeployment & {
	#component: "service6"
}