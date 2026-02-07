package game.menus.states;

#if DO_CONVERSION
import sys.io.File;
import sys.FileSystem;
import haxe.Json;
import backend.data.conversion.psych.*;
#end

class InitState extends FlxState
{
    override public function create()
    {
        #if DO_CONVERSION
        FileSystem.createDirectory('assets/shared/to_convert/characters/converted');
        var i = 0;
        for (path in FileSystem.readDirectory('assets/shared/to_convert/characters'))
        {
            path = 'assets/shared/to_convert/characters/' + path;
            trace(path);
            if (!FileSystem.isDirectory(path))
            {
                var data = Json.parse(File.getContent(path));
                PsychCharConverter.convert(data);

                var raw = Json.stringify(data);
                File.saveContent('assets/shared/to_convert/characters/converted/$i.json', raw);
            }
            i++;
        }
        #end
	    Preferences.initData();
        FlxG.switchState(new game.menus.states.TitleState());
    }
}