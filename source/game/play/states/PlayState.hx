package game.play.states;

import backend.data.song.Song;
import flixel.FlxState;
import game.objects.Character;

import game.play.stages.*;

class PlayState extends MusicBeatState
{
	public var characters:Map<String, Character> = new Map();

	public static var instance:PlayState = null;

	public var SONG:Song;

	public function makeCharacter(id:String, char:String, isPlayer:Bool = false, x:Float = 0, y:Float = 0):Character
	{
		var ch = new Character(x, y, char, isPlayer);
		characters.set(id, ch);
		return ch;
	}

	inline public function addCharacter(id:String)
	{
		if (characters.exists(id)) add(characters.get(id));
	}

	inline public function insertCharacter(id:String, order:Int)
	{
		if (characters.exists(id)) insert(order, characters.get(id));
	}
	
	override public function create()
	{
		instance = this;
		SONG = cast Paths.getJsonData('normal', 'data/test');

		super.create();

		switch(SONG.stage)
		{
			case 'stage':
				new StageWeek1();

			default:
				new BaseStage(SONG.stage);
		}
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
