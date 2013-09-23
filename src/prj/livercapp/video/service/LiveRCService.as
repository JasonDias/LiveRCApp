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
			myURLLoader.load( new URLRequest( "http://live.liverc.com/content/chat/chat.txt?_=" + Math.random() * 10000 ) );
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
			myURLLoader.load( new URLRequest( "http://live.liverc.com/data/getEventList.php?_=" + Math.random() * 10000 ) );
		}

		private function onGetTracksReceived( event:Event ):void
		{
			var myData:Object = JSON.parse( event.target.data );
			if(myData)
			{
				var myEvent:LiveRCEvent = new LiveRCEvent( LiveRCEvent.TRACKS_RECEIVED );
                var myTrack:TrackVO;
                var trackID:int;
                var trackData:Object;
                for each ( trackData in myData.local )
				{
                    trackID = trackData.track_id;
					myTrack = new TrackVO();
                    myTrack.trackID = trackID;
                    myTrack.trackName = trackData.track_name;
                    myTrack.trackDescription = trackData.description;
                    myTrack.dataDir = trackData.data_directory;
                    myTrack.raceStatus = trackData.status;
                    myTrack.currentEventID = trackData.event_id;
                    myTrack.currentEventName = trackData.event_title;
                    myTrack.aap = ((trackData.aap_event == 1));
					if(trackID == 56 || trackID == 138 || trackID == 51 || trackID == 88 || trackID == 140 || trackID == 34 || trackID == 69 || trackID == 35 || trackID == 68 || trackID == 190 || trackID == 27)
					{
						tracksModel.tracks.unshift( myTrack );
					}
					tracksModel.tracks.push( myTrack );
				}
                for each ( trackData in myData.premium )
                {
                    trackID = trackData.track_id;
                    myTrack = new TrackVO();
                    myTrack.trackID = trackID;
                    myTrack.trackName = trackData.track_name;
                    myTrack.trackDescription = trackData.description;
                    myTrack.dataDir = trackData.data_directory;
                    myTrack.raceStatus = trackData.status;
                    myTrack.currentEventID = trackData.event_id;
                    myTrack.currentEventName = trackData.event_title;
                    myTrack.aap = ((trackData.aap_event == 1));
                    tracksModel.tracks.unshift( myTrack );
                    tracksModel.tracks.push( myTrack );
                }
				dispatch( myEvent );
			}
		}
	}
}


