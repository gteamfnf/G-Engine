package game.menus.states;

import backend.utils.RandomUtil;
import flixel.text.FlxText;

class TitleState extends MusicBeatState
{
    var text:FlxText;

    var logo:FlxSprite;

    

    override public function create()
    {
        super.create();

        conductor.bpm = MusicHandler.playMusic('freakyMenu');

        text = new FlxText();
        var path = Paths.getPath('data/introText.txt');
        var texts = RandomUtil.coolTextFile(path);
        trace(texts);
        text.text = RandomUtil.getRandomFromArray(texts);
        text.screenCenter();

        logo = new FlxSprite(-150, -100);
		logo.frames = FlxAtlasFrames.fromSparrow(
            Paths.getImage('logoBumpin'),
            Paths.getImage('logoBumpin', 'xml')
        );

		logo.animation.addByPrefix('bump', 'logo bumpin', 24, false);
		logo.animation.play('bump');
		logo.updateHitbox();

        add(logo);

        //add(text);
    }

    override public function beatHit(curBeat:Int)
    {
        logo.animation.play('bump');
    }
}