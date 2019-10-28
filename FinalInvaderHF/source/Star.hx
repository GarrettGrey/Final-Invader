package;

/*
 * Stars that fly down the screen, giving the illusion of moving through space.
 * Created 6/26/2019
 * Last edited 6/26/2019
 */

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

class Star extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0){
		super(X, Y);
		makeGraphic(1, 1, FlxColor.WHITE);
		x = FlxG.random.int(0, 510);
		y = -20;
	}
	
	override public function update(elapsed:Float):Void{
     y+= 10; // move down 10 pixels (i think) every update
     super.update(elapsed);
	}
	
}