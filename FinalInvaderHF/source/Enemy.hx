package;
import flixel.FlxSprite;
import flixel.FlxG;
/**
 * All of the Enemies
 * Created 6/27/2019
 * Last Edited 7/4/2019
 */
class Enemy extends FlxSprite
{
	var eType:Int;
	var player:Player;
	var moveCounter:Int = 0;
	var shootCounter:Int = 0;
	var moveDir:Float = 5;
	public var shoot:Bool;
	public var inWorld:Bool;
	public function new(?X:Float=0, ?Y:Float=0, ?type:Int=0){
		super(X, Y);
		eType = type;
		if (eType == 0){ //Red
			loadGraphic("assets/images/enemy-1.png");
		}else if (eType == 1){ //Blue
			loadGraphic("assets/images/enemy-2.png");
		}else if (eType == 2){ //Green
			loadGraphic("assets/images/enemy-3.png");
		}else if (eType == 3){ //Orange
			loadGraphic("assets/images/enemy-4.png");
		}
		y = -50;
		x = FlxG.random.int(0, 450);
	}
	
	override public function update(elapsed:Float):Void{
		if (eType == 0){
			redBehavior();
		}else if (eType == 1){
			bluBehavior();
		}else if (eType == 2){
			grnBehavior();
		}else if (eType == 3){
			orgBehavior();
		}
		if (y >= 660){
			destroy();
		}
		super.update(elapsed);
	}
	
	private function redBehavior():Void{
		y += 5;
	}
	
	private function bluBehavior():Void{
		y += 2.5;
		x += moveDir;
		if (x <= 0 || x >= 450){
			moveDir *= -1;
		}
	}
	
	private function grnBehavior():Void{
		y += 10;
	}
	
	private function orgBehavior():Void{
		while (y < 0){
			y += 5;
		}
		moveCounter++;
		if (moveCounter <= 500){
			x += moveDir;
			if (x <= 0 || x >= 450){
				moveDir *= -1;
			}
			shootCounter++;
            if(shootCounter >= 100){
                shoot = true;
                shootCounter = 0;
            } 
		}else{
			y += 5;
		}
	}
	
	public function die():Void{
		loadGraphic("assets/images/explosion.png", true, 66, 54);
		animation.add("explode", [0, 1, 2, 3], 20, false);
		animation.play("explode");
	}
	
}