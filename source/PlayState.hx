package;

import flixel.FlxG;
import lime.app.Application;
import lime.utils.Assets;
import haxe.Json;
import SongJsonDatas.SongJson;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var song:SongJson;

	override public function new(songName:String = 'test')
	{
		super();

		song = {
			metadata: null,
			chart: null,
		};

		try
		{
			song.metadata = Json.parse(Assets.getText('assets/songs/' + songName + '/metadata.json'));
			song.chart = Json.parse(Assets.getText('assets/songs/' + songName + '/chart.json'));
		}
		catch (e)
		{
			Application.current.window.alert('Song JSON Parsing Error: ' + e.message, 'Song JSON Parsing Error');
			FlxG.switchState(() -> new PlayState('test'));
		}
	}

	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
