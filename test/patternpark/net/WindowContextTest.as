package patternpark.net {

	import asunit.framework.TestCase;

	public class WindowContextTest extends TestCase {
		private var instance:WindowContext;

		public function WindowContextTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new WindowContext();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is WindowContext", instance is WindowContext);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
	}
}