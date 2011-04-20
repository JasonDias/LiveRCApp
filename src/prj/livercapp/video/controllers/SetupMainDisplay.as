package prj.livercapp.video.controllers
{
	import org.robotlegs.mvcs.Command;

	import prj.livercapp.video.events.LiveRCEvent;
	import prj.livercapp.video.view.ChatView;
	import prj.livercapp.video.view.TrackSelectionMenu;

	public class SetupMainDisplay extends Command
	{
		override public function execute():void
		{

			contextView.addChild( new TrackSelectionMenu() );
			contextView.addChild( new ChatView() );

			dispatch( new LiveRCEvent( LiveRCEvent.GET_TRACKS ) );
		}
	}
}