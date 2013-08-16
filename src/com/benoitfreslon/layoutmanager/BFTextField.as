package com.benoitfreslon.layoutmanager {
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	public class BFTextField extends BFObject {
		[Inspectable( name="text",type="String" )]
		public var text : String = "";
		
		[Inspectable( name="fontName",type="String",defaultValue="Verdana" )]
		public var fontName : String = "Verdana";
		
		[Inspectable( name="fontSize",type="Number",defaultValue="12" )]
		public var fontSize : Number = 12;
		
		[Inspectable( name="color",type="Color",defaultValue="#FFFFFF" )]
		public var color : uint = 0xFFFFFF;
		
		[Inspectable( name="hAlign",type="String",defaultValue="center" )]
		public var hAlign : String = "center";
		
		[Inspectable( name="vAlign",type="String",defaultValue="center" )]
		public var vAlign : String = "center";
		
		[Inspectable( name="bold",type="Boolean" )]
		public var bold : Boolean = false;
		
		[Inspectable( name="italic",type="Boolean" )]
		public var italic : Boolean = false;
		
		[Inspectable( name="border",type="Boolean" )]
		public var border : Boolean = false;
		
		[Inspectable( name="underline",type="Boolean" )]
		public var underline : Boolean = false;

		
		public function BFTextField() {
			super();
			mainClass = "starling.text.TextField";
		}
	
	}

}