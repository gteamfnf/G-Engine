package backend.data;

//todo
typedef SongFile =
{
    var name:String;
    var bpm:Float;
    var speed:Float;
    var sections:Array<Section>;
    @:optional var noteCount:Int;
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

class Song
{
    
}