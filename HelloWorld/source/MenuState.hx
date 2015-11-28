package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.addons.ui.FlxButtonPlus;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
    var _debugText:FlxText;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */


	override public function create():Void
	{
        _debugText = new FlxText(0,0,100, "hello world!");

		add(_debugText);
        
		var backgroundSprite = new FlxSprite();
		backgroundSprite.loadGraphic("assets/images/title.jpg");
		add(backgroundSprite);
		var _btnPlay = new FlxButtonPlus(400, 300, clickPlay, "Play", 60,40);
		add(_btnPlay);
		super.create();
	}

	private function clickPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
    public function logText(message:String):Void
    {
        _debugText.text = message;
    }
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}
