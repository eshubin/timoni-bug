package templates

#Service2ConfigMap: #CommonConfigMap & {
    #config: #Config
    #component: "service2"

    let dataParams = {#configuration: #config, #service: #component}
    data: {
        #MySQLConfigData & dataParams
        SERVICE2_VAR1: "B1"
        SERVICE2_VAR2: "B2"
    }
}


#Service2Config: #CommonServiceConfig & {
    #commonGroups: #CommonGroups
    replicas: 2
    mysql: #MySQLConfig & {#default: #commonGroups.mysql}
}


#Deployment2: #CommonDeployment & {
	#component: "service2"
}