package com.benoitfreslon.layoutmanager {
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Benoît Freslon
	 */
	public class BFTextField extends BFDisplayObject {
		
		[Inspectable( name="autoScale",type="Boolean",defaultValue="false" )]
		public function get autoScale() : Boolean {
			return _autoScale;
		}
		
		public function set autoScale( value : Boolean ) : void {
			_autoScale = value;
			draw();
		}
		private var _autoScale:Boolean = false;
		
		[Inspectable( name="kerning",type="Boolean",defaultValue="true" )]
		public function get kerning() : Boolean {
			return _kerning;
		}
		
		public function set kerning( value : Boolean ) : void {
			_kerning = value;
			draw();
		}
		private var _kerning:Boolean = true;
		
		[Inspectable( name="autoSize",type="List",defaultValue="none",enumeration="bothDirections, horizontal, none, vertical" )]
		public function get autoSize() : String {
			return _autoSize;
		}
		
		public function set autoSize( value : String ) : void {
			_autoSize = value;
			draw();
		}
		private var _autoSize : String = "none";
		
		[Inspectable( name="batchable",type="Boolean",defaultValue="false" )]
		public function get batchable() : Boolean {
			return _batchable;
		}
		
		public function set batchable( value : Boolean ) : void {
			_batchable = value;
			draw();
		}
		private var _batchable : Boolean = false;
		
		[Inspectable( name="bold",type="Boolean",defaultValue="false" )]
		public function get bold() : Boolean {
			return _bold;
		}
		
		public function set bold( value : Boolean ) : void {
			_bold = value;
			draw();
		}
		private var _bold : Boolean = false;
		
		[Inspectable( name="border",type="Boolean",defaultValue="false" )]
		public function get border() : Boolean {
			return _border;
		}
		
		public function set border( value : Boolean ) : void {
			_border = value;
			draw();
		
		}
		private var _border : Boolean = false;
		
		[Inspectable( name="color",type="Color",defaultValue="#000000" )]
		public function get color() : uint {
			return _color;
		}
		
		public function set color( value : uint ) : void {
			
			_color = value;
			draw();
		}
		private var _color : uint = 0x000000;
		
		[Inspectable( name="fontName",type="Font Name",defaultValue="Verdana" )]
		public function get fontName() : String {
			return _fontName;
		}
		
		public function set fontName( value : String ) : void {
			_fontName = value;
			draw();
		}
		private var _fontName : String = "Verdana";
		
		[Inspectable( name="fontSize",type="Number",defaultValue="12" )]
		public function get fontSize() : Number {
			return _fontSize;
		}
		
		public function set fontSize( value : Number ) : void {
			_fontSize = value;
			draw();
		}
		private var _fontSize : Number = 12;
		
		[Inspectable( name="hAlign",type="List",defaultValue="center",enumeration="center,left,right" )]
		public function get hAlign() : String {
			return _hAlign;
		}
		
		public function set hAlign( value : String ) : void {
			_hAlign = value;
		}
		private var _hAlign : String = "center";
		
		[Inspectable( name="vAlign",type="List",defaultValue="center",enumeration="center,bottom,top" )]
		public function get vAlign() : String {
			return _vAlign;
		}
		
		public function set vAlign( value : String ) : void {
			_vAlign = value;
		}
		private var _vAlign : String = "center";
		
		[Inspectable( name="text",variable="text",type="String" )]
		public function set text( t : String ) : void {
			_text = t;
			draw();
		}
		
		public function get text() : String {
			return _text;
		}
		
		private var _text : String = "";
		
		[Inspectable( name="italic",type="Boolean",defaultValue="false" )]
		public function get italic() : Boolean {
			return _italic;
		}
		
		public function set italic( value : Boolean ) : void {
			_italic = value;
			draw();
		}
		private var _italic : Boolean = false;
		
		[Inspectable( name="underline",type="Boolean",defaultValue="false" )]
		public function get underline() : Boolean {
			return _underline;
		}
		
		public function set underline( value : Boolean ) : void {
			_underline = value;
			draw();
		}
		// TODO vertiacal align
		private var _underline : Boolean = false;
		
		private var _tf : TextField = new TextField();
		
		public function BFTextField() {
			super();
			mainClass = "starling.text.TextField";
			
			//addChild( _tf );
			_tf.multiline = true;
		}
		
		protected override function draw() : void {
			super.draw();
		/*
		   _text = _text.replace( "\\n", "<br />" );
		
		   _tf.textColor = _color;
		   _tf.border = _border;
		
		   var htmlItalic : String = "";
		   if ( _italic )
		   htmlItalic = "<i>";
		   var htmlBold : String = "";
		   if ( _bold )
		   htmlBold = "<b>";
		   var htmlUnderline : String = "";
		   if ( _underline )
		   htmlUnderline = "<u>";
		
		   _tf.htmlText = "<p align='" + _hAlign + "'>" + htmlBold + htmlItalic + htmlUnderline + "<font face='" + _fontName + "' size='" + _fontSize + "' color='" + _color + "' >" + _text;
		
		   _tf.width = scaleX * 100;
		   _tf.height = scaleY * 100;
		
		   if ( _vAlign ) {
		   _tf.autoSize = TextFieldAutoSize.CENTER;
		   } else {
		   _tf.autoSize = TextFieldAutoSize.NONE;
		   }
		   _tf.x = -_tf.width / 2;
		   _tf.y = -_tf.height / 2;
		 */
		}
	}

}