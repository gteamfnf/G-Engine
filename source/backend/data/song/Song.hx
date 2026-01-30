package backend.data.song;

//todo
typedef SongFile =
{
    var name:String;
    var bpm:Float;
    var speed:Float;
    var sections:Array<Section>;
    var players:Array<String>;
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