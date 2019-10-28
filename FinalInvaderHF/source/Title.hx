package;
import flixel.FlxSprite;
/**
 * Title Sprite
 * Created 6/27/2019
 * Last edited 6/27/2019
 */
class Title extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic("assets/images/title.png");
		x = 17;
		y = 100;
	}
	
}