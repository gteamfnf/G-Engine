package;

import flixel.FlxGame;
import openfl.display.Sprite;

import game.menus.states.InitState;
class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, InitState, 60, 60, true));
	}
}
