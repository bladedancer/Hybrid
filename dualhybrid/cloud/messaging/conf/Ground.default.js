module.exports = {
	// The configuration settings for your Swagger service.
	pluginConfig: {
		'@axway/api-builder-plugin-fn-swagger': {
			'Ground': {
				// It is possible to override Swagger URI options when constructing
				// outbound requests from the Swagger plugin.
				uri: {
					protocol: process.env.GROUND_PROTOCOL,
                  	host: process.env.GROUND_HOSTNAME,
                  	port: process.env.GROUND_PORT,
                  	basePath: process.env.GROUND_BASEPATH
				}
			}
		}
	}};
