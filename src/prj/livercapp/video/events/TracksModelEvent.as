package prj.livercapp.video.events
{
	import flash.events.Event;

	import prj.livercapp.video.model.vo.TrackVO;

	public class TracksModelEvent extends Event
	{
		public static const TRACKS_UPDATED:String = "TracksModelEvent.TRACKS_UPDATED";
		public static const TRACK_SELECTED:String = "TracksModelEvent.TRACK_SELECTED";

		public var track:TrackVO;

		public function TracksModelEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
		}

		public override function clone():Event
		{
			var tracksModelEvent:TracksModelEvent = new TracksModelEvent( type, bubbles, cancelable );
			tracksModelEvent.track = track;
			return tracksModelEvent;
		}

		public override function toString():String
		{
			return formatToString( "TracksModelEvent", "type", "bubbles", "cancelable", "eventPhase" );
		}
	}
}