package;

import flixel.FlxGame;
import openfl.display.Sprite;
import game.menus.states.InitState;
import backend.macros.SimpleMacros;

class Main extends Sprite
{
	public function new()
	{
		SimpleMacros.macroPrint("
 $$$$$$\        $$$$$$$$\                     $$\                     
$$  __$$\       $$  _____|                    \__|                    
$$ /  \__|      $$ |      $$$$$$$\   $$$$$$\  $$\ $$$$$$$\   $$$$$$\  
$$ |$$$$\       $$$$$\    $$  __$$\ $$  __$$\ $$ |$$  __$$\ $$  __$$\ 
$$ |\_$$ |      $$  __|   $$ |  $$ |$$ /  $$ |$$ |$$ |  $$ |$$$$$$$$ |
$$ |  $$ |      $$ |      $$ |  $$ |$$ |  $$ |$$ |$$ |  $$ |$$   ____|
\$$$$$$  |      $$$$$$$$\ $$ |  $$ |\$$$$$$$ |$$ |$$ |  $$ |\$$$$$$$\ 
 \______/       \________|\__|  \__| \____$$ |\__|\__|  \__| \_______|
                                    $$\   $$ |                        
                                    \$$$$$$  |                        
                                     \______/       
");
		super();
		addChild(new FlxGame(0, 0, InitState, 60, 60, true));
	}
}
