package com.benoitfreslon.layoutmanager {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	 * The native layout must be a base class of a MovieClip in Flash IDE.
	 * @author Benoît Freslon
	 * @see NativeLayoutManager
	 */
	public class NativeLayout extends MovieClip {
		
		public var clickFunction:Function = null;
		
		public function NativeLayout() {
			super();
		}
		
		/**
		 *
		 * @param	bt
		 */
		public function click( bt:NativeSimpleButton ):void {
			trace( "NativeMenu", bt, clickFunction );
			if ( clickFunction != null ) {
				clickFunction( bt );
			} else {
				throw new Error( "The property clickFunction is not overrided" );
			}
		}
	}
}