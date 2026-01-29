package backend.utils;

import sys.io.File;

class RandomUtil
{
    inline public static function getRandomFromArray(array:Array<Dynamic>):Dynamic
    {
        return array[FlxG.random.int(0, array.length-1)];
    }

    public static function coolTextFile(path:String):Array<String>
    {
        var file = File.getContent(path);
        return file.split('\n');
    }
}