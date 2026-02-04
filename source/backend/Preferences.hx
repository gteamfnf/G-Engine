package backend;

class PrefData
{
    public function new() {}

    public var downscroll:Bool = false;
}

class Preferences
{
    public static var data = {
        downscroll: false,
        initialized: false
    };

    public static function initData()
    {
        FlxG.save.bind("GEngineTeam", "funkin");
        if (FlxG.data.initialized == true)
        {
            data = FlxG.save.data;
        }
    }

    public static function saveData()
    {
        FlxG.save.data = data;
        FlxG.flush();
    }
}