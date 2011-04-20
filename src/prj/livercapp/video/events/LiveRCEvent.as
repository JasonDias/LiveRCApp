package prj.livercapp.video.events
{
	import flash.events.Event;

	import prj.livercapp.video.model.vo.MessageVO;

	import prj.livercapp.video.model.vo.TrackVO;

	public class LiveRCEvent extends Event
	{

		public static const GET_TRACKS:String = "LiveRCEvent.GET_TRACKS";
		public static const TRACKS_RECEIVED:String = "LiveRCEvent.TRACKS_RECEIVED";
		public static const UPDATE_CHAT:String = "LiveRCEvent.UPDATE_CHAT";
		public static const CHAT_UPDATED:String = "LiveRCEvent.CHAT_UPDATED";

		public var tracks:Vector.<TrackVO>;
		public var messages:Vector.<MessageVO>;

		public function LiveRCEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
		}

		public override function clone():Event
		{
			var liveRCEvent:LiveRCEvent = new LiveRCEvent( type, bubbles, cancelable );
			liveRCEvent.tracks = tracks;
			liveRCEvent.messages = messages;
			return liveRCEvent;
		}

		public override function toString():String
		{
			return formatToString( "LiveRCEvent", "type", "bubbles", "cancelable", "eventPhase" );
		}
	}
}