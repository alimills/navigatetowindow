package patternpark.net {
    import flash.external.ExternalInterface;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    
    import patternpark.net.OverlayContext
    
    public function navigateToOverlay(url:String, winFeatures:Object=null):IContextObject {
        var uniqueOverlayName:String = String(Math.round(9999 * Math.random()) + new Date().getTime());
        uniqueOverlayName = "navigateToOverlay_overlay_" + uniqueOverlayName;

        if(ExternalInterface.available) {
            winFeatures ||= new Object();
            var toolbar:Number      = (winFeatures.toolbar == null) ? 1 : winFeatures.toolbar;
            var scrollbars:Number   = (winFeatures.scrollbars == null) ? 1 : winFeatures.scrollbars;
            var location:Number     = (winFeatures.location == null) ? 1 : winFeatures.location;
            var statusbar:Number    = (winFeatures.statusbar == null) ? 1 : winFeatures.statusbar;
            var menubar:Number      = (winFeatures.menubar == null) ? 1 : winFeatures.menubar;
            var resizable:Number    = (winFeatures.resizable == null) ? 1 : winFeatures.resizable; 
            var width:Number        = (winFeatures.width == null) ? 100 : winFeatures.width;
            var height:Number       = (winFeatures.height == null) ? 100 : winFeatures.height;
            var left:Number         = (winFeatures.left == null) ? 0 : winFeatures.left;
            var top:Number          = (winFeatures.top == null) ? 0 : winFeatures.top;
        
            var js:String = (<![CDATA[
                function(url, toolbar, scrollbars, location, statusbar, menubar, resizable, width, height, left, top, uniqueOverlayName) {
                    var overlay = this[uniqueOverlayName] = document.createElement("div");
                    overlay.style.cssText = "position: absolute; height: " + height + "px; width: " + width + "px; left:" + left + "px; top:" + top + "px";
                    document.body.appendChild(overlay);

                    var iframe = document.createElement("iframe");
                    overlay.appendChild(iframe);
                    iframe.doc = null;

                    if(iframe.contentDocument) {
                        iframe.doc = iframe.contentDocument;  
                    }
                    else if(iframe.contentWindow) {
                        iframe.doc = iframe.contentWindow.document;
                    }        
                    else if(iframe.document) {
                        iframe.doc = iframe.document;  
                    }
  
                    if(iframe.doc == null) {
                        throw "Document not found, append the parent element to the DOM before creating the IFrame";  
                    }
                    
                    iframe.src = url;
                    iframe.toolbar = toolbar;
                    iframe.scrollbars = scrollbars;
                    iframe.statusbar = statusbar;
                    iframe.menubar = menubar;
                    iframe.resizable = resizable;
                    iframe.width = width;
                    iframe.height = height;
                }
            ]]>).toString();

            ExternalInterface.call(js, url, toolbar, scrollbars, location, statusbar, menubar, resizable, width, height, left, top, uniqueOverlayName)
        }
        else {
            var urlRequest:URLRequest = new URLRequest(url);
            navigateToURL(urlRequest, "_blank");
            uniqueOverlayName = null;
        }
        
        return new OverlayContext(uniqueOverlayName);
    }
}
