package game.play.stages;

import backend.Controls;
import backend.data.stage.StageData;
import game.objects.Character;

/**
 * File used for all softcoded stages, all hardcoded stages should extend this.
 */
class BaseStage extends FlxBasic implements IConductor
{
    public var stage:String = 'default';
	public var conductor:Conductor;
    public var data:StageData;

    var controls(get, never):Controls;

    function get_controls():Controls
        return PlayState.instance.controls;

    override public function new(stage:String)
    {
        this.stage = stage;

        super();

        data = Paths.getJsonData(this.stage, 'stages');
        conductor = new Conductor(this);

        create();
    }

    inline public function add(obj:Dynamic)
    {
        PlayState.instance.add(obj);
    }

    inline public function insert(order:Int, obj:FlxBasic)
    {
        PlayState.instance.insert(order, obj);
    }

    private inline function nullCheckedValue(v:Dynamic, def:Dynamic):Dynamic
    {
        if (v == null) return def;
        else return v;
    }

    public function create()
    {
        for (char in data.characters)
        {
            var charName:String = 'bf';
            if (PlayState.instance.SONG != null)
                for (ch in PlayState.instance.SONG.players)
                {
                    if (ch.id == char.id)
                    {
                        charName = ch.char;
                        break;
                    }
                }
            
            var pos = nullCheckedValue(char?.pos, {x: 0, y: 0});
            var charX = nullCheckedValue(char.pos?.x, 0);
            var charY = nullCheckedValue(char.pos?.y, 0);
            var character = PlayState.instance.makeCharacter(char.id, charName, charX, charY);
            add(character);
        }

        createPost();
    }

    public function createPost() {}

    override public function update(elapsed:Float) 
    {
        super.update(elapsed);

        conductor.update(elapsed);
    }

    public function stepHit(curStep:Int) {}

    public function beatHit(curBeat:Int) {}

    public function measureHit(curMeasure:Int) {}
}
