/**
 * Copyright (c) 2010 CIE Games, All Rights Reserved
 * @author Jason Dias
 * @contact jason.dias@ciegames.com
 */
package prj.livercapp.video.model
{
	import org.robotlegs.mvcs.Actor;

	import prj.livercapp.video.model.vo.TrackVO;

	public class TracksModel extends Actor
	{
		public var tracks:Vector.<TrackVO> = new Vector.<TrackVO>();

		public function TracksModel()
		{

		}
	}
}