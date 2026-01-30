package game.objects;

import backend.data.stage.StageObject.ObjectPos;

typedef AnimationData =
{
    var animName:String;
    var anim:String;
    @:optional var offsets:Array<Int>;
    @:optional var fps:Int;
    @:optional var loops:Bool;
}

typedef CharacterData = 
{
    var image:String;
    var anims:Array<AnimationData>;
    @:optional var icon:String;
    @:optional var pos:ObjectPos;
    @:optional var flipX:Bool;
}

class Character extends FunkinSprite
{
    public var char:String = 'bf';
    public var isPlayer:Bool = false;
    private var data:CharacterData;

    public function new(x:Float = 0, y:Float = 0, char:String = 'bf', isPlayer:Bool = false)
    {
        this.char = char;
        this.isPlayer = isPlayer;

        data = cast Paths.getJsonData(char, 'characters');

        if (data.pos != null)
        {
            if (data.pos.x != null) x += data.pos.x;
            if (data.pos.y != null) y += data.pos.y;
        }

        super(x, y);

        create();
    }

    public function create()
    {
        trace(Paths.getImage('characters/${data.image}'));
        frames = Paths.getFrames('characters/${data.image}');

        for (anim in data.anims)
        {
            animation.addByPrefix(
                anim.animName, 
                anim.anim, 
                (anim.fps != null) ? anim.fps : 24, 
                (anim.loops != null) ? anim.loops : false, 
                (data.flipX != null) ? data.flipX : false
            );
        }

        if (animation.exists('idle')) animation.play('idle');
    }
}