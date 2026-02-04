package backend;

class PrefData
{
    public function new() {}

    public var downscroll:Bool = false;
}

class ClientPrefs
{
    public static var data:PrefData = new PrefData();
}