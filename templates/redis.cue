package templates

#CommonRedisConfig: {
    host: string
    port: int
}

#RedisConfig: {
    #default: #CommonRedisConfig
    host: string | *#default.host
    port: int | *#default.port
}

#RedisConfigData: {
	#service:     string
	#configuration: #Config

	REDIS_HOST:   #configuration[#service].redis.host
    REDIS_PORT:   "\(#configuration[#service].redis.port)"
}
