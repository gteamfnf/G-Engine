package game.play.stages;

import backend.conduct.*;

class BaseStage extends FlxBasic implements IConductor
{
    public var stage:String = 'default';

    override public function new(stage:String)
    {
        this.stage = stage;

        super();
        conductor = new Conductor(this);
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
