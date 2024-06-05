package features;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

	@Karate.Test
	Karate getAPITest() {
		
		return Karate.run("getapi.feature").relativeTo(getClass());
		
	}
	
	@Karate.Test
	Karate postAPITest() {
		
		return Karate.run("postapi.feature").relativeTo(getClass());
		
	}
	
	@Karate.Test
	Karate putAPITest() {
		
		return Karate.run("putapi.feature").relativeTo(getClass());
		
	}
	
	@Karate.Test
	Karate deleteAPITest() {
		
		return Karate.run("deleteapi.feature").relativeTo(getClass());
		
	}

}
