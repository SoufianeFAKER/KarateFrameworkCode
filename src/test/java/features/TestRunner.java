package features;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

	@Karate.Test
	Karate testSample() {
		
		return Karate.run("randomemail.feature").relativeTo(getClass());
		
	}

}
