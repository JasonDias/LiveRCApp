package prj.livercapp.video.model
{
	import org.robotlegs.mvcs.Actor;

	import prj.livercapp.video.model.vo.TrackVO;

	public class TracksModel extends Actor
	{
		public var tracks:Vector.<TrackVO> = new Vector.<TrackVO>();
		public var camera:int = 1;

		public function TracksModel()
		{

		}
	}
}