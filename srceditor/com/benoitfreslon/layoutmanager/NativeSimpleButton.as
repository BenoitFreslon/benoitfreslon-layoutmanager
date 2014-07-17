package com.benoitfreslon.layoutmanager {
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * This class must be a base class of a SimpleButton Object. Just set an instance name on this object. This instance name is also the method name defined in the NativeLayoutManager instance when the button is clicked. By default the "click" method is called in NativeLayoutManager.
	 * @author Benoît Freslon
	 * @see NativeLayoutManager
	 */
	public class NativeSimpleButton extends SimpleButton {
		public function NativeSimpleButton() {
			super();
			addEventListener( Event.ADDED_TO_STAGE, added );
		}
		
		private function added( e:Event ):void {
			removeEventListener( Event.ADDED_TO_STAGE, added );
			addEventListener( Event.REMOVED_FROM_STAGE, removed );
			addEventListener( MouseEvent.CLICK, click );
		}
		
		private function removed( e:Event ):void {
			removeEventListener( Event.REMOVED_FROM_STAGE, removed );
			removeEventListener( MouseEvent.CLICK, click );
		}
		
		/**
		 *
		 * @param	e
		 */
		protected function click( e:MouseEvent ):void {
			( MovieClip( parent ) as NativeLayout ).click( e.currentTarget as NativeSimpleButton );
		}
	}

}