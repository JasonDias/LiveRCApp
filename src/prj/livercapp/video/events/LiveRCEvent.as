/**
 * Copyright (c) 2010 CIE Games, All Rights Reserved
 * @author Jason Dias
 * @contact jason.dias@ciegames.com
 */
package prj.livercapp.video.events
{
	import flash.events.Event;

	import prj.livercapp.video.model.vo.TrackVO;

	public class LiveRCEvent extends Event
	{

		public static const GET_TRACKS:String = "LiveRCEvent.GET_TRACKS";
		public static const TRACKS_RECEIVED:String = "LiveRCEvent.TRACKS_RECEIVED";

		public var tracks:Vector.<TrackVO>;

		public function LiveRCEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
		}

		public override function clone():Event
		{
			var liveRCEvent:LiveRCEvent = new LiveRCEvent( type, bubbles, cancelable );
			liveRCEvent.tracks = tracks;
			return liveRCEvent;
		}

		public override function toString():String
		{
			return formatToString( "LiveRCEvent", "type", "bubbles", "cancelable", "eventPhase" );
		}
	}
}