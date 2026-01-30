package;

import sys.io.File;
import haxe.Json;
class Paths
{
    inline public static function getPath(path:String)
    {
        return 'assets/shared/$path'; //lazy but extendable
    }

    inline public static function getImage(key:String, fileExt = 'png')
    {
        return getPath('images/${key}.$fileExt');
    }

    inline public static function getSound(key:String, fileExt = 'ogg')
    {
        return getPath('sounds/${key}.$fileExt');
    }

    inline public static function getMusic(key:String, fileExt = 'ogg')
    {
        return getPath('music/${key}.$fileExt');
    }

    inline public static function getJsonData(key:String, pathOverride:String = null):Dynamic //recommended you use casting!
    {
        if (pathOverride != null) pathOverride = 'data';
        var path = getPath('$pathOverride/$key.png');
        var rawJSON = File.getContent(path);

        return Json.parse(rawJSON);
    }

    inline public static function getFrames(key:String):FlxAtlasFrames
    {
        return FlxAtlasFrames.fromSparrow(
            Paths.getImage(key),
            Paths.getImage(key, 'xml')
        );
    }
}