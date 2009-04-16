package {
    import asunit.textui.TestRunner;
    
    import patternpark.net.NavigateToWindowTest;
    
    public class NavigateToWindowRunner extends TestRunner {
        public function NavigateToWindowRunner() {
            start(NavigateToWindowTest, "testNavigateToWindow", TestRunner.SHOW_TRACE);
        }
    }
}