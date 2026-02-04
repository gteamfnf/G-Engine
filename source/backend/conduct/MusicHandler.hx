package backend.conduct;

import flixel.sound.FlxSound;

import sys.io.File;

class MusicHandler
{
    public static var sound(get, never):FlxSound;
    public static var sounds:Map<String, FlxSound> = new Map();

    public static function get_sound():FlxSound
    {
        return FlxG.sound.music;
    }

    inline public static function playMusic(path:String, flxSound:FlxSound = null):Float
    {
        if (flxSound == null) flxSound = sound;
        FlxG.sound.playMusic(Paths.getMusic(path));

        try {
            return Std.parseFloat(File.getContent(Paths.getMusic(path, 'bpm')));
        }
        catch (e:Dynamic)
        {
            return 102;
        }
    }

    inline public function playSong(songName:String, voices:Bool)
    {
        playMusic(songName + '/Inst');
        sounds.set('voices', new FlxSound());
        playMusic(songName + '/Voices', sounds.get('voices'));
    }
}