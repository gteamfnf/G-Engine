package game.play.stages;
class StageWeek1 extends BaseStage
{
	override public function new()
	{
		super('stage', 'week1');
	}

	override function create()
	{
		var bg:FunkinSprite = new FunkinSprite(-600, -200, Paths.getImage('week1/stageback'));
		bg.scrollFactor.set(0.9, 0.9);
		add(bg);

		var stageFront:FunkinSprite = new FunkinSprite(-650, 600, Paths.getImage('week1/stagefront'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		add(stageFront);

		var stageLight:FunkinSprite = new FunkinSprite(-125, -100, Paths.getImage('week1/stage_light'));
		stageLight.setGraphicSize(Std.int(stageLight.width * 1.1));
		stageLight.updateHitbox();
		stageLight.scrollFactor.set(0.9, 0.9);
		add(stageLight);

		var stageLight:FunkinSprite = new FunkinSprite(1225, -100, Paths.getImage('week1/stage_light'));
		stageLight.setGraphicSize(Std.int(stageLight.width * 1.1));
		stageLight.updateHitbox();
		stageLight.flipX = true;
		stageLight.scrollFactor.set(0.9, 0.9);
		add(stageLight);

		trace(PlayState.instance.members);

		super.create();
	}

	override function createPost()
	{
		var stageCurtains:FunkinSprite = new FunkinSprite(-500, -300, Paths.getImage('week1/stagecurtains'));
		stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 1.1));
		stageCurtains.updateHitbox();
		stageCurtains.scrollFactor.set(1.3, 1.3);
		add(stageCurtains);

		super.createPost();
	}
}