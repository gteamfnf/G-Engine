package game.play.stages;

import backend.Controls;
import backend.data.stage.StageData;
import game.objects.Character;

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

    inline public function insert(obj:Dynamic, order:Int)
    {
        PlayState.instance.insert(obj, order);
    }

    public function create()
    {
        for (char in data.characters)
        {
            var charName:String = 'bf';
            for (ch in PlayState.instance.SONG.players)
            {
                if (ch.id == char.id)
                {
                    charName = ch.char;
                    break;
                }
            }
            var character = new Character(0, 0, charName);
        }
    }

    override public function update(elapsed:Float) 
    {
        super.update(elapsed);

        conductor.update(elapsed);
    }

    public function stepHit(curStep:Int) {}

    public function beatHit(curBeat:Int) {}

    public function measureHit(curMeasure:Int) {}
}
