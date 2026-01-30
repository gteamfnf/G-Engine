package backend.data.stage;

typedef ObjectPos =
{
    @:optional var x:Float;
    @:optional var y:Float;
}

typedef StageObjectData =
{
    var id:String;
    var image:String;
    @:optional var pos:ObjectPos;
    @:optional var angle:Float;
    @:optional var scale:ObjectPos;
}