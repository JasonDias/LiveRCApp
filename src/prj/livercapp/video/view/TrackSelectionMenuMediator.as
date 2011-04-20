package prj.livercapp.video.view
{
	import org.robotlegs.mvcs.Mediator;

	import prj.livercapp.video.events.LiveRCEvent;
	import prj.livercapp.video.events.TracksModelEvent;
	import prj.livercapp.video.model.TracksModel;
	import prj.livercapp.video.model.vo.TrackVO;

	public class TrackSelectionMenuMediator extends Mediator
	{
		[Inject]
		public var view:TrackSelectionMenu;

		[Inject]
		public var tracksModel:TracksModel;

		override public function onRegister():void
		{
			addContextListener( LiveRCEvent.TRACKS_RECEIVED, updateTrackList, LiveRCEvent);
			addViewListener( TracksModelEvent.TRACK_SELECTED, dispatch );
			addViewListener( LiveRCEvent.UPDATE_CHAT, dispatch );
		}

		private function updateTrackList(e:LiveRCEvent):void
		{
			for each ( var myTrack:TrackVO in tracksModel.tracks )
			{
				view.addTrack( myTrack );
			}
		}
	}
}