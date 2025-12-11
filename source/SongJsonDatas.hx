typedef SongMetadata =
{
	bpm:Float,
	sound_files:Array<String>
}

typedef SongChart =
{
	notes:Array<SongChartNoteData>
}

typedef SongChartNoteData =
{
	time:Float,
	id:Int
}

typedef SongJson =
{
	metadata:SongMetadata,
	chart:SongChart
}
