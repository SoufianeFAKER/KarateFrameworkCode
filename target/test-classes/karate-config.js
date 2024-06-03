function fn() { 
	var env = karate.env; // get system property 'karate.env' karate.log('karate.env system property was:', env); 
	if (!env) { 
		env = 'dev'; 
	} 

	var config = { 
		env: env, 
		myVarName: 'hello karate', 
		baseUrl: 'https://gorest.co.in',
		tokenID: '47db98f7c28f1a9848743b5c88cde1a3663afc8e1146fe7364a215ba42cc3bd6'
	}

	if (env == 'dev') { 
		// customize 
		// e.g. config.foo = 'bar'; 
	} else if (env == 'e2e') { 
		// customize 
	} 
return config; 
}