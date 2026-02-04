package game.play.stages;

import game.play.stages.objects.BGSprite;
class StageWeek1 extends BaseStage
{
	override public function new()
	{
		super('stage');

		trace(data);
	}
	override function create()
	{
		var bg:BGSprite = new BGSprite('week1/stageback', -600, -200, 0.9, 0.9);
		add(bg);

		var stageFront:BGSprite = new BGSprite('week1/stagefront', -650, 600, 0.9, 0.9);
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		add(stageFront);

		var stageLight:BGSprite = new BGSprite('week1/stage_light', -125, -100, 0.9, 0.9);
		stageLight.setGraphicSize(Std.int(stageLight.width * 1.1));
		stageLight.updateHitbox();
		add(stageLight);

		var stageLight2:BGSprite = new BGSprite('week1/stage_light', 1225, -100, 0.9, 0.9);
		stageLight2.setGraphicSize(Std.int(stageLight2.width * 1.1));
		stageLight2.updateHitbox();
		stageLight2.flipX = true;
		add(stageLight2);

		var stageCurtains:BGSprite = new BGSprite('week1/stagecurtains', -500, -300, 1.3, 1.3);
		stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
		stageCurtains.updateHitbox();
		add(stageCurtains);
	}
}