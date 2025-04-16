package templates

#CommonMongoDBConfig: {
    host: string
    port: int
    user: string
    password: string
}

#MongoDBConfig: {
    #default: #CommonMongoDBConfig
    host: string | *#default.host
    port: int | *#default.port
    user: string | *#default.user
    password: string | *#default.password
}

#MongoDBConfigData: {
	#service:     string
	#configuration: #Config

	MONGODB_HOST:   #configuration[#service].mongodb.host
    MONGODB_PORT:   "\(#configuration[#service].mongodb.port)"
    MONGODB_USER:   #configuration[#service].mongodb.user
    MONGODB_PASSWORD:   #configuration[#service].mongodb.password
}
