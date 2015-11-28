package ;

import flixel.util.FlxPoint;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxAngle;
import flixel.util.FlxColor;

class Player extends FlxSprite{
    public var speed:Float = 2000;
    var added:Bool = false;

    public function new(X:Float=0, Y:Float=0) {
        super(X, Y);

        loadGraphic("assets/images/dude_sprites.png", true, 455, 455);
        animation.add("walk", [0,1,0,1],20,false);
        animation.add("fly", [2,3,2,3],20,true);
        animation.add("butt",[4],10,true);


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
        _up = FlxG.keys.anyPressed(["UP"]);
        _down = FlxG.keys.anyPressed(["DOWN"]);
        _left = FlxG.keys.anyPressed(["LEFT"]);
        _right = FlxG.keys.anyPressed(["RIGHT"]);

        if (_up && _down)
            _up = _down = false;
        if (_left && _right)
            _left = _right = false;

        var mA:Float = 0;

        if (_up || _down || _left || _right){
//            added = false;
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
        if(FlxG.keys.justPressed.SPACE)
        {
            velocity =  new FlxPoint(0,0);
        }

        if(FlxG.keys.justReleased.A)
        {
            animation.play("fly");
        }

        if(FlxG.keys.justReleased.S)
        {
            animation.play("butt");
        }
        super.update();
    }

}
