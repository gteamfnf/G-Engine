package backend.scripting;

import backend.scripting.*;
import backend.scripting.hscript.*;
import backend.scripting.lua.*;

interface IScriptable =
{
    #if gscript
    public var gscript:FunkinGScript;
    #end
}