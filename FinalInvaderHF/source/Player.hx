package;
/*
 * The Player
 * Created 6/25/2019
 * Last edited 7/4/2019
 */

import flixel.FlxSprite;
//import flixel.system.FlxAssets.FlxGraphicAsset;
//import flixel.util.FlxColor;
import flixel.FlxG;

class Player extends FlxSprite
{
	var deadCounter:Int;
	public var speed:Float = 400;
	public var isDead:Bool = false;
	var projInWorld:Bool = false;
	public var gameOver:Bool = false;
	public var readyChange:Bool = false;
	public function new(?X:Float=0, ?Y:Float=0){
		super(X, Y);
		loadGraphic("assets/images/player.png");
		drag.x = 10000; //No visable momentum; player stops when button is released
		x = 215;
		y = -50;
	}
	
	override public function update(elapsed:Float):Void{
		if (y < 550){
			y += 10;
		}
		if(!isDead){
			movement();
		}else if(!gameOver){
			deadCounter++;
			if (deadCounter >= 100){
				loadGraphic("assets/images/player.png");
				x = 215;
				isDead = false;
				deadCounter = 0;
			}
		}else{
			deadCounter++;
			if (deadCounter >= 100){
				loadGraphic("assets/images/gameover.png");
				x = 75;
				y = 200;
				if (FlxG.keys.anyPressed([SPACE])){
					readyChange = true;
				}
			}
		}
		super.update(elapsed);
	}
	
	function movement():Void{
		var left:Bool = false;
		var right:Bool = false;
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);
		if (left && right)left = right = false;
		if (right){
			velocity.x = speed;
		}else if (left){
			velocity.x = -speed;
		}
		if (x > 430){
			x = 430; //stop on left edge
		}else if (x < 0){
			x = 0; //stop on right edge
		}
	}
	
	public function die():Void{
		isDead = true;
		loadGraphic("assets/images/explosion.png", true, 66, 54);
		animation.add("explode", [0, 1, 2, 3], 20, false);
		animation.play("explode");
	}
}