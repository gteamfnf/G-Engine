package backend;

/**
 * Simple class to track highscores in songs.
 */

class Highscores
{
    public static var scores:Map<String, Int> = new Map();
    private static var save:FlxSave;

    public static function init()
    {
        save = new FlxSave();
        save.bind('GEngineTeam', 'scores');

        scores = save.data;
    }

    public static function setScore(song:String, score:Int)
    {
        scores.set(song, score);
        save.mergeData(scores, true);
    }
}