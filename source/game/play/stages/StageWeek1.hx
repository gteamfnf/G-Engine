package game.play.stages;

import game.play.stages.objects.BGSprite;
class StageWeek1 extends BaseStage
{
	override public function new()
	{
		super('stage', 'week1');
	}

	override function create()
	{
		var bg:FlxSprite = new FlxSprite(-600, -200, Paths.getImage('week1/stageback'));
		bg.scrollFactor.set(0.9, 0.9);
		add(bg);

		var stageFront:FlxSprite = new FlxSprite(-650, -600, Paths.getImage('week1/stagefront'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		add(stageFront);

		var stageLight:FlxSprite = new FlxSprite(-125, -100, Paths.getImage('week1/stage_light'));
		stageLight.setGraphicSize(Std.int(stageLight.width * 1.1));
		stageLight.updateHitbox();
		stageLight.scrollFactor.set(0.9, 0.9);
		add(stageLight);

		var stageLight:FlxSprite = new FlxSprite(1225, -100, Paths.getImage('week1/stage_light'));
		stageLight.setGraphicSize(Std.int(stageLight.width * 1.1));
		stageLight.updateHitbox();
		stageLight.flipX = true;
		stageLight.scrollFactor.set(0.9, 0.9);
		add(stageLight);

		var stageCurtains:FlxSprite = new FlxSprite(-500, -300, Paths.getImage('week1/stagecurtains'));
		stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 1.1));
		stageCurtains.updateHitbox();
		add(stageCurtains);

		trace(PlayState.instance.members);

		super.create();
	}
}