/**
 * Copyright (c) 2010 CIE Games, All Rights Reserved
 * @author Jason Dias
 * @contact jason.dias@ciegames.com
 */
package prj.livercapp.video.controllers
{
	import org.robotlegs.mvcs.Command;

	import prj.livercapp.video.service.LiveRCService;

	public class GetTracksCommand extends Command
	{
		[Inject]
		public var liveRCService:LiveRCService;

		override public function execute():void
		{
			liveRCService.getTracks();
		}
	}
}