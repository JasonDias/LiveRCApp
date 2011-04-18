/**
 * Copyright (c) 2010 CIE Games, All Rights Reserved
 * @author Jason Dias
 * @contact jason.dias@ciegames.com
 */
package prj.livercapp.video.events
{
	import flash.events.Event;

	public class ApplicationConfigurationEvent extends Event
	{
		public static const CONFIGURE_SERVICE:String = "ApplicationConfigurationEvent.CONFIGURE_SERVICE";
		public static const CONFIGURE_REQUEST:String = "ApplicationConfigurationEvent.CONFIGURE_REQUEST";
		public static const CONFIGURE_VIEW:String = "ApplicationConfigurationEvent.CONFIGURE_VIEW";
		public static const CONFIGURE_MODEL:String = "ApplicationConfigurationEvent.CONFIGURE_MODEL";
		public static const CONFIGURE_CONTROLLER:String = "ApplicationConfigurationEvent.CONFIGURE_CONTROLLER";
		public static const CONFIGURE_DATABASE:String = "ApplicationConfigurationEvent.CONFIGURE_DATABASE";

		public function ApplicationConfigurationEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
		}

		public override function clone():Event
		{
			return new ApplicationConfigurationEvent( type, bubbles, cancelable );
		}

		public override function toString():String
		{
			return formatToString( "ApplicationConfigurationEvent", "type", "bubbles", "cancelable", "eventPhase" );
		}
	}
}


