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
	#service:     string
	#configuration: #Config

	MYSQL_HOST:   #configuration[#service].mysql.host
    MYSQL_PORT:   "\(#configuration[#service].mysql.port)"
    MYSQL_USER:   #configuration[#service].mysql.user
    MYSQL_PASSWORD:   #configuration[#service].mysql.password
}
