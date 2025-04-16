package templates

#CommonS3Config: {
    host: string
    port: int
    region: string
}

#S3Config: {
    #default: #CommonS3Config
    host: string | *#default.host
    port: int | *#default.port
    region: string | *#default.region
}

#S3ConfigData: {
	#service:     string
	#configuration: #Config

	S3_HOST:   #configuration[#service].s3.host
    S3_PORT:   "\(#configuration[#service].s3.port)"
    S3_REGION:   #configuration[#service].s3.region
}
