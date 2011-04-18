package prj.livercapp
{
	import flash.display.DisplayObjectContainer;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	import prj.livercapp.video.controllers.SetupMainDisplay;
	import prj.livercapp.video.controllers.config.StartupCommand;

	public class LiveRCAppContext extends Context
	{
		public function LiveRCAppContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}

		override public function startup():void
		{
			commandMap.mapEvent( ContextEvent.STARTUP, StartupCommand, ContextEvent, true );
			commandMap.mapEvent( ContextEvent.STARTUP_COMPLETE, SetupMainDisplay, ContextEvent );
			dispatchEvent( new ContextEvent( ContextEvent.STARTUP ) );
		}
	}
}