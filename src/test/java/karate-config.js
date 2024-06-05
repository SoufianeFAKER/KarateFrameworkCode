function fn() { 
	var env = karate.env; // get system property 'karate.env' karate.log('karate.env system property was:', env); 
	if (!env) { 
		env = 'dev'; 
	} 

	var config = { 
		env: env, 
		myVarName: 'hello karate', 
		baseUrl: 'https://gorest.co.in',
		tokenID: 'b07b6f98caa81ae878fce96eda234bdf598939ef72ba5ab8998b20e500ea2af8'
	}

	if (env == 'dev') { 
		// customize 
		// e.g. config.foo = 'bar'; 
	} else if (env == 'e2e') { 
		// customize 
	} 
return config; 
}