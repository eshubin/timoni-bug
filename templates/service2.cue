package templates

#Service2ConfigMap: #CommonConfigMap & {
    #config: #Config
    #component: "service2"

    let dataParams = {#configuration: #config, #service: #component}
    data: {
        #MySQLConfigData & dataParams
        #S3ConfigData & dataParams
        SERVICE2_VAR1: #config[#component].var1
        SERVICE2_VAR2: #config[#component].var2
    }
}


#Service2Config: #CommonServiceConfig & {
    #commonGroups: #CommonGroups
    replicas: 2
    mysql: #MySQLConfig & {#default: #commonGroups.mysql}
    s3: #S3Config & {#default: #commonGroups.s3}
    var1: string
    var2: string
}


#Deployment2: #CommonDeployment & {
	#component: "service2"
}