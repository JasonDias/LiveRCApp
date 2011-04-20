package prj.livercapp.video.controllers
{
	import org.robotlegs.mvcs.Command;

	import prj.livercapp.video.service.LiveRCService;

	public class GetChatMessages extends Command
	{
		[Inject]
		public var liveRCService:LiveRCService;

		override public function execute():void
		{
			liveRCService.getChatMessages();
		}
	}
}
