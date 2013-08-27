package com.benoitfreslon.layoutmanager {
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	public class BFButton extends BFTextField {
		[Inspectable( name="text",type="String" )]
		
		[Inspectable( name="onTouch",type="String" )]
		public var onTouch : String = "";
		
		[Inspectable( name="fontName",type="String",defaultValue="Verdana" )]
		
		[Inspectable( name="alphaWhenDisabled",type="Number",defaultValue="0.5" )]
		public var alphaWhenDisabled : Number = 0.5;
		
		[Inspectable( name="fontColor",type="Color",defaultValue="#FFFFFF" )]
		
		public function get fontColor() : uint {
			return color;
		}
		
		public function set fontColor( value : uint ) : void {
			color = value;
		}
		
		[Inspectable( name="textHAlign",type="String",defaultValue="center" )]
		
		public function get textHAlign() : String {
			return hAlign;
		}
		
		public function set textHAlign( value : String ) : void {
			hAlign = value;
		}
		
		[Inspectable( name="textVAlign",type="String",defaultValue="center" )]
		
		public function get textVAlign() : String {
			return vAlign;
		}
		
		public function set textVAlign( value : String ) : void {
			vAlign = value;
		}
		
		[Inspectable( name="fontBold",type="Boolean" )]
		
		public function get fontBold() : Boolean {
			return bold;
		}
		
		public function set fontBold( value : Boolean ) : void {
			bold = value;
		}
		private var _fontBold : Boolean = false;
		
		[Inspectable( name="enabled",type="Boolean",defaultValue="true" )]
		public var isEnabled : Boolean = false;
		
		[Inspectable( name="upState",type="String" )]
		public var upState : String = "";
		
		[Inspectable( name="downState",type="String" )]
		
		public var downState : String = "";
		
		public function BFButton() {
			super();
			mainClass = "starling.display.ButtonExtended";
		}
		
		protected override function draw() : void {
			super.draw();
		
		}
	}

}