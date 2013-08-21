package com.benoitfreslon.layoutmanager {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.AssetManager;
	
	/**
	 * Loader of Layout
	 * @version 1.01
	 * @author Benoît Freslon
	 */
	public class LayoutLoader {
		private var _movieclip : MovieClip;
		private var _displayObject : DisplayObjectContainer;
		private var _assetManager : AssetManager;
		static public var debug:Boolean = false;
		private var onLoad : Function = function() : void {
		};
		
		public function LayoutLoader() {
		
		}
		
		public function loadLayout( displayObject : DisplayObjectContainer, LayoutClass : Class, assetManager : AssetManager, callBack : Function = null ) : void {
			_displayObject = displayObject;
			_assetManager = assetManager;
			_movieclip = new LayoutClass();
			_movieclip.addEventListener( Event.ENTER_FRAME, layoutLoaded );
			if ( onLoad != null )
				onLoad = callBack
		}
		
		private function layoutLoaded( e : Event ) : void {
			_movieclip.removeEventListener( Event.ENTER_FRAME, layoutLoaded );
			var child : BFObject;
			var n : int = _movieclip.numChildren;
			
			for ( var i : uint = 0; i < n; ++i ) {
				child = _movieclip.getChildAt( i ) as BFObject;
				
				if ( child && child is BFObject ) {
					if ( child.mainClass ) {
						
						var objectClass : Class
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
						} else if ( child.mainClass == "starling.display.sprite" ) {
							obj = addSprite( objectClass, child as BFSprite );
						} else {
							trace( new Error( "No mainClass defined " + child ) );
						}
						
						if ( child.hasOwnProperty( "params" ) ) {
							for ( var metatags : String in child.params ) {
								if ( obj.hasOwnProperty( metatags ) )
									obj[ metatags ] = child.params[ metatags ];
							}
						}
						obj.name = child.name;
						
						obj.pivotX = obj.width / 2;
						obj.pivotY = obj.height / 2;
						obj.x = child.x;
						obj.y = child.y;
						//obj.scaleX = child.scaleX;
						//obj.scaleY = child.scaleY;
						obj.alpha = child.alpha;
						obj.rotation = child.rotation;
						obj.visible = child.isVisible;
						_displayObject.addChild( obj );
						
						if ( obj.hasOwnProperty( "tag" ) ) {
							obj[ "tag" ] = child.tag;
						}
						
						if ( _displayObject.hasOwnProperty( child.name ) ) {
							_displayObject[ child.name ] = obj as objectClass;
						}
					} else {
						trace( new Error( "No className defined " + child ) );
					}
				}
			}
			loaded();
		}
		
		private function loaded() : void {
			_assetManager = null;
			_displayObject = null;
			_movieclip = null;
			onLoad();
		}
		
		private function addImage( objectClass : Class, child : BFImage ) : Image {
			var img : Image = new objectClass( _assetManager.getTexture( child.texture ) ) as Image;
			//img.pivotX = img.width / 2;
			//img.pivotY = img.height / 2;
			return img;
		}
		
		private function addSprite( objectClass : Class, child : BFSprite ) : Sprite {
			var s : Sprite = new objectClass() as Sprite;
			
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
			t.underline = child.underline;
			//t.pivotX 		= t.width / 2;
			//t.pivotY		= t.height / 2;
			return t;
		}
		
		private function addButton( objectClass : Class, child : BFButton ) : Button {
			var bt : Button = new objectClass( _assetManager.getTexture( child.upState ) ) as Button;
			bt.fontBold = child.fontBold;
			bt.fontColor = child.fontColor;
			bt.fontName = child.fontName;
			bt.fontSize = child.fontSize;
			bt.text = child.text;
			//bt.pivotX 		= bt.width / 2; 
			if ( child.downState )
				bt.downState = _assetManager.getTexture( child.downState );
			if ( bt.hasOwnProperty( "onTouch" ) && _displayObject.hasOwnProperty( child.onTouch ) ) {
				bt[ "onTouch" ] = _displayObject[ child.onTouch ];
			} else if (bt.hasOwnProperty( "onTouch" )) {
				trace( new Error("The public method " + child.onTouch + " is not defined in " + _displayObject));
			}
			return bt;
		}
	
	}

}