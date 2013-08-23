package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import starling.core.Starling;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;
	
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	
	[SWF( width="800",height="600",frameRate="60",backgroundColor="#CCCCCC" )]
	
	public class Main extends Sprite {
		

		
		private var mStarling : Starling;
		
		public function Main() : void {
			
			// These settings are recommended to avoid problems with touch handling
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			// Create a Starling instance that will run the "Game" class
			mStarling = new Starling( Game, stage );
			mStarling.start();
		}
	}

}