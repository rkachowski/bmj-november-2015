package;

import flash.Vector;
import flixel.FlxObject;
import flixel.util.FlxPoint;
import flixel.system.debug.Log;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var _bg:FlxBackdrop;
	var _sky:FlxBackdrop;
	var _ui:GameScoreUI;
	var _catapult:FlxSprite;

	var _dude:Player;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		var _btnBack = new FlxButton(0, 0, "Back", clickBack);

		add(_btnBack);


		_dude = new Player(38,152);
		_dude.scale.x = 0.4;
		_dude.scale.y = 0.4;
		//_dude.angle = -30;

		_bg = new FlxBackdrop("assets/images/endless_gras.png",1,1,true,false);
		_sky = new FlxBackdrop("assets/images/sky.png",1,1,true,false);
		_ui = new GameScoreUI();
		_ui.scrollFactor.x = 0;
		_ui.scrollFactor.y = 0;


		_catapult = new FlxSprite(418,56);
		_catapult.loadGraphic("assets/images/catapult.png");
//		_catapult.scrollFactor.x = 0;
//		_catapult.scrollFactor.y = 0;

		_sky.setPosition(0,FlxG.height - _sky.cachedGraphics.bitmap.height);
		_bg.setPosition(0, FlxG.height - _bg.cachedGraphics.bitmap.height);

		var layers = [_sky,_bg,_ui,_catapult,_dude];

		for(o in layers)
		{
			add(o);
		}

		FlxG.camera.follow(_dude);
		FlxG.camera.setBounds(-50000,-3300,500000,3900);
		super.create();
	}


	function clickBack():Void
	{
		FlxG.switchState(new MenuState());
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
		if(_dude.y > 264) _dude.y = 264;
		if(_dude.y < -3430) _dude.y = -3430;



		if(FlxG.mouse.justPressed)
		{
			trace(FlxG.camera.bounds);

			_ui.debug("position : " + _dude.x +  " " + _dude.y);
//			_dude.setPosition(FlxG.mouse.screenX,FlxG.mouse.screenY);
		}
		super.update();
	}	
}