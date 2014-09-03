package com.benoitfreslon.layoutmanager {
	
	import com.benoitfreslon.layoutmanager.BFObject;
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	public class BFImage extends BFObject {
		[Inspectable( name="texture",type="String" )]
		public var texture : String = "";
		
		[Inspectable( name="smoothing",type="List",defaultValue="bilinear",enumeration="none,bilinear,trilinear" )]
		public var smoothing:String = "bilinear";
		
		public function BFImage() {
			super();
			mainClass = "starling.display.Image";
		}
	
	}

}