package;

class GEngine
{
    /**
     * Switches to a softcoded state
     * @param state 
     */
    public static function switchCustomState(state:String)
    {
        FlxG.switchState(new MusicBeatState(state));
    }
}