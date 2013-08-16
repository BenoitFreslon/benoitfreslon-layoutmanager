benoitfreslon-layoutmanager
===========================

A visual layout manager. Build with Flash IDE for the Starling framework and compatible with the CitrusEngine framework.
Usefull to build simple game interfaces, huds, menus, popups, etc.

## Description

* Use Flash IDE to compose a visual layout.
* Use the custom Flash components and use the LayoutLoader class to display the layout in real time in your game.
* Use the basic class of Starling of use your own classes.

Flash Components

### Default values

For all objects the origin is in the **center** of the object.
All objects has a default className (eg: BFImage > starling.display.Image).

### Custom parameters

Set a **className** parameter that extends the current class or use the basic class 
(Eg: If **MyTextField** extends **starling.text.TextField** your can set the className parameter : **MyTextField**).

You also can create a new MovieClip in the layout editor in Flash IDE that extends a **BFObject** to set default parameters.
```
var params:Object = {className:"MyCustomClass", upState: "btn_start_upState", downState: "btn_start_downState"};
```

Add parameters variables if you want to set default parameters and additional parameters in the MovieClip in Flash IDE:
```
var params:Object = {myCustomParam: 42};
```

Then add customs parameters in your custom class MyCustomClass like this:
```
public var myCustomParam:int;
```

Set the instance name of all objects in Flash IDE.
Then the name of the variables should match with the instance name.

Finally declare public variables in your class and use the variable type you set.
```
public var btn_start:Button;
```

**All parameter values are defined when the Layout is loaded.**



### BFImage - starling.display.Image

Set the texture name in the component parameter to load the texture.

Parameters :
* texture

#### **BFButton** - startling.display.Button
* Texture upState
* Texture downState
* onTouch
* text
* fontName
* fontSize
* color
* ...

### **BFTextField** - startling.text.TextField
* text
* fontName
* fontSize
* color
* ...

## INSTALLATION

* Create an ActionScript 3.0 project
* Add the [Starling](https://github.com/PrimaryFeather/Starling-Framework) framework or the [CitrusEngine](https://github.com/alamboley/Citrus-Engine) framework in your project
* Add the **benoitfreslon-layoutmanager/src** in the source path of your ActionScript 3.0 project
* Copy the **sample.fla** file from the **benoitfreslon-layoutmanager/sample** folder in your own folder
* Open the **sample.fla** file with Flash IDE and set the source path to the src folder: **benoitfreslon-layoutmanager/src**
* Build the **sample.swc** with Flash IDE
* Add the **sample.swc** in the library project


## USAGE

### In Flash IDE

* In the **sample.fla** create a new MovieClip symbol
* Check **Add to AciontScript**
* Set a class name like **MainMenuLayout** that extends **MovieClip**
* Click OK
* Add instances of BFImage, BFButton, BFTextField, etc.
* Set an **instance name** if you want and set the ***onTouch*** method if you want in the BFButton instance
* Scale, rotate, move all objects.
* Customise the components in the **Component parameters** panel
* When it's done compile the swc

### Source examle

In your code source ;

Import the LayoutLaoder:
```
import com.benoitfreslon.layoutmanager.LayoutLoader;
```

Add all your assets in your ***AssetManager*** instance like this :
```
var assets:AssetManager = new AssetManager();
```

Create an instance of the LayoutLoader class to load a layout.
Then define the callBack method (onLoad) in your class.
```
var ll:LayoutLoader = new LayoutLoader();
ll.loadLayout(this, MainMenuLayout, assets, onLoad);
```




#### Source code example


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
