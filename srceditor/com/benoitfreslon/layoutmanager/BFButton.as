package com.benoitfreslon.layoutmanager {
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	public class BFButton extends BFDisplayObject {
		
		[Inspectable( name="alphaWhenDisabled",type="Number",defaultValue="0.5" )]
		public var alphaWhenDisabled : Number = 0.5;
		
		[Inspectable( name="onTouch",type="String" )]
		public var onTouch : String = "";
		
		[Inspectable( name="enabled",type="Boolean",defaultValue="true" )]
		override public function set enabled( value : Boolean ) : void {
			super.enabled = value;
		}
		
		[Inspectable( name="scaleWhenDown",type="Number",defaultValue="0.9" )]
		public var scaleWhenDown : Number = 0.9;
		
		[Inspectable( name="upState",type="String" )]
		public var upState : String;
		
		[Inspectable( name="downState",type="String" )]
		public var downState : String;
		
		[Inspectable( name="overState",type="String" )]
		public var overState : String;
		
		[Inspectable( name="text",type="String" )]
		public var text : String;
		
		[Inspectable( name="fontBold",type="Boolean" )]
		public var fontBold : Boolean;
		
		[Inspectable( name="fontColor",type="Color",defaultValue="0x000000" )]
		public var fontColor : uint = 0x000000;
		
		[Inspectable( name="fontName",type="String",defaultValue="Verdana" )]
		public var fontName : String = "Verdana";
		
		[Inspectable( name="fontSize",type="Number",defaultValue="12" )]
		public var fontSize : Number = 12;
		
		[Inspectable( name="hAlign",type="List",defaultValue="center",enumeration="center,left,right" )]
		public var textHAlign : String = "center";
		
		[Inspectable( name="vAlign",type="List",defaultValue="center",enumeration="center,bottom,top" )]
		public var textVAlign : String = "center";
		
		public function BFButton() {
			super();
			mainClass = "starling.display.ButtonExtended";
		}
		
		protected override function draw() : void {
			super.draw();
		}
	}

}