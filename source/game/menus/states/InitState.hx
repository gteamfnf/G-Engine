package game.menus.states;

class InitState extends FlxState
{
    override public function create()
    {
	    Preferences.initData();
        FlxG.switchState(new game.menus.states.TitleState());
    }
}