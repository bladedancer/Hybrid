/**
 * Configuration used by the GreetFlow. 'saluation' is accessed via '$.helloworld.salutation'
 * similarly any APIBuilder.config parameter can be accessed.
 */
module.exports = {
	helloworld: {
		welcome: process.env.WELCOME || 'Howdy',
		babble: process.env.BABBLE || 'Blah Blah Blah'
	}
};
