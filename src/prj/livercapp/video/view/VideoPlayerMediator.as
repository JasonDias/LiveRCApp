/**
 * Copyright (c) 2010 CIE Games, All Rights Reserved
 * @author Jason Dias
 * @contact jason.dias@ciegames.com
 */
package prj.livercapp.video.view
{
	import org.robotlegs.mvcs.Mediator;

	public class VideoPlayerMediator extends Mediator
	{

		[Inject]
		public var view:VideoPlayer;

		override public function onRegister():void
		{
			view.connect();
		}
	}
}