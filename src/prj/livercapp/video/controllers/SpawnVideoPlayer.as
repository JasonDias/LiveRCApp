package prj.livercapp.video.controllers
{
	import org.robotlegs.mvcs.Command;

	import prj.livercapp.video.events.TracksModelEvent;
	import prj.livercapp.video.view.VideoPlayer;

	public class SpawnVideoPlayer extends Command
	{
		[Inject]
		public var event:TracksModelEvent;

		override public function execute():void
		{
			contextView.addChild(new VideoPlayer( event.track ));
		}
	}
}