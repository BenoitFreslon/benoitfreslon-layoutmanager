package {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;
	
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	
	[SWF( width="800",height="600",frameRate="60",backgroundColor="#000000" )]
	
	public class Main extends Sprite {
		
		// Embed the Atlas XML
		[Embed( source="../demo/assets/atlas.xml",mimeType="application/octet-stream" )]
		public static const AtlasXml : Class;
		
		// Embed the Atlas Texture:
		[Embed( source="../demo/assets/atlas.png" )]
		public static const AtlasTexture : Class;
		
		private var mStarling : Starling;
		
		static public var assets : AssetManager;
		
		public function Main() : void {
			
			var texture : Texture = Texture.fromBitmap( new AtlasTexture() );
			var xml : XML = XML( new AtlasXml() );
			
			var atlas : TextureAtlas = new TextureAtlas( texture, xml );
			assets = new AssetManager();
			assets.addTextureAtlas( "assets", atlas );
			
			// These settings are recommended to avoid problems with touch handling
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			// Create a Starling instance that will run the "Game" class
			mStarling = new Starling( Game, stage );
			mStarling.start();
		}
	}

}