package ;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.FlxSprite;

class GameScoreUI extends FlxSpriteGroup
{
    var _score:FlxText;
    var _debug:FlxText;

    public function new()
    {
        super(0,0);
        setupLabels();
    }

    private function setupLabels():Void
    {
        _score = new FlxText(0,0,200,"score: ");
        _debug = new FlxText(0,20,200,"debug: ");

        _score.size = 18;
        _debug.size = 18;
        _score.color = 0x000000;
        _debug.color = 0x000000;
        _score.borderColor = 0xFFFFFF;
        _debug.borderColor = 0xFFFFFF;
        _score.borderSize = 3;
        _debug.borderSize = 3;

       var labels = [_score, _debug];

        for(l in labels)
        {
            add(l);
        }
    }

    public function setScore(score:Int):Void
    {
        _score.text = "score: "+score;
    }
}
