package backend.conduct;

import flixel.sound.FlxSound;

import sys.io.File;

class MusicHandler
{
    public static var music(get, never):FlxSound;

    public static function get_music():FlxSound
    {
        return FlxG.sound.music;
    }

    inline public static function playMusic(path:String):Float
    {
        FlxG.sound.playMusic(Paths.getMusic(path));

        try {
            return Std.parseFloat(File.getContent(Paths.getMusic(path, 'bpm')));
        }
        catch (e:Dynamic)
        {
            return 102;
        }
    }
}