package backend.macros;

class SimpleMacros
{
  macro static public function macroPrint(msg:String)
  {
    Sys.println(msg);
    return macro null;
  }
}
