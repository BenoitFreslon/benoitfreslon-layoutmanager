package com.benoitfreslon.layoutmanager {
	import flash.display.Stage;
	import starling.core.Starling;
	import starling.display.Sprite;
	
	/**
	 * The NativeLayoutManager could be extends.
	 * All click events are dispatched here.
	 *
	 * <code>NativeSimpleButton</code> > <code>NativeLayout</code> > <code>NativeLayoutManager</code>
	 *
	 * <p>
	 * Example:
	 * <code>
	 * public class GameNativeMenuManager extends NativeLayoutManager {
	 *
	 *		public function GameNativeMenuManager( cl:Class ) {
	 *			super( cl );
	 *		}
	 *
	 *		override protected function click( bt:NativeSimpleButton ):void {;
	 *			super.click( bt );
	 *		}
	 * 		public function clickPlay(bt:NativeSimpleButton):void {
	 * 			// This method is called when the button named "clickPlay" is clicked.
	 * 		}
	 *	}
	 * </code>
	 * </p>
	 *
	 * Display a layout:
	 * <code>
	 * var nativeMenu:GameNativeMenuManager = new GameNativeMenuManager(Home);
	 * nativeMenu.destroy();
	 *
	 * </code>
	 *
	 *
	 * @author Benoît Freslon
	 */
	public class NativeLayoutManager {
		
		protected var _class : Class;
		protected var _mc : NativeLayout;
		
		protected var _stage : Stage = Starling.current.nativeStage;
		protected var _nativeOverlay : flash.display.Sprite = Starling.current.nativeOverlay;
		protected var _scaleFactor : Number = Starling.contentScaleFactor;
		
		static public var current : NativeLayoutManager;
		
		/**
		 *
		 * @param	cl	Class of the NativeLayout exported in ActionScript in Flash IDE.
		 */
		public function NativeLayoutManager( cl : Class ) {
			super();
			_class = cl;
			
			if ( current ) {
				current.destroy();
			}
			current = this;
			clean();
			
			_mc = new _class() as NativeLayout;
			_mc.clickFunction = click;
			//_mc.scaleX = _mc.scaleY *= Assets.getInstance().scaleFactor;
			_mc.x = _stage.stageWidth / 2 * 1 / _scaleFactor;
			_mc.y = _stage.stageHeight / 2 * 1 / _scaleFactor;
			
			_mc.scaleX = _scaleFactor;
			_mc.scaleY = _scaleFactor;
			_nativeOverlay.addChild( _mc );
		}
		
		private function clean() : void {
			while ( _nativeOverlay.numChildren ) {
				_nativeOverlay.removeChildAt( 0 );
			}
		}
		
		public function destroy() : void {
			clean();
			if ( _mc && _nativeOverlay.contains( _mc ) )
				_nativeOverlay.removeChild( _mc );
			_class = null;
			_stage = null;
			_mc = null;
			current = null;
		}
		
		protected function click( bt : NativeSimpleButton ) : void {
			if ( hasOwnProperty( bt.name ) ) {
				this[ bt.name ]( bt );
			} else {
				trace( new Error( "No public method with name " + bt.name + " is defined in " + this ) );
			}
		}
	}
}