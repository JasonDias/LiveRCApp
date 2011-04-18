package prj.livercapp.video.controllers.config
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;

	import prj.livercapp.video.view.TrackSelectionMenu;
	import prj.livercapp.video.view.TrackSelectionMenuMediator;
	import prj.livercapp.video.view.VideoPlayer;
	import prj.livercapp.video.view.VideoPlayerMediator;

	public class MapViewsCommand extends Command
	{
		override public function execute():void
		{
			mediatorMap.mapView( TrackSelectionMenu, TrackSelectionMenuMediator );
			mediatorMap.mapView( VideoPlayer, VideoPlayerMediator );

			dispatch(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	}
}