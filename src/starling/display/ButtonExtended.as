package starling.display {
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	public class ButtonExtended extends Button {
		
		public var onTouch : Function = function( e : Event ) : void { trace("ButtonExtented: The 'onTouch' method is not defined in " + this.name + "." );
		};
		
		public function ButtonExtended( upState : Texture, text : String = "", downState : Texture = null ) {
			super( upState, text, downState );
			scaleWhenDown = 0.9;
			
			addEventListener( Event.ADDED_TO_STAGE, added );
			addEventListener( Event.REMOVED_FROM_STAGE, removed );
		}
		
		private function added( e : Event ) : void {
			removeEventListener( Event.ADDED_TO_STAGE, added );
			addEventListener( Event.TRIGGERED, triggered );
		}
		
		protected function triggered( e : Event ) : void {
			onTouch( e );
		}
		
		private function removed( e : Event ) : void {
			removeEventListener( Event.REMOVED_FROM_STAGE, removed );
			removeEventListener( Event.TRIGGERED, triggered );
		}
	
	}

}