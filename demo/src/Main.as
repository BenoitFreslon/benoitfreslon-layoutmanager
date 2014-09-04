package {
	import com.benoitfreslon.layoutmanager.LayoutLoader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	
	[SWF( width="1136",height="640",frameRate="60",backgroundColor="#CCCCCC" )]
	
	public class Main extends Sprite {
		
		private var mStarling : Starling;
		
		public function Main() : void {
			trace( "Main" );
			// These settings are recommended to avoid problems with touch handling
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			// LayoutLoader Configuration
			LayoutLoader.debug = true;
			// Define baseWidth and baseHeight in order to scale all layouts according the screen size. Useful for mobile applications.
			LayoutLoader.baseWidth = 800;
			LayoutLoader.baseHeight = 600;
			
			// Create a Starling instance that will run the "Game" class
			mStarling = new Starling( Game, stage );
			mStarling.start();
		}
	}

}