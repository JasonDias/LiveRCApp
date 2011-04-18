package prj.livercapp.video.service
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	import org.robotlegs.mvcs.Actor;

	import prj.livercapp.video.events.LiveRCEvent;
	import prj.livercapp.video.model.TracksModel;
	import prj.livercapp.video.model.vo.TrackVO;

	public class LiveRCService extends Actor
	{
		[Inject]
		public var tracksModel:TracksModel;

		public function LiveRCService()
		{
			super();
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
					if(trackID == 51 || trackID == 88)
					{
						var myTrack:TrackVO = new TrackVO();
						myTrack.trackID = trackID;
						myTrack.trackName = trackXML.attribute( "trackName" );
						myTrack.trackDescription = trackXML.attribute( "description" );
						myTrack.dataDir = trackXML.attribute( "dataDir" );
						myTrack.raceStatus = trackXML.attribute( "raceStatus" );
						myTrack.currentEventID = trackXML.attribute( "eventID" );
						myTrack.currentEventName = trackXML.attribute( "eventName" );
						myTrack.customStream = trackXML.attribute( "aapStream" );
						tracksModel.tracks.push( myTrack );
					}
				}
				dispatch( myEvent );
			}
		}
	}
}


