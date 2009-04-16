package patternpark.net {
    import flash.external.ExternalInterface;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    
    public function navigateToWindow(url:String, winName:String="", toolbar:Number=1, scrollbars:Number=1, location:Number=1, statusbar:Number=0, menubar:Number=0, resizable:Number=1, width:Number=800, height:Number=700, left:Number=200, top:Number=100):void {
        if(ExternalInterface.available) {
            winName = (winName == "") ? String(Math.round(9999 * Math.random()) + new Date().getTime()) : winName;
            
            var js:String = (<![CDATA[
                function(url, winName, toolbar, scrollbars, location, statusbar, menubar, resizable, width, height, left, top) {
                    var winNew = window.open(url,winName,"toolbar=" + toolbar + ",scrollbars=" + scrollbars + ",location=" + location + ",statusbar=" + statusbar + ",menubar=" + menubar + ",resizable=" + resizable + ",width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);

                    if(!winNew) {
                        return false;
                    }
                    else {
                        winNew.focus();
                        return true;
                    }
                }
            ]]>).toString();

            if(!ExternalInterface.call(js, url, winName, toolbar, scrollbars, location, statusbar, menubar, resizable, width, height, left, top)) {
                var urlRequest:URLRequest = new URLRequest(url);
                navigateToURL(urlRequest, "_blank");
            }
        }
    }
}
