package;
import flixel.text.FlxText;
import flixel.FlxSprite;

/**
 * Manages text that goes on the screen that represents a number that progressively goes up as it increases instead of instantly 
 * changing values.
 * Created 7/4/2019
 * Last edited 7/4/2019
 */
class Counter extends FlxSprite
{
	public var txt:FlxText;
	public var aValue:Int;//Actual value
	var dValue:Int;//Displayed value
	var name:String;
	public function new(n:String, value:Int, X:Float, Y:Float){
		super(-20, -20);
		aValue = dValue = value;
		name = n;
		txt = new FlxText(X, Y, 0, name + ": " + value, 20);
	}
	
	override public function update(elapsed:Float):Void{
		if (aValue > dValue){
			dValue++;
			txt.text = name + ": " + dValue;
		}else if (aValue < dValue){
			dValue--;
			txt.text = name + ": " + dValue;
		}
	}
	
	public function inc(val:Int){
		aValue += val;
	}
	
	public function sub(val:Int){
		aValue -= val;
	}
	
}