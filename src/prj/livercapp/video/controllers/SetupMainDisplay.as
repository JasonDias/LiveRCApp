/**
 * Copyright (c) 2010 CIE Games, All Rights Reserved
 * @author Jason Dias
 * @contact jason.dias@ciegames.com
 */
package prj.livercapp.video.controllers
{
	import org.robotlegs.mvcs.Command;

	import prj.livercapp.video.events.LiveRCEvent;
	import prj.livercapp.video.view.TrackSelectionMenu;

	public class SetupMainDisplay extends Command
	{
		override public function execute():void
		{

			contextView.addChild( new TrackSelectionMenu() );

			dispatch( new LiveRCEvent( LiveRCEvent.GET_TRACKS ) );
		}
	}
}