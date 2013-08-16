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
		
		[Inspectable(name = "Class",type = "String")]
		public var className:String = "";
		
		[Inspectable(name = "visible",type = "Boolean", defaultValue="true")]
		public var isVisible:Boolean = true;
		
		[Inspectable(name = "alpha",type = "Number", defaultValue="1")]
		public var setAlpha:Number = 1;
		
		[Inspectable(name = "Position", type = "List", defaultValue = "Relative", enumeration = "Relative, Absolute")]
		public var position:String;
		
		public var mainClass:String = "";
		public var params:Object = { };
		public function BFObject() 
		{
			super();
		}
		
	}

}