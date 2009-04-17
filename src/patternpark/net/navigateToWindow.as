package patternpark.net {
    import flash.external.ExternalInterface;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    
    public function navigateToWindow(url:String, winName:String="", winFeatures:Object=null):void {
        if(ExternalInterface.available) {
            winName = (winName == "") ? String(Math.round(9999 * Math.random()) + new Date().getTime()) : winName;
            winFeatures ||= new Object();
            var toolbar:Number      = (winFeatures.toolbar == null) ? 1 : winFeatures.toolbar;
            var scrollbars:Number   = (winFeatures.scrollbars == null) ? 1 : winFeatures.scrollbars;
            var location:Number     = (winFeatures.location == null) ? 1 : winFeatures.location;
            var statusbar:Number    = (winFeatures.statusbar == null) ? 0 : winFeatures.statusbar;
            var menubar:Number      = (winFeatures.menubar == null) ? 0 : winFeatures.menubar;
            var resizable:Number    = (winFeatures.resizable == null) ? 1 : winFeatures.resizable;
            var width:Number        = (winFeatures.width == null) ? 800 : winFeatures.width;
            var height:Number       = (winFeatures.height == null) ? 700 : winFeatures.height;
            var left:Number         = (winFeatures.left == null) ? 200 : winFeatures.left;
            var top:Number          = (winFeatures.top == null) ? 100 : winFeatures.top;
            
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
        else {
            throw new Error("[navigateToWindow requires that ExternalInterface is available. The ExternalInterface is not available in this container. ExternalInterface requires Internet Explorer ActiveX, Firefox, Mozilla 1.7.5 and greater, or other browsers that support NPRuntime.]");
        }
    }
}
