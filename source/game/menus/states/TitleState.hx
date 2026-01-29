package game.menus.states;

import backend.utils.RandomUtil;
import flixel.text.FlxText;

class TitleState extends MusicBeatState
{
    var text:FlxText;

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

        add(text);
    }

    override public function beatHit(curBeat:Int)
    {
        trace('Beat Hit!');
        FlxG.sound.play(Paths.getSound('scrollMenu'));
    }
}