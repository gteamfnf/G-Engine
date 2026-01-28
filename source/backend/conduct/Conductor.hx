package backend.conduct;

import flixel.FlxBasic;

interface IConductor {
    var conductor:Conductor;
}

typedef TimeSignature =
{
    var beats:Int;
    @:optional var noteValue:Int;
}

class Conductor extends FlxBasic
{
    public var bpm:Float;
    public var time:Float = 0;
    public var stepCall:Int->Void = null;
    public var beatCall:Int->Void = null;
    public var measureCall:Int->Void = null;
    public var timeSignature:TimeSignature = {beats: 4, noteValue: 4};

    public function new(bpm:Int = 120, stepCall:Int->Void = null, beatCall:Int->Void = null, measureCall:Int->Void = null)
    {
        this.bpm = bpm;
        this.stepCall = stepCall;
        this.beatCall = beatCall;
        this.measureCall = measureCall;
        super();
    }

    public function create()
    {
        
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.sound.music != null) time = FlxG.sound.music.time;
    }

    public function beatHit(curBeat:Int) 
    {
        beatCall(curBeat);
    }

    public function measureHit(curMeasure:Int) 
    {
        measureCall(curMeasure);
    }

    public function stepHit(curStep:Int)
    {
        stepCall(curStep);
    }
}