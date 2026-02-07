package backend.data.conversion.psych;

import game.objects.Character.CharacterData;

typedef PsychAnim = {
	var anim:String;
	var name:String;
	var fps:Int;
	var loop:Bool;
	var indices:Array<Int>;
	var offsets:Array<Int>;
}

typedef PsychCharacter = {
	var animations:Array<PsychAnim>;
	var image:String;
	var scale:Float;
	var sing_duration:Float;
	var healthicon:String;

	var position:Array<Float>;
	var camera_position:Array<Float>;

	var flip_x:Bool;
	var no_antialiasing:Bool;
	var healthbar_colors:Array<Int>;
	var vocals_file:String;
	@:optional var _editor_isPlayer:Null<Bool>;
}

class PsychCharConverter
{
    public static function convert(data:Dynamic):CharacterData
    {
        data.pos = {x: data.position[0], y: data.position[1]};
        Reflect.deleteField(data, 'position');

        data.camPos = {x: data.camera_position[0], y: data.camera_position[1]};
        Reflect.deleteField(data, 'camera_position');

        data.flipX = data.flip_x;
        Reflect.deleteField(data, 'flip_x');

        data.antialiasing = !data.no_antialiasing;
        Reflect.deleteField(data, 'no_antialiasing');

        data.icon = data.healthicon;
        Reflect.deleteField(data, 'healthicon');

        data.singDuration = data.sing_duration;
        Reflect.deleteField(data, 'sing_duration');

        data.anims = new Array();

        var anims:Array<PsychAnim> = cast data.animations;

        for (anim in anims)
        {
            data.anims.push(
                {
                    animName: anim.name,
                    anim: anim.anim,
                    fps: anim.fps,
                    offsets: anim.offsets,
                    loops: anim.loop,
                });
        }

        return cast data;
    }
}