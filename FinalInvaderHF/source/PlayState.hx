package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.system.FlxSound;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var star:Star;
	var player:Player;
	var enemyCounter:Int = 0;
	var e:Array<Enemy> = [null, null, null, null];
	var eInWorld:Array<Bool> = [false, false, false, false];
	var pProj:Array<Projectile> = [null, null, null];
	var eProj:Array<Projectile> = [null, null, null, null];
	var ppew:FlxSound;
	var score:Counter;
	var lives:Int = 3;
	var livesTxt:FlxText;
	var epew:FlxSound;
	var powup:Powerup;
	var powupInWorld:Bool;
	var powupCounter:Int;
	var powupTimer:Int;
	var dLazer:Bool;
	var tLazer:Bool;
	override public function create():Void{
		player = new Player(20, 20);
		ppew = FlxG.sound.load("assets/sounds/ppew.wav");
		epew = FlxG.sound.load("assets/sounds/epew.wav");
		for (i in 0...4){
			eProj[i] = new Projectile(-50, -50, 1);
		}
		score = new Counter("Score", 0, 0, 0);
		livesTxt = new FlxText(0, 25, 0, "Lives: " + lives , 20);
		add(player);
		for (i in 0...3){
			pProj[i] = new Projectile(-50, -50, 0);
			add(pProj[i]);
		}
		for (i in 0...4){
			add(eProj[i]);
		}
		add(score);
		add(score.txt);
		add(livesTxt);
		FlxG.watch.add(this, "powupCounter");
		FlxG.watch.add(this, "dLazer");
		FlxG.watch.add(this, "tLazer");
		super.create();
	}

	override public function update(elapsed:Float):Void{
		/*Star behavior*/
		star = new Star(20, 20);
		add(star);
		if (star.y >= 640){
			star.destroy();
		}
		/*Powup behavior*/
		//timeout
		powupCounter++;
		if (!player.gameOver && dLazer || tLazer){
			powupTimer++;
			if (powupTimer >= 500){
				if (dLazer) dLazer = false; else if (tLazer) tLazer = false;
				powupTimer = 0;
			}
		}
		if (!player.gameOver && powupInWorld != true && powupCounter >= 700){ //spawn
			powup = new Powerup(0, 0, FlxG.random.int(0, 2));
			add(powup);
			powupInWorld = true;
			powupCounter = 0;
		}
		if (powupInWorld && powup.y >= 660){ //despawn
			powup.destroy();
			powupInWorld = false;
		}//collision
		if ((!player.isDead && powupInWorld) && ((powup.x >= player.x && powup.x <= player.x + 65) && (powup.y - 11 <= player.y && powup.y - 11 >= player.y - 41))){
			if (powup.pType == 0){
				lives++;
				livesTxt.text = "Lives: " + lives; 
				powup.destroy();
				powupInWorld = false;
			}else if (powup.pType == 1 && !tLazer){
				dLazer = true;
				powup.destroy();
				powupInWorld = false;
			}else if (powup.pType == 2){
				tLazer = true;
				powup.destroy();
				powupInWorld = false;
			}
		}
		/*Switch to Menu after space is pressed in Game Over*/
		if (player.readyChange){
			player.destroy();
			for (i in 0...3){
				if (eInWorld[i]){
					e[i].destroy();
				}
			}
			for (i in 0...4){
				eProj[i].destroy();
			}
			for (i in 0...2){
				pProj[i].destroy();
			}
			FlxG.switchState(new MenuState());
		}
		/*Enemy Behaviors*/
		//spawn
		enemyCounter++;
		if (enemyCounter >= 100 && !player.gameOver){
			for (i in 0...3){
				if(eInWorld[i] != true){
					e[i] = new Enemy(20, 20, FlxG.random.int(0, 3));
					add(e[i]);
					enemyCounter = 0;
					eInWorld[i] = true;
					break;
				}
			}
		}
		//despawn
		for (i in 0...3){
			if(eInWorld[i] && e[i].y >= 640){
				e[i].destroy();
				eInWorld[i] = false;
			}
		}
		//die
		for(j in 0...2){
			for (i in 0...3){
				if ((pProj[j].inWorld && eInWorld[i]) && ((pProj[j].x >= e[i].x && pProj[j].x <= e[i].x + 39) && (pProj[j].y - 16 <= e[i].y && pProj[j].y - 16 >= e[i].y - 56))){
					e[i].die();
					score.inc(100);
					eInWorld[i] = false;
					pProj[j].inWorld = false;
					pProj[j].x = pProj[j].y = 0;
				}
			}
		}
		//kill player when shooting
		for (i in 0...4){
			if ((eProj[i].inWorld && !player.isDead) && ((eProj[i].x >= player.x && eProj[i].x <= player.x + 65) && (eProj[i].y - 16 <= player.y && eProj[i].y - 16 >= player.y - 41))){
			player.die();
			lives--;
			livesTxt.text = "Lives: " + lives; 
			eProj[i].y = -50;
		}
		}
		//shoot
		for (i in 0...3){
			for(j in 0...4){
				if (eInWorld[i] && e[i].shoot){
					if (!eProj[j].inWorld){
						eProj[j].x = e[i].x;
						eProj[j].y = e[i].y;
						epew.play();
						e[i].shoot = false;
						eProj[j].inWorld = true;
					}
				}
			}
		}
		//player shoot
		if (FlxG.keys.anyPressed([SPACE]) && !player.isDead){
			if (tLazer){
				for (i in 0...3){
					if(pProj[i].inWorld != true){
						pProj[i].x = player.x + (15 * (i+1));
						pProj[i].y = player.y;
						pProj[i].inWorld = true;
						ppew.play();
					}
				}
			}
			if (dLazer){
				for (i in 0...2){
					if(pProj[i].inWorld != true){
						pProj[i].x = player.x + ((15 * (i+1)) + (15 * i));
						pProj[i].y = player.y;
						pProj[i].inWorld = true;
						ppew.play();
					}
				}
			}
			if(!dLazer && !tLazer){
				if(pProj[0].inWorld != true){
					pProj[0].x = player.x + 31;
					pProj[0].y = player.y;
					pProj[0].inWorld = true;
					ppew.play();
				}
			}
		}
		//proj despawn
		for (i in 0...3){
			if (pProj[i].inWorld && (pProj[i].y <= -20 || pProj[i].y >= 650)){
				pProj[i].inWorld = false;
			}
		}
		
		for (i in 0...4){
			if (eProj[i].inWorld && (eProj[i].y <= -20 || eProj[i].y >= 650)){
			eProj[i].inWorld = false;
			}
		}
		//die when colliding
		for (i in 0...3){
			if ((player.isDead == false && eInWorld[i]) && (e[i].x <= player.x + 65 && e[i].x + 39 >= player.x) && (e[i].y >= player.y - 41 && e[i].y - 56 <= player.y)){
				player.die();
				e[i].die();
				eInWorld[i] = false;
				lives--;
				livesTxt.text = "Lives: " + lives; 
			}
		}
		//Game Over
		if (lives <= 0){
			player.gameOver = true;
		}
		
		super.update(elapsed);
	}
}