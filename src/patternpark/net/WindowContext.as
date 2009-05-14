package patternpark.net {
    import flash.external.ExternalInterface;
    
    public class WindowContext implements IContextObject {
        protected var windowName:String;
        
        public function WindowContext(windowName:String) {
            this.windowName = windowName;
        } 
        
        public function close():void {
            var js:String = (<![CDATA[
                function(windowName) {
                    this[windowName].close();
                }
            ]]>).toString();
            
            if(ExternalInterface.available && windowName) {
                ExternalInterface.call(js, windowName);
            }
        }
    }
}
