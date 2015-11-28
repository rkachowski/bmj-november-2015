package ;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxAngle;
import flixel.util.FlxColor;

class Player extends FlxSprite{
    public var speed:Float = 2000;
    var added:Bool = false;

    public function new(X:Float=0, Y:Float=0) {
        super(X, Y);

        loadGraphic("assets/images/dude_walking.png", true, 405, 409);
        animation.add("walk", [0,1,0,1],10,false);

        drag.x = drag.y = 1600;
    }

    private function movement():Void
    {
        var _up:Bool = false;
        var _down:Bool = false;
        var _left:Bool = false;
        var _right:Bool = false;

        angle = 0;
        added = true;
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
            added = false;
        if (_up)
        {
            angle = -30;
            mA = -90;
            if (_left)
                mA -= 45;
            else if (_right){
                mA += 45;
            }
        }
        else if (_down)
        {
            angle = 40;
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
        if(!added)
        {
            animation.play("walk");
        }
        super.update();
    }

}
