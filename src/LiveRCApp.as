package
{
	import flash.display.Sprite;

	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	import prj.livercapp.LiveRCAppContext;

	[SWF(backgroundColor=0x000000, frameRate=30, width=720, height=600)]
	public class LiveRCApp extends Sprite
	{
		private var _context:LiveRCAppContext;

		public function LiveRCApp()
		{
			stage.scaleMode=StageScaleMode.NO_SCALE;
			stage.align=StageAlign.TOP_LEFT;
			_context = new LiveRCAppContext( this );
		}
	}
}
