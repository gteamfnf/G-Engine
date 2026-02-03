package backend.data.song;

typedef PlayerSongData =
{
    var isPlayer:Bool;
    var char:String;
    var id:String; //pos and stuff defined by ID in stage data
    @:optional var hideStrum:Bool;
    @:optional var strumPosX:Int;
    @:optional var strumPosY:Int;
}

//todo
typedef Song =
{
    var name:String;
    var bpm:Float;
    var speed:Float;
    var sections:Array<Section>;
    var players:Array<PlayerSongData>;
    @:optional var noteCount:Int;
    var stage:String;
}

typedef Section =
{
    var notes:Array<NoteData>;
}

typedef NoteData =
{
    var strumTime:Float;
    var note:Int;
}