package prj.livercapp.video.controllers.config
{
	import org.robotlegs.mvcs.Command;

	import prj.livercapp.video.events.ApplicationConfigurationEvent;

	public class StartupCommand extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent( ApplicationConfigurationEvent.CONFIGURE_CONTROLLER, MapCommandsCommand );
			commandMap.mapEvent( ApplicationConfigurationEvent.CONFIGURE_MODEL, MapModelsCommand );
			commandMap.mapEvent( ApplicationConfigurationEvent.CONFIGURE_VIEW, MapViewsCommand );

			dispatch( new ApplicationConfigurationEvent( ApplicationConfigurationEvent.CONFIGURE_CONTROLLER ) );
		}
	}
}