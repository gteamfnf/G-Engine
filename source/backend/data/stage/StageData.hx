package backend.data.stage;

import backend.data.stage.*;
import backend.data.stage.StageObject.ObjectPos;

typedef CharacterStageData = {
    var id:String;
    @:optional var pos:ObjectPos;
    @:optional var camOffset:ObjectPos;
    @:optional var angle:Float;
    @:optional var scale:ObjectPos;
    @:optional var scrollFactor:ObjectPos;
    @:optional var blendMode:String;
}
typedef StageData =
{
    var characters:Array<CharacterStageData>;
    @:optional var zoom:Int;
}