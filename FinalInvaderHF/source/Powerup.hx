package;

import flixel.FlxSprite;
import flixel.FlxG;

/**
 * Powerups
 * Created 7/4/2019
 * Last edited 7/5/2019
 */
class Powerup extends FlxSprite{

	public var pType:Int;
	public function new(?X:Float = 0, ?Y:Float = 0, ?type:Int = 0){
		super(X, Y);
		pType = type;
		if (type == 0){ //extra life
			loadGraphic("assets/images/life.png");
		}else if (type == 1){ //double lazer
			loadGraphic("assets/images/dlazer.png");
		}else if (type == 2){ //triple lazer
			loadGraphic("assets/images/tlazer.png");
		}
		y = -50;
		x = FlxG.random.int(0, 450);
	}
	
	override public function update(elapsed:Float):Void{
		y+= 3;
	}
	
}