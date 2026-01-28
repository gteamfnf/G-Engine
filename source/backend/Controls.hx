package backend;

//i'll update this eventually, works for now though.

class Controls
{
    public var UI_UP(get, never):Bool;
    public function get_UI_UP():Bool
    {
        return FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W;
    }

    public var UI_DOWN(get, never):Bool;
    public function get_UI_DOWN():Bool
    {
        return FlxG.keys.justPressed.DOWN || FlxG.keys.justPressed.S;
    }

    public var UI_LEFT(get, never):Bool;
    public function get_UI_LEFT():Bool
    {
        return FlxG.keys.justPressed.LEFT || FlxG.keys.justPressed.A;
    }

    public var UI_RIGHT(get, never):Bool;
    public function get_UI_RIGHT():Bool
    {
        return FlxG.keys.justPressed.RIGHT || FlxG.keys.justPressed.D;
    }

    public function new() {}
}