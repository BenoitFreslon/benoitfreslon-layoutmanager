benoitfreslon-layoutmanager
===========================

A WYSIWYG layout manager. Build with Flash IDE for the Starling framework and compatible with the CitrusEngine framework.

### INSTALLATION

* Create an ActionScript 3.0 project
* Add the [Starling](https://github.com/PrimaryFeather/Starling-Framework) framework or the [CitrusEngine](https://github.com/alamboley/Citrus-Engine) framework in your project
* Add the **benoitfreslon-layoutmanager/src** in the source path of your ActionScript 3.0 project
* Copy the **sample.fla** file from the **benoitfreslon-layoutmanager/sample** folder in your own folder
* Open the **sample.fla** file with Flash IDE and set the source path to the src folder: **benoitfreslon-layoutmanager/src**
* Build the **sample.swc** with Flash IDE
* Add the **sample.swc** in your ActionScript 3.0 project


### USAGE

```
package  
{
	import starling.display.Sprite;
	import com.benoitfreslon.layoutmanager.LayoutLoader;
	import starling.events.Event;
	/**
	 * ...
	 * @author Benoît Freslon
	 */
    public class Game extends Sprite
    {

		
        public function Game()
        {
			super();
			
			var ll:LayoutLoader = new LayoutLoader();
			ll.loadLayout(this, DemoLayout, Main.assets, onLoad);
			
        }
		
		private function onLoad():void 
		{
			// Layout loaded a displayed
			
			
		}
    }

}
```
