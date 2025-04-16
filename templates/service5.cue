package templates

#Service5ConfigMap: #CommonConfigMap & {
    #config: #Config
    #component: "service5"

    let dataParams = {#configuration: #config, #service: #component}
    data: {
        #MySQLConfigData & dataParams
        #RedisConfigData & dataParams
        #S3ConfigData & dataParams
        #MongoDBConfigData & dataParams
        SERVICE5_VAR1: #config[#component].var1
        SERVICE5_VAR2: #config[#component].var2
    }
}


#Service5Config: #CommonServiceConfig & {
    #commonGroups: #CommonGroups
    replicas: 2
    mysql: #MySQLConfig & {#default: #commonGroups.mysql}
    redis: #RedisConfig & {#default: #commonGroups.redis}
    s3: #S3Config & {#default: #commonGroups.s3}
    mongodb: #MongoDBConfig & {#default: #commonGroups.mongodb}

    var1: string
    var2: string
}


#Deployment5: #CommonDeployment & {
	#component: "service5"
}