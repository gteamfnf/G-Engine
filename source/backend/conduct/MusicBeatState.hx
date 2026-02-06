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

    inline public function call(func:String, ?args:Array<Dynamic>)
    {
        if (gscript == null)
            return null;
        else
            return gscript.call(func, args);
    }

    override public function new(state:String = null)
    {
        super();

        if (state == null) return;

        #if gscript
        try 
        {
            gscript = new FunkinGScript('states/' + state, this);
        }
        catch(e:Dynamic)
        {
            Sys.println('Error executing script!');
            gscript = null;
        }
        #end
    }

    override public function create()
    {        
        super.create();

        conductor = new Conductor(this);
        controls = new Controls();

        #if gscript
        call('create');
        #end
    }

    public function createPost() 
    {
        #if gscript
        call('createPost');
        #end
    }

    override public function update(elapsed:Float) 
    {
        super.update(elapsed);

        conductor.update(elapsed);

        #if gscript
        call('update', [elapsed]);
        #end
    }

    public function stepHit(curStep:Int) 
    {
        #if gscript
        call('stepHit', [curStep]);
        #end
    }

    public function beatHit(curBeat:Int) 
    {
        call('beatHit', [curBeat]);
    }

    public function measureHit(curMeasure:Int) 
    {
        call('measureHit', [curMeasure]);
    }
}