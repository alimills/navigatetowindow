package patternpark.net {
    import flash.external.ExternalInterface;
    
    public class OverlayContext implements IContextObject {
        protected var overlayName:String;
        
        public function OverlayContext(overlayName:String) {
            this.overlayName = overlayName;
        } 
        
        public function close():void {
            var js:String = (<![CDATA[
                function(overlayName) {
                    document.body.removeChild(this[overlayName]);
                }
            ]]>).toString();
            
            if(ExternalInterface.available && overlayName) {
                ExternalInterface.call(js, overlayName);
            }
        }
    }
}
