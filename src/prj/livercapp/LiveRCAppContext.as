/**
 * Copyright (c) 2010 CIE Games, All Rights Reserved
 * @author Jason Dias
 * @contact jason.dias@ciegames.com
 */
package prj.livercapp
{
	import com.bit101.components.Window;

	import flash.display.DisplayObjectContainer;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	import prj.livercapp.video.controllers.GetTracksCommand;
	import prj.livercapp.video.controllers.SetupMainDisplay;
	import prj.livercapp.video.controllers.config.StartupCommand;
	import prj.livercapp.video.events.LiveRCEvent;
	import prj.livercapp.video.service.LiveRCService;
	import prj.livercapp.video.view.VideoPlayer;
	import prj.livercapp.video.view.VideoPlayerMediator;


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