package patternpark.net {
    import flash.external.ExternalInterface;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    
    import patternpark.net.IContextObject;
    import patternpark.net.WindowContext;
    
    public function navigateToWindow(url:String, winName:String="", winFeatures:Object=null):IContextObject {
        winName = (winName == "") ? String(Math.round(9999 * Math.random()) + new Date().getTime()) : winName;
        var uniqueWinName:String = "navigateToWindow_" + winName;

        winFeatures ||= new Object();
        var toolbar:Number      = (winFeatures.toolbar == null) ? 1 : winFeatures.toolbar;
        var scrollbars:Number   = (winFeatures.scrollbars == null) ? 1 : winFeatures.scrollbars;
        var location:Number     = (winFeatures.location == null) ? 1 : winFeatures.location;
        var status:Number       = (winFeatures.status == null) ? 1 : winFeatures.status;
        var menubar:Number      = (winFeatures.menubar == null) ? 1 : winFeatures.menubar;
        var resizable:Number    = (winFeatures.resizable == null) ? 1 : winFeatures.resizable; 
        var width:Number        = (winFeatures.width == null) ? 100 : winFeatures.width;
        var height:Number       = (winFeatures.height == null) ? 100 : winFeatures.height;
        var left:Number         = (winFeatures.left == null) ? 0 : winFeatures.left;
        var top:Number          = (winFeatures.top == null) ? 0 : winFeatures.top;
        
        var js:String = (<![CDATA[
            function(url, winName, toolbar, scrollbars, location, status, menubar, resizable, width, height, left, top, uniqueWinName) {
                var winFeatures = new Array();
                winFeatures.push("toolbar=" + toolbar);
                winFeatures.push("scrollbars=" + scrollbars);
                winFeatures.push("location=" + location);
                winFeatures.push("status=" + status);
                winFeatures.push("menubar=" + menubar);
                winFeatures.push("resizable=" + resizable);
                winFeatures.push("width=" + width);
                winFeatures.push("height=" + height);
                winFeatures.push("left=" + left);
                winFeatures.push("top=" + top);
                    
                var winNew = this[uniqueWinName] = window.open(url,winName,winFeatures.join(","));

                if(!winNew) {
                    return false;
                }
                else {
                    winNew.focus();
                    return true;
                }
            }
        ]]>).toString();

        if(!ExternalInterface.available || !ExternalInterface.call(js, url, winName, toolbar, scrollbars, location, status, menubar, resizable, width, height, left, top, uniqueWinName)) {
            var urlRequest:URLRequest = new URLRequest(url);
            navigateToURL(urlRequest, "_blank");
            uniqueWinName = null;
        }
        
        return new WindowContext(uniqueWinName);
    }
}
