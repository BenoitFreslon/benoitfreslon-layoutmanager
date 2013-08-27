package com.benoitfreslon.layoutmanager {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	import starling.display.ButtonExtended;
	
	// TODO touchabe
	// TODO flipX
	// TODO flipY
	// TODO enabled
	
	/**
	 * Loader of Layout
	 * @version 1.03
	 * @author Benoît Freslon
	 */
	public class LayoutLoader {
		private var _movieclip : MovieClip;
		private var _displayObject : DisplayObjectContainer;
		private var _assetManager : AssetManager;
		//static public var debug : Boolean = false;
		static public var renderMode:Boolean = false;
		private var onLoad : Function = function() : void {
		};
		/**
		 * Loader of Layout class.
		 */
		public function LayoutLoader() {
			super();
		}
		/**
		 * Load a layout from a MovieClip added in ActionScript.
		 * Embed a SWC file with all your layouts in your ActionScript 3.0 project and use this lib to load and display your layouts. 
		 * 
		 * @param	displayObject The starling.display.DisplayObject where the layout should be displayed
		 * @param	LayoutClass	The layout class Embed in the SWC file.
		 * @param	assetManager The AssetManager instance where all assets are loaded.
		 * @param	callBack The callback function when the layout is loaded and displayed.
		 */
		public function loadLayout( displayObject : DisplayObjectContainer, LayoutClass : Class, assetManager : AssetManager, callBack : Function = null ) : void {
			renderMode = true;
			_displayObject = displayObject;
			_assetManager = assetManager;
			_movieclip = new LayoutClass();
			_movieclip.addEventListener( Event.ENTER_FRAME, layoutLoaded );
			if ( onLoad != null )
				onLoad = callBack
		}
		
		private function layoutLoaded( e : Event ) : void {
			_movieclip.removeEventListener( Event.ENTER_FRAME, layoutLoaded );
			parseMovieClip( _movieclip, _displayObject );
			loaded();
		}
		
		private function parseMovieClip( mc : MovieClip, parent : DisplayObjectContainer ) : void {
			var child : BFObject;
			var n : int = mc.numChildren;
			
			for ( var i : uint = 0; i < n; ++i ) {
				child = mc.getChildAt( i ) as BFObject;
				
				if ( child ) {
					if ( child.mainClass ) {
						
						var a : Array = [ ButtonExtended ];
						
						var objectClass : Class;
						if ( child.className ) {
							objectClass = getDefinitionByName( child.className ) as Class;
						} else {
							objectClass = getDefinitionByName( child.mainClass ) as Class;
						}
						
						var obj : DisplayObject;
						if ( child.mainClass == "starling.display.Image" ) {
							obj = addImage( objectClass, child as BFImage );
						} else if ( child.mainClass == "starling.display.ButtonExtended" ) {
							obj = addButton( objectClass, child as BFButton );
						} else if ( child.mainClass == "starling.text.TextField" ) {
							obj = addTextField( objectClass, child as BFTextField );
						} else if ( child.mainClass == "starling.display.Sprite" ) {
							obj = addSprite( objectClass, child as BFSprite );
						} else {
							trace( new Error( "No mainClass defined in '" + child + "'" ) );
						}
						
						if ( child.hasOwnProperty( "params" ) ) {
							for ( var metatags : String in child.params ) {
								if ( obj.hasOwnProperty( metatags ) )
									obj[ metatags ] = child.params[ metatags ];
							}
						}
						obj.name = child.name;
						
						obj.x = int(child.x);
						obj.y = int(child.y);
						//obj.scaleX = child.scaleX;
						//obj.scaleY = child.scaleY;
						if (child.flipX) {
							obj.scaleX = -1;
						}
						if (child.flipY) {
							obj.scaleY = -1;
						}
						obj.alpha = child.alpha;
						obj.rotation = child.rotation;
						obj.visible = child.isVisible;
						
						parent.addChild( obj );
						
						if ( obj.hasOwnProperty( "tag" ) ) {
							obj[ "tag" ] = child.tag;
						}
						if ( obj.hasOwnProperty( "userData" ) ) {
							obj[ "userData" ] = child.userData;
						}
						if ( _displayObject.hasOwnProperty( child.name ) ) {
							_displayObject[ child.name ] = obj as objectClass;
						} else if ( child.name.split( "__id" ).length == 1 ) {
							trace( new Error( "No public property '" + child.name + "' declared in " + _displayObject ) );
						}
					} else {
						
						//trace( new Error( "No className defined " + child ) );
					}
				}
			}
		}
		
		private function loaded() : void {
			_assetManager = null;
			_displayObject = null;
			_movieclip = null;
			onLoad();
		}
		
		private function addImage( objectClass : Class, child : BFImage ) : Image {
			var img : Image = new objectClass( getTexture( child, child.texture, child.width, child.height ) ) as Image;
			img.pivotX = int(img.width / 2);
			img.pivotY = int(img.height / 2);
			return img;
		}
		
		private function addSprite( objectClass : Class, child : BFSprite ) : Sprite {
			var s : Sprite = new objectClass() as Sprite;
			parseMovieClip( child as MovieClip, s as DisplayObjectContainer );
			return s;
		}
		
		private function addTextField( objectClass : Class, child : BFTextField ) : TextField {
			var t : TextField = new objectClass( child.width, child.height, "" ) as TextField;
			t.fontName = child.fontName;
			t.fontSize = child.fontSize;
			t.text = child.text;
			t.color = child.color;
			t.hAlign = child.hAlign;
			t.vAlign = child.vAlign;
			t.bold = child.bold;
			t.italic = child.italic;
			t.border = child.border;
			t.underline = child.underline;
			t.pivotX = int(t.width / 2);
			t.pivotY = int(t.height / 2);
			return t;
		}
		
		private function addButton( objectClass : Class, child : BFButton ) : Button {
			var bt : Button = new objectClass( getTexture( child, child.upState, child.width, child.height ) ) as Button;
			bt.fontBold = child.fontBold;
			bt.fontColor = child.fontColor;
			bt.fontName = child.fontName;
			bt.fontSize = child.fontSize;
			bt.alphaWhenDisabled = child.alphaWhenDisabled;
			bt.text = child.text;
			bt.pivotX = int(bt.width / 2);
			bt.pivotY = int(bt.height / 2);
			if ( child.downState )
				bt.downState = _assetManager.getTexture( child.downState );
			if ( bt.hasOwnProperty( "onTouch" ) && _displayObject.hasOwnProperty( child.onTouch ) ) {
				bt[ "onTouch" ] = _displayObject[ child.onTouch ];
			} else if ( bt.hasOwnProperty( "onTouch" ) && child.onTouch != "" && !_displayObject.hasOwnProperty( child.onTouch ) ) {
				trace( new Error( "The public method '" + child.onTouch + "' is not defined in " + _displayObject ) );
			}
			return bt;
		}
		
		private function getTexture( child : BFObject, textureName : String, w : Number, h : Number ) : Texture {
			if ( textureName == "" ) {
				trace( new Error( "No texture defined in '" + child + " - name: "+child.name+"' in "+_displayObject+". Default texture used." ) );
				return Texture.empty( w, h );
			} else {
				return _assetManager.getTexture( textureName );
			}
		}
	}

}