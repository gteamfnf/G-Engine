package backend;

import backend.Highscores;
class Preferences
{
    public static var data = {
        downscroll: false,
        initialized: false
    };

    public static function initData()
    {
        FlxG.save.bind("funkin", "GEngineTeam");
        if (FlxG.save.data.initialized == true)
        {
            data = FlxG.save.data;
        }
        else
        {
            data.initialized = true;
            saveData();
        }
    }

    public static function saveData()
    {
        FlxG.save.mergeData(data, true);
        Highscores.init();
    }
}