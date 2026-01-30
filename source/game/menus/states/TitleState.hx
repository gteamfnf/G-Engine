package game.menus.states;

import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import backend.utils.RandomUtil;
import flixel.text.FlxText;
import flixel.effects.FlxFlicker;

class TitleState extends MusicBeatState
{
    var text:FlxText;

    var logo:FlxSprite;
    var pressEnter:FlxSprite;    

    override public function create()
    {
        super.create();

        conductor.bpm = MusicHandler.playMusic('freakyMenu');

        text = new FlxText();
        var path = Paths.getPath('data/introText.txt');
        var texts = RandomUtil.coolTextFile(path);
        text.text = RandomUtil.getRandomFromArray(texts);
        text.screenCenter();

        logo = new FlxSprite(-150, -100);
		logo.frames = Paths.getFrames('logoBumpin');

		logo.animation.addByPrefix('bump', 'logo bumpin', 24, false);
		logo.animation.play('bump');
		logo.updateHitbox();

        pressEnter = new FlxSprite(100, 576);
        pressEnter.frames = Paths.getFrames('titleEnter');

		pressEnter.animation.addByPrefix('idle', "ENTER IDLE", 24);
		pressEnter.animation.addByPrefix('press', "ENTER PRESSED");

		pressEnter.animation.play('idle');
		pressEnter.updateHitbox();

        add(logo);
        add(pressEnter);
        add(text);

        //add(text);
    }

    var curTime:Float = 0;

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        if (controls.ACCEPT)
        {
            pressEnter.animation.play('press');

            FlxFlicker.flicker(pressEnter, 1, 0.06);
            
            new FlxTimer().start(1, function(timer:FlxTimer) {
                FlxG.switchState(new game.play.states.PlayState());
            });
        }

        var textColor = Math.sin(curTime);

        pressEnter.color = FlxColor.fromRGBFloat(textColor, 1, 1);

        curTime += elapsed;

        text.text = '${conductor.time}';
    }

    override public function beatHit(curBeta:Int)
    {
        logo.animation.play('bump');
        FlxG.sound.play(Paths.getSound('scrollMenu'));
    }
}