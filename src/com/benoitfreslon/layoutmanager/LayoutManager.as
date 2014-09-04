package com.benoitfreslon.layoutmanager {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.system.Capabilities;
	import flash.utils.getDefinitionByName;
	import starling.core.Starling;
	
	import starling.display.Button;
	import starling.display.ButtonExtended;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	/**
	 * Loader of Layout
	 * @version 1.04
	 * @author Benoît Freslon
	 */
	public class LayoutManager {
		static public var debug : Boolean = false;
		/**
		 * Base width of the layout
		 */
		static public var baseWidth : Number;
		/**
		 * Base height of the layout
		 */
		static public var baseHeight : Number;
		
		private var _movieclip : MovieClip;
		private var _displayObject : DisplayObjectContainer;
		private var _rootObject : DisplayObjectContainer;
		private var _assetManager : AssetManager;
		private var onLoad : Function = function() : void {
		
		}
		private var _stageWidth : Number;
		private var _stageHeight : Number;
		
		/**
		 * Loader of Layout class.
		 */
		public function LayoutManager() {
			super();
			_stageWidth = Starling.current.stage.stageWidth;
			_stageHeight = Starling.current.stage.stageHeight;
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
		public function loadLayout( rootObject : DisplayObjectContainer, layoutClass : Class, assetManager : AssetManager, callBack : Function = null ) : void {
			loadLayoutIn( rootObject, rootObject, layoutClass, assetManager, callBack );
		}
		
		public function loadLayoutIn( rootObject : DisplayObjectContainer, displayObject : DisplayObjectContainer, layoutClass : Class, assetManager : AssetManager, callBack : Function = null ) : void {
			if ( debug )
				trace( "[LayoutLoader] loadLayoutIn", rootObject, displayObject, layoutClass, assetManager, callBack );
			
			_rootObject = rootObject
			_displayObject = displayObject;
			_assetManager = assetManager;
			_movieclip = new layoutClass();
			_movieclip.addEventListener( Event.ENTER_FRAME, layoutLoaded );
			if ( onLoad != null )
				onLoad = callBack
			
			var scaleFactor : Number = 1;
			var factorX : Number = _stageWidth / baseWidth;
			var factorY : Number = _stageHeight / baseHeight;
			
			// Scale screen
			if ( baseHeight > 0 && baseWidth > 0 ) {
				if ( factorX < factorY )
					scaleFactor = factorX;
				else
					scaleFactor = factorY;
				
				_displayObject.scaleX *= scaleFactor;
				_displayObject.scaleY *= scaleFactor
			}
			
			_displayObject.x = _stageWidth / 2;
			_displayObject.y = _stageHeight / 2;
		
		}
		
		private function layoutLoaded( e : Event ) : void {
			
			if ( debug )
				trace( "[LayoutLoader] layoutLoaded" );
			_movieclip.removeEventListener( Event.ENTER_FRAME, layoutLoaded );
			parseMovieClip( _movieclip, _rootObject, _displayObject );
			loaded();
		}
		
		private function parseMovieClip( mc : MovieClip, root : DisplayObjectContainer, container : DisplayObjectContainer ) : void {
			var child : BFDisplayObject;
			var n : int = mc.numChildren;
			for ( var i : uint = 0; i < n; ++i ) {
				child = mc.getChildAt( i ) as BFDisplayObject;
				if ( child ) {
					
					if ( child.mainClass ) {
						
						var a : Array = [ ButtonExtended ];
						
						var objectClass : Class;
						var curClassName : String;
						if ( child.className ) {
							curClassName = child.className;
						} else {
							curClassName = child.mainClass;
						}
						if ( debug )
							trace( "[LayoutLoader] adding", curClassName + " name: " + child.name );
						try {
							objectClass = getDefinitionByName( curClassName ) as Class;
						} catch ( e : Error ) {
							throw new Error( "The className [" + curClassName + "] defined in " + child + " [" + child.name + "] doesn't exit." );
						}
						var r : Number = child.rotation;
						child.rotation = 0;
						
						var obj : DisplayObject;
						if ( child.mainClass == "starling.display.Image" ) {
							obj = addImage( objectClass, child as BFImage );
						} else if ( child.mainClass == "starling.display.ButtonExtended" ) {
							obj = addButton( objectClass, child as BFButton );
						} else if ( child.mainClass == "starling.text.TextField" ) {
							obj = addTextField( objectClass, child as BFTextField );
						} else if ( child.mainClass == "starling.display.Sprite" ) {
							obj = addSprite( objectClass, child as BFSprite );
						} else if ( child.mainClass == "starling.display.Quad" ) {
							obj = addQuad( objectClass, child as BFQuad );
						} else {
							throw new Error( "No mainClass defined in [" + child + "]" );
						}
						
						if ( child.hasOwnProperty( "params" ) ) {
							for ( var metatags : String in child.params ) {
								if ( obj.hasOwnProperty( metatags ) )
									obj[ metatags ] = child.params[ metatags ];
							}
						}
						obj.alpha = child.alpha;
						obj.blendMode = child.blendMode;
						if ( container.getChildByName( child.name ) ) {
							throw new Error( "And object [" + curClassName + "] with the same name already exists in " + child.parent + " with the instance name [" + child.name + "].\rRemove or modify the instance name [" + child.name + "] in " + child.parent + " in Flash Pro." );
						}
						obj.name = child.name;
						obj.x = int( child.x );
						obj.y = int( child.y );
						//obj.scaleX = child.scaleX;
						//obj.scaleY = child.scaleY;
						obj.rotation = r * Math.PI / 180;
						obj.visible = child.visible;
						obj.touchable = child.touchable;
						obj.useHandCursor = obj.useHandCursor;
						container.addChild( obj );
						
						if ( obj.hasOwnProperty( "tag" ) ) {
							obj[ "tag" ] = child.tag;
						}
						if ( obj.hasOwnProperty( "userData" ) ) {
							obj[ "userData" ] = child.userData;
						}
						if ( _rootObject.hasOwnProperty( child.name ) ) {
							_rootObject[ child.name ] = obj as objectClass;
						} else if ( child.name.split( "__id" ).length == 1 && child.name.split( "instance" ).length == 1 ) {
							throw new Error( "No public property [" + child.name + "] declared in " + _rootObject + ".\rRemove or modify the instance name [" + child.name + "] in Flash Pro or add in " + _rootObject + ":\r\tpublic var " + child.name + ":" + curClassName + ";" );
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
			_rootObject = null;
			onLoad();
		}
		
		private function addImage( objectClass : Class, child : BFImage ) : Image {
			var tex : Texture = getTexture( child, child.texture, child.width, child.height )
			var img : Image = new objectClass( tex ) as Image;
			img.pivotX = int( img.width * child.pivotX );
			img.pivotY = int( img.height * child.pivotY );
			img.scaleX = child.scaleX;
			img.scaleY = child.scaleY;
			return img;
		}
		
		private function addSprite( objectClass : Class, child : BFSprite ) : Sprite {
			var s : Sprite = new objectClass() as Sprite;
			parseMovieClip( child as MovieClip, s as DisplayObjectContainer, s as DisplayObjectContainer );
			return s;
		}
		
		private function addTextField( objectClass : Class, child : BFTextField ) : TextField {
			var t : TextField = new objectClass( child.width, child.height, "" ) as TextField;
			t.autoScale = child.autoScale;
			t.autoSize = child.autoSize;
			t.batchable = child.batchable;
			t.bold = child.bold;
			t.border = child.border;
			t.color = child.color;
			t.fontName = child.fontName;
			t.fontSize = child.fontSize;
			t.hAlign = child.hAlign;
			t.height = child.height;
			t.italic = child.italic;
			t.kerning = child.kerning;
			t.pivotX = int( t.width * child.pivotX );
			t.pivotY = int( t.height * child.pivotY );
			var text : String = child.text;
			text = text.replace( "\\r", "\r" );
			text = text.replace( "\\n", "\n" );
			text = text.replace( "\\t", "\t" );
			t.text = text;
			t.underline = child.underline;
			t.vAlign = child.vAlign;
			t.width = child.width;
			return t;
		}
		
		private function addQuad( objectClass : Class, child : BFQuad ) : Quad {
			var q : Quad = new Quad( child.width, child.height, child.transform.colorTransform.color );
			q.pivotX = int( q.width * child.pivotX );
			q.pivotY = int( q.height * child.pivotY );
			return q;
		}
		
		// TODO Parse BFButton and addChild objects inside Button
		private function addButton( objectClass : Class, child : BFButton ) : Button {
			var bt : Button = new objectClass( getTexture( child, child.upState, child.width, child.height ) ) as Button;
			bt.alphaWhenDisabled = child.alphaWhenDisabled;
			bt.enabled = child.enabled;
			bt.fontBold = child.fontBold;
			bt.fontColor = child.fontColor;
			bt.fontName = child.fontName;
			bt.fontSize = child.fontSize;
			bt.pivotX = int( bt.width * child.pivotX );
			bt.pivotY = int( bt.height * child.pivotY );
			bt.scaleWhenDown = child.scaleWhenDown;
			bt.text = child.text;
			bt.textHAlign = child.textHAlign;
			bt.textVAlign = child.textVAlign;
			
			if ( child.downState )
				bt.downState = _assetManager.getTexture( child.downState );
			
			if ( bt.hasOwnProperty( "overState" ) && child.overState )
				bt[ "overState" ] = _assetManager.getTexture( child.overState );
			
			if ( bt.hasOwnProperty( "onTouch" ) && _rootObject.hasOwnProperty( child.onTouch ) ) {
				bt[ "onTouch" ] = _rootObject[ child.onTouch ];
			} else if ( bt.hasOwnProperty( "onTouch" ) && child.onTouch != "" && !_rootObject.hasOwnProperty( child.onTouch ) ) {
				throw new Error( "The public method [" + child.onTouch + "] is not defined in " + _rootObject + ".\rRemove the [onTouch] method name in [" + child + "] with the instance name [" + child.name + "] Flash Pro or add`in " + _rootObject + ":\r\tpublic function " + child.onTouch + "(e:starling.event.Event):void {\r\t}" );
			}
			return bt;
		}
		
		private function getTexture( child : BFDisplayObject, textureName : String, w : Number, h : Number ) : Texture {
			if ( textureName == "" ) {
				//trace( new Error( "No texture defined in '" + child + " - name: "+child.name+"' in "+_displayObject+". Default texture used." ) );
				return Texture.empty( w, h );
			} else {
				var tex : Texture = _assetManager.getTexture( textureName );
				if ( tex == null ) {
					trace( new Error( "Texture '" + textureName + "' defined in '" + child + " - name: " + child.name + "' in " + _displayObject + " doesn't exist. Default texture used." ) );
					return Texture.empty( w, h );
				}
				return tex;
			}
		}
	}

}