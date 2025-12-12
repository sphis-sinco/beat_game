package;

import flixel.sound.FlxSound;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import lime.app.Application;
import lime.utils.Assets;
import haxe.Json;
import SongJsonDatas.SongJson;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var song:SongJson;

	public var songAudio:Array<FlxSound> = [];

	public function playAudio()
		for (audio in songAudio)
			audio.play();

	public function pauseAudio()
		for (audio in songAudio)
			audio.pause();

	public function stopAudio()
		for (audio in songAudio)
			audio.stop();

	public function setAudioTime(time:Float = 0)
		for (audio in songAudio)
			audio.time = time;

	public function setAudioVolume(volume:Float = 1)
		for (audio in songAudio)
			audio.volume = volume;

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

		for (sound_file in song.metadata.sound_files)
		{
			var audio_file:FlxSound = new FlxSound();
			audio_file.loadStream('assets/songs/' + songName + '/' + sound_file + '.wav');
			songAudio.push(audio_file);
		}

		stopAudio();
	}

	override public function create()
	{
		super.create();

		playAudio();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
