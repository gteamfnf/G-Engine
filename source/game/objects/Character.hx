package game.objects;

import backend.data.stage.StageObject.ObjectPos;

typedef AnimationData =
{
    var animName:String;
    var anim:String;
    @:optional var offsets:Array<Dynamic>;
    @:optional var fps:Int;
    @:optional var loops:Bool;
}

typedef CharacterData = 
{
    var image:String;
    var anims:Array<AnimationData>;
    var singDuration:Float;
    @:optional var icon:String;
    @:optional var pos:ObjectPos;
    @:optional var camPos:ObjectPos;
    @:optional var flipX:Bool;
    @:optional var antialiasing:Bool;
}

class Character extends FunkinSprite
{
    public var char:String = 'bf';
    public var isPlayer:Bool = false;
    private var data:CharacterData;

    public var animOffsets:Map<String, Array<Dynamic>> = new Map<String, Array<Dynamic>>();

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

    public var danced:Bool = false;

    public function playAnim(name:String, force:Bool = false)
    {
        var daOffset = animOffsets.get(name);
		offset.set(daOffset[0], daOffset[1]);

        animation.play(name, force);

        if (char.startsWith('gf-') || char == 'gf')
		{
			if (name == 'singLEFT')
				danced = true;

			else if (name == 'singRIGHT')
				danced = false;

			if (name == 'singUP' || name == 'singDOWN')
				danced = !danced;
		}
    }

    public function create()
    {
        //trace(Paths.getImage('characters/${data.image}'));
        frames = Paths.getFrames('characters/${data.image}');

       //trace(data.anims);

        for (anim in data.anims)
        {
            animOffsets.set(anim.anim, anim.offsets);

            try {
                animation.addByPrefix(
                    anim.anim, 
                    anim.animName, 
                    (anim.fps != null) ? anim.fps : 24, 
                    (anim.loops != null) ? anim.loops : false, 
                    (data.flipX != null) ? data.flipX : false
                );
            }
        }

        if (animation.exists('idle')) playAnim('idle');

        if (data.antialiasing == null)
            data.antialiasing = true;

        antialiasing = data.antialiasing;

        //if (isPlayer) flipX = true;
    }
}