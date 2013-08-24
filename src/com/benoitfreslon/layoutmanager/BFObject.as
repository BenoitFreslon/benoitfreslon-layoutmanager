package com.benoitfreslon.layoutmanager
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	public class BFObject extends MovieClip 
	{
		
		[Inspectable(name = "tag",type = "Number")]
		public var tag:Number = 0;
		
		[Inspectable(name = "className",type = "String")]
		public var className:String = "";
		
		[Inspectable(name = "visible",type = "Boolean", defaultValue="true")]
		public var isVisible:Boolean = true;
		
		[Inspectable(name = "position", type = "List", defaultValue = "Relative", enumeration = "Relative, Absolute")]
		public var position:String;
		
		[Inspectable(name = "touchable", type = "Boolean", defaultValue = "true")]
		public var touchable:Boolean = true;
		
		[Inspectable(name = "flipX", type = "Boolean", defaultValue = "false")]
		public var flipX:Boolean = false;
		
		[Inspectable(name = "flipY", type = "Boolean", defaultValue = "false")]
		public var flipY:Boolean = false;
		
		public var mainClass:String = "";
		public var params:Object = { };
		public function BFObject() 
		{
			super();
		}
		
	}

}