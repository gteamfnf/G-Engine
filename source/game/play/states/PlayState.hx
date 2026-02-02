package game.play.states;

import flixel.FlxState;
import game.objects.Character;

class PlayState extends MusicBeatState
{
	public var characters:Map<String, Character> = new Map();

	public static function makeCharacter(id:String, char:String, isPlayer:Bool = false, x:Float = 0, y:Float = 0):Character
	{
		var ch = new Character(x, y, char, isPlayer);
		characters.set(id, ch);
		return ch;
	}
	
	override public function create()
	{
		makeCharacter('bf', 'bf', true).screenCenter();
		add(characters.get('bf'));

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	override public function beatHit(curBeat:Int)
	{
		for (char in characters)
			char.animation.play('idle', true);
	}
}
