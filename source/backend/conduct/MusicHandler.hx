package backend.conduct;

import flixel.system.frontEnds.SoundFrontEnd;
import sys.FileSystem;
import flixel.sound.FlxSound;

import sys.io.File;

class MusicHandler
{
    public static var sound(get, never):SoundFrontEnd;
    public static var sounds:Map<String, SoundFrontEnd> = new Map();

    public static function get_sound():SoundFrontEnd
    {
        return FlxG.sound;
    }

    inline public static function playMusic(path:String, flxSound:SoundFrontEnd = null, pathOverride:String = 'music'):Float
    {
        if (flxSound == null) flxSound = sound;
        sound.playMusic(Paths.getMusic(path, 'ogg', pathOverride = 'music'));

        try {
            return Std.parseFloat(File.getContent(Paths.getMusic(path, 'bpm')));
        }
        catch (e:Dynamic)
        {
            return 102;
        }
    }

    inline public static function playSong(songName:String, voices:Bool = true)
    {
        if (voices)
        {
            sounds.set('voices-player', new SoundFrontEnd());
            sounds.set('voices-opponent', new SoundFrontEnd());
            sounds.set('voices', new SoundFrontEnd());
            if (FileSystem.exists(Paths.getMusic(songName + '/Voices-Player'))) playMusic(songName + '/Voices', sounds.get('voices-player'));
            if (FileSystem.exists(Paths.getMusic(songName + '/Voices-Opponent'))) playMusic(songName + '/Voices', sounds.get('voices-opponent'));
            if (FileSystem.exists(Paths.getMusic(songName + '/Voices'))) playMusic(songName + '/Voices', sounds.get('voices'));
        }

       playMusic(songName + '/Inst');
    }
}