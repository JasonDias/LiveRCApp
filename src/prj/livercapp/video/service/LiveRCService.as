package prj.livercapp.video.service
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	import org.robotlegs.mvcs.Actor;

	import prj.livercapp.video.events.LiveRCEvent;
	import prj.livercapp.video.model.ChatModel;
	import prj.livercapp.video.model.TracksModel;
	import prj.livercapp.video.model.vo.TrackVO;

	public class LiveRCService extends Actor
	{
		[Inject]
		public var tracksModel:TracksModel;

		[Inject]
		public var chatModel:ChatModel;

		public function LiveRCService()
		{
			super();
		}

		public function getChatMessages():void
		{
			var myURLLoader:URLLoader = new URLLoader();
			myURLLoader.addEventListener( Event.COMPLETE, onChatMessagesReceived );
			myURLLoader.load( new URLRequest( "http://live4.liverc.com/chat/chat.txt?nocache=" + Math.random() * 10000 ) );
		}

		private function onChatMessagesReceived(event:Event):void
		{
			var data:String = event.target.data;
			if(data)
			{
				chatModel.parseMessages(data);
			}
		}

		public function getTracks():void
		{
			var myURLLoader:URLLoader = new URLLoader();
			myURLLoader.addEventListener( Event.COMPLETE, onGetTracksReceived );
			myURLLoader.load( new URLRequest( "http://live4.liverc.com/getTrackList.php?nocache=" + Math.random() * 10000 ) );
		}

		private function onGetTracksReceived( event:Event ):void
		{
			var myXML:XML = new XML( event.target.data );
			if(myXML)
			{
				var myEvent:LiveRCEvent = new LiveRCEvent( LiveRCEvent.TRACKS_RECEIVED );
				XML.ignoreWhitespace = true;
				for each ( var trackXML:XML in myXML..Track )
				{
					var trackID:int = int(trackXML.attribute( "trackID" ));
					var myTrack:TrackVO = new TrackVO();
						myTrack.trackID = trackID;
						myTrack.trackName = trackXML.attribute( "trackName" );
						myTrack.trackDescription = trackXML.attribute( "description" );
						myTrack.dataDir = trackXML.attribute( "dataDir" );
						myTrack.raceStatus = trackXML.attribute( "raceStatus" );
						myTrack.currentEventID = trackXML.attribute( "eventID" );
						myTrack.currentEventName = trackXML.attribute( "eventName" );
						myTrack.customStream = trackXML.attribute( "aapHDStream" );
						myTrack.customStreamHD = trackXML.attribute( "aapHDStream" );
					if(trackID == 51 || trackID == 88 || trackID == 140 || trackID == 34 || trackID == 69 || trackID == 35 || trackID == 68)
					{
						tracksModel.tracks.unshift( myTrack );
					}
					tracksModel.tracks.push( myTrack );
				}
				dispatch( myEvent );
			}
		}
	}
}


