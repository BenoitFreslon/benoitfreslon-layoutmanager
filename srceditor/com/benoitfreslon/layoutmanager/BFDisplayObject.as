package com.benoitfreslon.layoutmanager {
	import flash.display.MovieClip;
	import flash.display.Shape;
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	public class BFDisplayObject extends MovieClip {

		[Inspectable( name="tag",type="Number" )]
		public var tag : Number = 0;
		
		[Inspectable( name="userData",type="String" )]
		public var userData : String = "";
		
		[Inspectable( name="className",type="String" )]
		public var className : String = "";
		
		[Inspectable( name="touchable",type="Boolean",defaultValue="true" )]
		public var touchable : Boolean = true;
		
		[Inspectable( name = "blendMode", type = "List", defaultValue = "auto", enumeration = "add,auto,below,erase,multiply,none,normal,screen" )]
		override public function set blendMode( value : String ) : void {
			_blendMode = value;
			draw();
		}
		override public function get blendMode():String {
			return _blendMode;
		}
		private var _blendMode:String = "auto";
		
		[Inspectable( name="pivotX",type="Number",defaultValue="0.5" )]
		public function set pivotX( value : Number ) : void {
			_pivotX = value;
			draw();
		}
		
		public function get pivotX() : Number {
			return _pivotX;
		}
		private var _pivotX : Number = 0.5;
		
		[Inspectable( name="pivotY",type="Number",defaultValue="0.5" )]
		public function set pivotY( value : Number ) : void {
			_pivotY = value;
			draw();
			super.blendMode
		}
		
		public function get pivotY() : Number {
			return _pivotY;
		}
		private var _pivotY : Number = 0.5;
				
		[Inspectable( name="useHandCursor",type="Boolean",defaultValue="true" )]
		override public function set useHandCursor( value : Boolean ) : void {
			super.useHandCursor = value;
			draw();
		}
		
		public var mainClass : String = "";
		public var params : Object = {};
		private const ARR : Array = [ BFButton, BFImage, BFDisplayObject, BFTextField ];
		
		private var pivot : Shape = new Shape();
		
		public function BFDisplayObject() {
			
			super();
			
			pivot.graphics.beginFill( 0xFFFF00 );
			pivot.graphics.lineStyle( 2, 0XFF0000 );
			pivot.graphics.drawCircle( 0, 0, 5 );
			addChild( pivot );
			
			draw();
		}
		
		public function setSize( w : Number, h : Number ) : void {
			//_width = w;
			//_height = h;
			draw();
		}
		
		protected function draw() : void {
			//super.draw();
			pivot.x = width * ( pivotX - 0.5 );
			pivot.y = height * ( pivotY - 0.5 );
		
		}
	}

}