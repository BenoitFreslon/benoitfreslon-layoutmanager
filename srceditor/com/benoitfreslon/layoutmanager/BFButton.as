package com.benoitfreslon.layoutmanager {
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	public class BFButton extends BFTextField {
		
		[Inspectable( name="onTouch",type="String" )]
		public var onTouch : String = "";
		
		[Inspectable( name="alphaWhenDisabled",type="Number",defaultValue="0.5" )]
		public var alphaWhenDisabled : Number = 0.5;
		
		[Inspectable( name="scaleWhenDown",type="Number",defaultValue="0.9" )]
		public var scaleWhenDown : Number = 0.9;
		
		[Inspectable( name="upState",type="String" )]
		public var upState : String = "";
		
		[Inspectable( name="downState",type="String" )]
		public var downState : String = "";
		
		[Inspectable( name="overState",type="String" )]
		public var overState : String = "";
		
		public function BFButton() {
			super();
			mainClass = "starling.display.ButtonExtended";
		}
		
		protected override function draw() : void {
			super.draw();
		
		}
	}

}