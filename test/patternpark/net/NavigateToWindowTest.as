package patternpark.net {

    import asunit.framework.TestCase;
    
    public class NavigateToWindowTest extends TestCase {
        private var instance:NavigateToWindowExample;

        public function NavigateToWindowTest(methodName:String=null) {
            super(methodName)
        }

        override protected function setUp():void {
            super.setUp();
            instance = new NavigateToWindowExample();
        }

        override protected function tearDown():void {
            super.tearDown();
            instance = null;
        }

        public function testNavigateToWindow():void {
            addChild(instance)
        }
    }
}

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.TextEvent;
import flash.geom.Point;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

import patternpark.net.navigateToOverlay;
import patternpark.net.navigateToWindow;
import patternpark.net.WindowContext;

class NavigateToWindowExample extends Sprite {
    private var openNavWindow:TextField;
    private var closeNavWindow:TextField;
    private var navOverlay:TextField;
    private var openNavWindowText:String = "<a href='event:http://www.patternpark.com'><u><font color='#0000FF'>open popup from SWF to Pattern Park</font></u></a>";
    private var closeNavWindowText:String = "<a href='event:http://www.patternpark.com'><u><font color='#0000FF'>close popup from SWF</font></u></a>";
    private var navOverlayText:String = "<a href='event:http://www.patternpark.com'><u><font color='#0000FF'>open overlay from SWF to Pattern Park</font></u></a>";
    
    private var popup:WindowContext;
    
    public function NavigateToWindowExample() {
        initialize();
        createChildren();
    }

    protected function initialize():void {
        openNavWindow = createTextField(openNavWindowText, openWindowLinkHandler);
        closeNavWindow = createTextField(closeNavWindowText, closeWindowLinkHandler);
        navOverlay = createTextField(navOverlayText, overlayLinkHandler);
    }
    
    protected function createTextField(text:String, linkHandler:Function):TextField {        
        var textField:TextField = new TextField();
        textField.htmlText = text;
        textField.autoSize = TextFieldAutoSize.LEFT;
        textField.border = true;
        textField.background = true;
        textField.addEventListener(TextEvent.LINK, linkHandler);
        return textField;
    }

    protected function createChildren():void {
        var openLink:DisplayObject = addChild(openNavWindow);
        openLink.x = openLink.y = 200;
        
        var closeLink:DisplayObject = addChild(closeNavWindow);
        closeLink.x = closeLink.y = 250;

        var overlay:DisplayObject = addChild(navOverlay);
        overlay.x = overlay.y = 300;
    }

    protected function openWindowLinkHandler(linkEvent:TextEvent):void {
        var winFeatures:Object = {
            toolbar:0,
            scrollbars:0,
            location:0,
            status:0,
            menubar:0,
            resizable:0,
            width:400,
            height:300,
            top:200,
            left:200
        };

        popup = navigateToWindow(linkEvent.text, "newWin", winFeatures);
    }
    
    protected function closeWindowLinkHandler(linkEvent:TextEvent):void {
        popup.close();
    }

    protected function overlayLinkHandler(linkEvent:TextEvent):void {
        var point:Point = new Point(this.x, this.y);
        navigateToOverlay(linkEvent.text, {width:400, height:300, top:point.x, left:point.y});
    }
}
