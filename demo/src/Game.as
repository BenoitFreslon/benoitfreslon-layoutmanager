package  
{
	import starling.display.Image;
	import starling.display.Sprite;
	import com.benoitfreslon.layoutmanager.LayoutLoader;
	import starling.events.Event;
	/**
	 * ...
	 * @author Benoît Freslon
	 */
    public class Game extends Sprite
    {
		
		public var image1:Image;
		public var image2:Image;
		public var image3:Image;
		
        public function Game()
        {
			super();
			
			var ll:LayoutLoader = new LayoutLoader();
			ll.loadLayout(this, DemoLayout, Main.assets, onLoad);
			
        }
		
		private function onLoad():void 
		{
			// Layout loaded a displayed
			
			
		}
		private function tapHello(e:Event):void {
			
		}
		private function tapWorld(e:Event):void {
			
		}
    }

}