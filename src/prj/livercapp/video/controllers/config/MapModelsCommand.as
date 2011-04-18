/**
 * Copyright (c) 2010 CIE Games, All Rights Reserved
 * @author Jason Dias
 * @contact jason.dias@ciegames.com
 */
package prj.livercapp.video.controllers.config
{
	import org.robotlegs.mvcs.Command;

	import prj.livercapp.video.events.ApplicationConfigurationEvent;
	import prj.livercapp.video.model.TracksModel;
	import prj.livercapp.video.service.LiveRCService;

	public class MapModelsCommand extends Command
	{
		override public function execute():void
		{
			injector.mapSingleton(TracksModel);
			injector.mapSingleton(LiveRCService);

			dispatch(new ApplicationConfigurationEvent(ApplicationConfigurationEvent.CONFIGURE_VIEW));
		}
	}
}