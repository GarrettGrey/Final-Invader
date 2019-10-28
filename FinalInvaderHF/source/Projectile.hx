package;
import flixel.FlxSprite;

/**
 * Projectiles
 * Created 7/1/2019
 * Last edited 7/4/2019
 */
class Projectile extends FlxSprite
{
	public var inWorld:Bool;
	public var pType:Int;
	public function new(?X:Float=0, ?Y:Float=0, ?type:Int=0){
		super(X, Y);
		pType = type;
		if(pType == 0){
			loadGraphic("assets/images/player-lazer.png");
		}else loadGraphic("assets/images/enemy-lazer.png");
		
	}
	
	override public function update(elapsed:Float):Void{
		if(pType == 0){
			y -= 20;
		}else{
			y += 20;
		}
		super.update(elapsed);
	}
	
}