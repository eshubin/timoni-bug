package templates

#Service2Config: #CommonServiceConfig & {
    #commonGroups: #CommonGroups
    replicas: 2
    mysql: #MySQLConfig & {#default: #commonGroups.mysql}
}


#Deployment2: #CommonDeployment & {
	#component: "service2"
}