package patternpark.net {
    import flash.external.ExternalInterface;
    
    public class WindowContext {
        protected var windowName:String;
        
        public function WindowContext(windowName:String) {
            this.windowName = windowName;
        } 
        
        public function close():void {
            var js:String = (<![CDATA[
                function(winName) {
                    this[winName].close();
                }
            ]]>).toString();
            
            if(ExternalInterface.available && windowName) {
                ExternalInterface.call(js, windowName);
            }
        }
    }
}
