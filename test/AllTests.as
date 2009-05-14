package {
	/**
	 * This file has been automatically created using
	 * #!/usr/bin/ruby script/generate suite
	 * If you modify it and run this script, your
	 * modifications will be lost!
	 */

	import asunit.framework.TestSuite;
	import patternpark.net.NavigateToWindowTest;
	import patternpark.net.WindowContextTest;

	public class AllTests extends TestSuite {

		public function AllTests() {
			addTest(new patternpark.net.NavigateToWindowTest());
			addTest(new patternpark.net.WindowContextTest());
		}
	}
}
