package backend.conduct;

import backend.conduct.Conductor.IConductor;
import flixel.FlxState;
import backend.conduct.*;

class MusicBeatState extends FlxState implements IConductor
{
    public var conductor:Conductor = new Conductor();
}