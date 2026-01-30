package game.play.states;

import flixel.FlxState;
import game.objects.Character;

class PlayState extends MusicBeatState
{
	var bf:Character;
	override public function create()
	{
		bf = new Character(0, 0, 'bf', true);
		bf.screenCenter();
		add(bf);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	override public function beatHit(curBeat:Int)
	{
		bf.animation.play('idle', true);
	}
}
