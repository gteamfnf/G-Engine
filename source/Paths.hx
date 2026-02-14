package;

import openfl.utils.Assets;
import flixel.graphics.FlxGraphic;
import openfl.display.Bitmap;
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

    inline public static function getMusic(key:String, fileExt = 'ogg', path = 'music')
    {
        return getPath('$path/${key}.$fileExt');
    }
    
    inline public static function getScript(key:String, fileExt = 'gx')
    {
        return getPath('scripts/${key}.$fileExt');
    }

    inline public static function getJsonData(key:String, pathOverride:String = null):Dynamic //recommended you use casting!
    {
        if (pathOverride == null) pathOverride = 'data';
        var path = getPath('$pathOverride/$key.json');
        var rawJSON = File.getContent(path);

        try {
            return Json.parse(rawJSON);
        }
        catch(e:Dynamic)
        {
            return null;
        }
    }

    public static var graphicCache:Map<String, FlxGraphic> = new Map();

    /**
     * Adds graphic to image cache, and returns it.
     * @param key 
     * @return FlxGraphic
     */
    public static function cacheImage(key:String):FlxGraphic
    {
        if (graphicCache.exists(key)) return graphicCache.get(key);
        var bmp = Assets.getBitmapData(key);
        var grpc = FlxGraphic.fromBitmapData(bmp);
        graphicCache.set(key, grpc);

        return grpc;
    } 

    inline public static function getFrames(key:String):FlxAtlasFrames
    {
        return FlxAtlasFrames.fromSparrow(
            Paths.getImage(key),
            Paths.getImage(key, 'xml')
        );
    }
}