package starling.display {
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	public class ButtonExtended extends Button {
		
		
		public override function get upState():Texture 
		{
			return super.upState;
		}
		
		public override function set upState(value:Texture):void 
		{
			_upStateTemp = value;
			super.upState = value;
		}
		protected var _upState : Texture;
		protected var _upStateTemp:Texture;
		
		public function get overState():Texture 
		{
			return _overState;
		}
		
		public function set overState(value:Texture):void 
		{
			_overState = value;
		}
		protected var _overState : Texture;
		
		protected var isRollOver : Boolean = false;
		
		public var onTouch : Function = function( e : Event ) : void {
			throw new Error("ButtonExtented: The 'onTouch' method is not defined in " + this.name + ".") ;
		};
		public var onRollOver : Function = function() : void {
		
		};
		public var onRollOut : Function = function() : void {
		
		};
		
		public function ButtonExtended( upStateTexture : Texture, text : String = "", downStateTexture : Texture = null, overStateTexture : Texture = null ) {
			super( upStateTexture, text, downStateTexture );
			scaleWhenDown = 0.9;
			upState = upStateTexture;
			_upStateTemp = upState;
			overState = overStateTexture;
			addEventListener( Event.ADDED_TO_STAGE, added );
			addEventListener( Event.REMOVED_FROM_STAGE, removed );
			addEventListener( TouchEvent.TOUCH, handleTouch );
		}
		
		protected function handleTouch( te : TouchEvent ) : void {
			if (!enabled) return;
			if ( te.getTouch( this, TouchPhase.HOVER ) ) {
				if ( !isRollOver ) {
					rollOver();
					isRollOver = true;
				}
			} else if (!te.getTouch( this, TouchPhase.BEGAN ) && !te.getTouch( this, TouchPhase.STATIONARY ) && !te.getTouch( this, TouchPhase.MOVED ) && !te.getTouch( this, TouchPhase.ENDED )  ) {
				if (isRollOver) {
					rollOut();
					isRollOver = false;
				}
			}
		}
		
		public function rollOver() : void {
			onRollOver();
			if ( overState ) {
				super.upState = overState;
			}
		}
		
		public function rollOut() : void {
			onRollOut()
			super.upState = _upStateTemp;
		}
		
		protected function added( e : Event ) : void {
			removeEventListener( Event.ADDED_TO_STAGE, added );
			addEventListener( Event.TRIGGERED, triggered );
		}
		
		protected function triggered( e : Event ) : void {
			onRollOut();
			onTouch( e );
			
		}
		
		protected function removed( e : Event ) : void {
			removeEventListener( Event.REMOVED_FROM_STAGE, removed );
			removeEventListener( Event.TRIGGERED, triggered );
			removeEventListener( TouchEvent.TOUCH, onTouch );
		
		}
	}
}