package backend.scripting.hscript;

import brainy.gscript.*;
import sys.io.File;
import sys.FileSystem;

import backend.scripting.*;

/**
 * Class that injects functions to HScript/GScript
 */

class FunkinGScript extends GScript
{
    public static var extensions:Array<String> = [
        "gx",
        "hx",
        "hxc",
        "hscript",
    ];

    override public function new(scriptPath:String, ?config:AutoGScriptConfig)
    {
        var path = '';
        for (extension in extensions)
        {
            path = Paths.getScript(scriptPath, extension);

            if (FileSystem.exists(path))
            {
                break;
            }
        }

        var script = 'import flixel.*;\n' + File.getContent(path);

        super(script, config);

        set('GEngine', GEngine);
        set('FlxColor', GColor);
        set('GColor', GColor);

        var controls = Reflect.field(FlxG.state, "controls");

        if (controls != null)
            set("controls", controls);
        else
            set("controls", new Controls());

    }

    override public function call(func:String, args:Array<Dynamic> = null)
    {
        if (exists(func))
            return super(func, args);
        else 
            return null;
    }
}