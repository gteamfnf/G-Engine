package backend.conduct;

import flixel.FlxBasic;
import Reflect;

//things that Conductor should use this interface!
interface IConductor {
    var conductor:Conductor;
    public function stepHit(curStep:Int):Void;
    public function beatHit(curBeat:Int):Void;
    public function measureHit(curMeasure:Int):Void;
}

typedef TimeSignature =
{
    var beats:Int;
    var noteValue:Int;
}

class Conductor
{    
    public var time:Float = 0;
    public var timeSignature:TimeSignature = {beats: 4, noteValue: 4};

    public var parent:Dynamic;

    public var curMeasure:Int = 0;
    public var curBeat:Int = 0;
    public var curStep:Int = 0;

    public var bpm(default, set):Float;

    public function set_bpm(v:Float)
    {
        parent.conductor = new Conductor(parent, v);
        return v;
    }

    public function new(parent:Dynamic, bpm:Float = 102)
    {
        this.parent = parent;
        this.bpm = bpm;
    }

    public function update(elapsed:Float)
    {
        if (FlxG.sound.music == null) return;

        time = FlxG.sound.music.time;
        //trace(time);

        var stepLengthMs:Float = (60 / bpm) * 1000 / 4;
        var newStep:Int = Math.floor(time / stepLengthMs);

        while (curStep < newStep)
        {
            stepHitInternal();
        }
    }

    function stepHitInternal()
    {
        curStep++;
        stepHit();

        if (curStep % 4 == 0)
            beatHitInternal();

        var stepsPerMeasure = timeSignature.beats*4;
        if (curStep % stepsPerMeasure == 0)
            measureHitInternal();
    }

    function beatHitInternal()
    {
        curBeat++;
        parent.beatHit(curBeat);
    }

    function measureHitInternal()
    {
        curMeasure++;
        parent.measureHit(curMeasure);
    }

    public function stepHit()
    {
        parent.stepHit(curStep);
    }
}