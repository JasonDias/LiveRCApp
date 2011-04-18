/**
 * Copyright (c) 2010 CIE Games, All Rights Reserved
 * @author Jason Dias
 * @contact jason.dias@ciegames.com
 */
package prj.livercapp.video.controllers.config
{
	import org.robotlegs.mvcs.Command;

	import prj.livercapp.video.controllers.GetTracksCommand;
	import prj.livercapp.video.controllers.SpawnVideoPlayer;
	import prj.livercapp.video.events.ApplicationConfigurationEvent;
	import prj.livercapp.video.events.LiveRCEvent;
	import prj.livercapp.video.events.TracksModelEvent;

	public class MapCommandsCommand extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent( LiveRCEvent.GET_TRACKS, GetTracksCommand, LiveRCEvent );
			commandMap.mapEvent( TracksModelEvent.TRACK_SELECTED, SpawnVideoPlayer, TracksModelEvent );
			dispatch(new ApplicationConfigurationEvent(ApplicationConfigurationEvent.CONFIGURE_MODEL));
		}
	}
}