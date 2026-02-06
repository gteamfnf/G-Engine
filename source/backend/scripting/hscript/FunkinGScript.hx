package backend.scripting.hscript;

import brainy.gscript.*;
import brainy.gscript.GScriptConfig.AutoGScriptConfig;
import sys.io.File;
import sys.FileSystem;

import backend.scripting.*;

import flixel.group.FlxSpriteGroup;

/**
 * Class that injects functions to HScript/GScript
 */

class FunkinGScript extends GScript
{
    public var parent:Dynamic;
    
    public static var extensions:Array<String> = [
        "gx",
        "hx",
        "hxc",
        "hscript",
    ];

    private function _add(flx:FlxSprite) 
    {
        if (parent != null) 
        {
            if (Reflect.field(parent, 'add'))
            {
                parent.add(flx);
            }
        }
    }

    override public function new(scriptPath:String, parent:Dynamic = null, ?config:AutoGScriptConfig)
    {
        this.parent = parent;
        var path = '';
        for (extension in extensions)
        {
            path = Paths.getScript(scriptPath, extension);
            Sys.println(path);

            if (FileSystem.exists(path))
            {
                break;
            }
        }

        var script = 'import flixel.*;\n' + File.getContent(path);

        trace(script);

        super(script, config);

        set('GEngine', GEngine);
        set('FlxColor', GColor);
        set('GColor', GColor);

        set("add", _add);
        set("game", parent);
        set("CustomState", MusicBeatState);

        var controls = Reflect.field(FlxG.state, "controls");

        if (controls != null)
            set("controls", controls);
        else
            set("controls", new Controls());

    }

    override public function call(func:String, args:Array<Dynamic> = null)
    {
        if (exists(func))
            return super.call(func, args);
        else 
            return null;
    }
}
