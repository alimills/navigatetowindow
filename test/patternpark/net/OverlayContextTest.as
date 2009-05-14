package patternpark.net {

    import asunit.framework.TestCase;

    public class OverlayContextTest extends TestCase {
        private var instance:OverlayContext;

        public function OverlayContextTest(methodName:String=null) {
            super(methodName)
        }

        override protected function setUp():void {
            super.setUp();
            instance = new OverlayContext();
        }

        override protected function tearDown():void {
            super.tearDown();
            instance = null;
        }

        public function testInstantiated():void {
            assertTrue("instance is OverlayContext", instance is OverlayContext);
        }
    }
}