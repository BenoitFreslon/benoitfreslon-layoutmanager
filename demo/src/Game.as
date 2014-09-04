package {
	import com.benoitfreslon.layoutmanager.LayoutManager;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	public class Game extends Sprite {
		private var assets : AssetManager;
		
		public var image1 : Image;
		public var image2 : Image;
		public var image3 : Image;
		
		public var imageContainer : Sprite;
		
		public function Game() {
			super();
			trace( "Game" );
			
			var texture : Texture = Texture.fromBitmap( new Assets.AtlasTexture() );
			var xml : XML = XML( new Assets.AtlasXml() );
			var atlas : TextureAtlas = new TextureAtlas( texture, xml );
			assets = new AssetManager();
			assets.addTextureAtlas( "assets", atlas );
			
			var ll : LayoutManager = new LayoutManager()
			ll.loadLayout( this, DemoLayout, assets, onLoad );
		}
		
		private function onLoad() : void {
			// Layout loaded a displayed
			trace( "Game: Layout loaded" )
			image1.rotation = Math.PI / 2;
			image2.scaleX = 1.2;
		}
		
		public function tapHello( e : Event ) : void {
			imageContainer.visible = false;
		}
		
		public function tapWorld( e : Event ) : void {
			imageContainer.visible = true;
		}
	}
}