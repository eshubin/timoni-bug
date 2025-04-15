package templates

#CommonMySQLConfig: {
    host: string
    port: int
    user: string
    password: string
}

#MySQLConfig: {
    #default: #CommonMySQLConfig
    host: string | *#default.host
    port: int | *#default.port
    user: string | *#default.user
    password: string | *#default.password
}

#MySQLConfigData: {
	#component:     string
	#configuration: #Config

	REDIS_HOST:   #configuration[#component].redis.host
    REDIS_PORT:   #configuration[#component].redis.port
}
