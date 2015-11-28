package ;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxAngle;
import flixel.util.FlxColor;

class Player extends FlxSprite{
    public var speed:Float = 200;

    public function new(X:Float=0, Y:Float=0) {
        super(X, Y);

        loadGraphic("assets/images/dude.png");

        drag.x = drag.y = 1600;
    }

    private function movement():Void
    {
        var _up:Bool = false;
        var _down:Bool = false;
        var _left:Bool = false;
        var _right:Bool = false;

        _up = FlxG.keys.anyPressed(["UP", "W"]);
        _down = FlxG.keys.anyPressed(["DOWN", "S"]);
        _left = FlxG.keys.anyPressed(["LEFT", "A"]);
        _right = FlxG.keys.anyPressed(["RIGHT", "D"]);

        if (_up && _down)
            _up = _down = false;
        if (_left && _right)
            _left = _right = false;

        var mA:Float = 0;

        if (_up || _down || _left || _right){
        if (_up)
        {
            mA = -90;
            if (_left)
                mA -= 45;
            else if (_right)
                mA += 45;
        }
        else if (_down)
        {
            mA = 90;
            if (_left)
                mA += 45;
            else if (_right)
                mA -= 45;
        }
        else if (_left)
            mA = 180;
        else if (_right)
            mA = 0;

            FlxAngle.rotatePoint(speed, 0, 0, 0, mA, velocity);
        }
    }

    override public function update():Void {
        movement();
        super.update();
    }

}
