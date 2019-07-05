package;


import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#elseif (winrt)
			rootPath = "./";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end

		}

		Assets.defaultRootPath = rootPath;

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:sizezy4:typey4:TEXTy9:classNamey39:__ASSET__assets_data_data_goes_here_txty2:idy34:assets%2Fdata%2Fdata-goes-here.txtgoR0i220R1y5:IMAGER3y33:__ASSET__assets_images_dlazer_pngR5y28:assets%2Fimages%2Fdlazer.pnggoR0i540R1R7R3y34:__ASSET__assets_images_enemy_1_pngR5y29:assets%2Fimages%2Fenemy-1.pnggoR0i536R1R7R3y34:__ASSET__assets_images_enemy_2_pngR5y29:assets%2Fimages%2Fenemy-2.pnggoR0i537R1R7R3y34:__ASSET__assets_images_enemy_3_pngR5y29:assets%2Fimages%2Fenemy-3.pnggoR0i549R1R7R3y34:__ASSET__assets_images_enemy_4_pngR5y29:assets%2Fimages%2Fenemy-4.pnggoR0i155R1R7R3y38:__ASSET__assets_images_enemy_lazer_pngR5y33:assets%2Fimages%2Fenemy-lazer.pnggoR0i1514R1R7R3y36:__ASSET__assets_images_explosion_pngR5y31:assets%2Fimages%2Fexplosion.pnggoR0i2837R1R7R3y35:__ASSET__assets_images_gameover_pngR5y30:assets%2Fimages%2Fgameover.pnggoR0i375R1R7R3y31:__ASSET__assets_images_life_pngR5y26:assets%2Fimages%2Flife.pnggoR0i155R1R7R3y39:__ASSET__assets_images_player_lazer_pngR5y34:assets%2Fimages%2Fplayer-lazer.pnggoR0i628R1R7R3y33:__ASSET__assets_images_player_pngR5y28:assets%2Fimages%2Fplayer.pnggoR0i1957R1R7R3y37:__ASSET__assets_images_tansparent_pngR5y32:assets%2Fimages%2Ftansparent.pnggoR0i14503R1R7R3y32:__ASSET__assets_images_title_pngR5y27:assets%2Fimages%2Ftitle.pnggoR0i217R1R7R3y33:__ASSET__assets_images_tlazer_pngR5y28:assets%2Fimages%2Ftlazer.pnggoR0zR1R2R3y41:__ASSET__assets_music_music_goes_here_txtR5y36:assets%2Fmusic%2Fmusic-goes-here.txtgoR0i44144R1y5:SOUNDR3y31:__ASSET__assets_sounds_epew_wavR5y26:assets%2Fsounds%2Fepew.wavgoR0i44144R1R38R3y31:__ASSET__assets_sounds_ppew_wavR5y26:assets%2Fsounds%2Fppew.wavgoR0i2114R1y5:MUSICR3y31:__ASSET__flixel_sounds_beep_mp3R5y26:flixel%2Fsounds%2Fbeep.mp3goR0i39706R1R43R3y33:__ASSET__flixel_sounds_flixel_mp3R5y28:flixel%2Fsounds%2Fflixel.mp3goR0i15744R1y4:FONTR3y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfgoR0i29724R1R48R3y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfgoR0i519R1R7R3y36:__ASSET__flixel_images_ui_button_pngR5y33:flixel%2Fimages%2Fui%2Fbutton.pnggoR0i3280R1R7R3y39:__ASSET__flixel_images_logo_default_pngR5y36:flixel%2Fimages%2Flogo%2Fdefault.pnggh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dlazer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_lazer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_explosion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_life_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_lazer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tansparent_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tlazer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_epew_wav extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_ppew_wav extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/dlazer.png") @:noCompletion #if display private #end class __ASSET__assets_images_dlazer_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemy-1.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemy-2.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemy-3.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemy-4.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemy-lazer.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_lazer_png extends lime.graphics.Image {}
@:keep @:image("assets/images/explosion.png") @:noCompletion #if display private #end class __ASSET__assets_images_explosion_png extends lime.graphics.Image {}
@:keep @:image("assets/images/gameover.png") @:noCompletion #if display private #end class __ASSET__assets_images_gameover_png extends lime.graphics.Image {}
@:keep @:image("assets/images/life.png") @:noCompletion #if display private #end class __ASSET__assets_images_life_png extends lime.graphics.Image {}
@:keep @:image("assets/images/player-lazer.png") @:noCompletion #if display private #end class __ASSET__assets_images_player_lazer_png extends lime.graphics.Image {}
@:keep @:image("assets/images/player.png") @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tansparent.png") @:noCompletion #if display private #end class __ASSET__assets_images_tansparent_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tlazer.png") @:noCompletion #if display private #end class __ASSET__assets_images_tlazer_png extends lime.graphics.Image {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/epew.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_epew_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/ppew.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_ppew_wav extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,2/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,2/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:font("C:/HaxeToolkit/haxe/lib/flixel/4,6,2/assets/fonts/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("C:/HaxeToolkit/haxe/lib/flixel/4,6,2/assets/fonts/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,6,2/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,6,2/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
