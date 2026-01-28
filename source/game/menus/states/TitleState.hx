package game.menus.states;
class TitleState extends MusicBeatState
{
    override public function create()
    {
        super.create();

        conductor.bpm = MusicHandler.playMusic('freakyMenu');
    }

    override public function beatHit(curBeat:Int)
    {
        trace('Beat Hit!');
        FlxG.sound.play(Paths.getSound('scrollMenu'));
    }
}