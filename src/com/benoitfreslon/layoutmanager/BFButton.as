package com.benoitfreslon.layoutmanager {
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	public class BFButton extends BFObject {
		[Inspectable( name="text",type="String" )]
		public var text : String = "";
		
		[Inspectable( name="onTouch",type="String" )]
		public var onTouch : String = "";
		
		[Inspectable( name="fontName",type="String",defaultValue="Verdana" )]
		public var fontName : String = "Verdana";
		
		[Inspectable( name="fontSize",type="Number",defaultValue="12" )]
		public var fontSize : Number = 12;
		
		[Inspectable( name="alphaWhenDisabled",type="Number",defaultValue="0.5" )]
		public var alphaWhenDisabled : Number = 0.5;
		
		[Inspectable( name="fontColor",type="Color",defaultValue="#FFFFFF" )]
		public var fontColor : uint = 0xFFFFFF;
		
		[Inspectable( name="textHAlign",type="String",defaultValue="center" )]
		public var textHAlign : String = "center";
		
		[Inspectable( name="textVAlign",type="String",defaultValue="center" )]
		public var textVAlign : String = "center";
		
		[Inspectable( name="fontBold",type="Boolean" )]
		public var fontBold : Boolean = false;
		
		[Inspectable( name="italic",type="Boolean" )]
		public var italic : Boolean = false;
		
		[Inspectable( name="border",type="Boolean" )]
		public var border : Boolean = false;
		
		[Inspectable( name="underline",type="Boolean" )]
		public var underline : Boolean = false;
		
		[Inspectable( name="enabled",type="Boolean",defaultValue="true" )]
		public var isEnabled : Boolean = false;
		
		[Inspectable( name="Texture upState",type="String" )]
		public var upState : String = "";
		
		[Inspectable( name="Texture downState",type="String" )]
		public var downState : String = "";
		
		public function BFButton() {
			super();
			 mainClass = "starling.display.Button";
		}
	
	}

}