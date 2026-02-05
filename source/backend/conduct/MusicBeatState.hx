package backend.conduct;

import backend.conduct.Conductor.IConductor;

import backend.scripting.*;
#if gscript
import backend.scripting.hscript.*;
#end

import flixel.FlxState;
import backend.conduct.*;

import backend.Controls;

class MusicBeatState extends FlxState implements IConductor implements IScriptable
{
    public var conductor:Conductor;
    public var controls:Controls;

    #if gscript
    public var gscript:FunkinGScript;
    #end

    override public function new(state:String = 'MusicBeatState')
    {
        super();
    }

    override public function create()
    {        
        super.create();

        conductor = new Conductor(this);
        controls = new Controls();

        #if gscript
        gscript.call('create');
        #end
    }

    public function createPost() 
    {
        #if gscript
        gscript.call('createPost');
        #end
    }

    override public function update(elapsed:Float) 
    {
        super.update(elapsed);

        conductor.update(elapsed);

        #if gscript
        gscript.call('update', elapsed);
        #end
    }

    public function stepHit(curStep:Int) {}

    public function beatHit(curBeat:Int) {}

    public function measureHit(curMeasure:Int) {}
}