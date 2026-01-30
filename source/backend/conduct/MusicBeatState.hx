package backend.conduct;

import backend.conduct.Conductor.IConductor;
import flixel.FlxState;
import backend.conduct.*;

import backend.Controls;

class MusicBeatState extends FlxState implements IConductor
{
    public var conductor:Conductor;
    public var controls:Controls;

    override public function create()
    {        
        super.create();

        conductor = new Conductor(this);
        controls = new Controls();
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