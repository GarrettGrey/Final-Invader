package;

import flixel.FlxG;
import flixel.FlxState;

class MenuState extends FlxState{
	var title:Title;
	override public function create():Void{
		title = new Title(0,0);
		add(title);
		super.create();
		FlxG.watch.add(this, "count");
	}

	override public function update(elapsed:Float):Void{
		if (FlxG.keys.anyPressed([SPACE])){
			FlxG.switchState(new PlayState());
		}
		super.update(elapsed);
	}
}