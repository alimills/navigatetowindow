package patternpark.net {

    import asunit.framework.TestCase;
    
    import patternpark.net.navigateToWindow;

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
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

import patternpark.net.navigateToWindow;

class NavigateToWindowExample extends Sprite {
    private var text:String = "<a href='event:http://www.patternpark.com'><u><font color='#0000FF'>open popup from SWF to Pattern Park</font></u></a>";
    private var textField:TextField;
    
    public function NavigateToWindowExample() {
        initialize();
        createChildren();
    }

    protected function initialize():void {
        textField = new TextField();
        textField.htmlText = text;
        textField.autoSize = TextFieldAutoSize.LEFT;
        textField.border = true;
        textField.background = true;
        textField.addEventListener(TextEvent.LINK, linkHandler);
    }

    protected function createChildren():void {
        var tf:DisplayObject = addChild(textField);
        tf.x = tf.y = 200;
    }

    protected function linkHandler(linkEvent:TextEvent):void {
        navigateToWindow(linkEvent.text, "newWin", {width:400, height:300});
    }
}
