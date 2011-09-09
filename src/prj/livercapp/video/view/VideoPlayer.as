package prj.livercapp.video.view
{
	import com.bit101.components.HBox;
	import com.bit101.components.Meter;
	import com.bit101.components.NumericStepper;
	import com.bit101.components.PushButton;
	import com.bit101.components.RotarySelector;
	import com.bit101.components.TextArea;
	import com.bit101.components.VBox;
	import com.bit101.components.Window;

	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.utils.Timer;

	import prj.livercapp.video.model.vo.TrackVO;

	public class VideoPlayer extends Sprite
	{
		private var _video:Video;
		private var _netStream:NetStream;
		private var _netConnection:NetConnection;
		private var _streamName:String;
		private var _window:Window;
		private var _cameraSelector:RotarySelector;
		private var _trackVO:TrackVO;
		private var _HBox:HBox;
		private var _status:TextArea;
		private var _fullscreen:PushButton;
		private var _VBox:VBox;
		private var _selector:NumericStepper;
		private var _camera:int=1;
		private var _description:TextArea;
		private var _meter:Meter;
		private var _bufferTimer:Timer;

		public function VideoPlayer( trackVO:TrackVO )
		{
			_trackVO = trackVO;
			_window = new Window(this, 0, 0, trackVO.trackName);
			_window.addEventListener( Event.CLOSE, handleClose );
			_window.hasCloseButton=true;
			_streamName = (trackVO.customStream)?trackVO.customStream:"liverc_Camera"+_camera+"_"+trackVO.trackID;
			_window.setSize( 870, 480 );
			_window.title += " | "+_streamName;
			_video = new Video( 720, 480 );
			_HBox = new HBox(_window.content);
			_HBox.spacing = 1;
			_VBox = new VBox(_HBox);
			_status = new TextArea(_VBox, 720, 0, "Loading...");
			_status.setSize(150, 150);
			_HBox.addChild(_video);
			_fullscreen = new PushButton(_VBox, 720, 55, "Full Screen", goFullScreen);
			_selector = new NumericStepper(_VBox, 720, 65, cameraChanged);
			_selector.minimum = 1;
			_selector.maximum = 5;
			_selector.step=1;
			_selector.labelPrecision=0;
			_selector.enabled=(!_trackVO.customStream);
			_description = new TextArea(_VBox, 720, 75, _trackVO.trackDescription);
			_description.setSize(150, 150);

			_meter = new Meter(_VBox, 720, 85, "Buffer");
			_meter.minimum=0;
			_meter.maximum=_BUFFER;
			_meter.setSize(145, 50);

			_bufferTimer = new Timer(500);
			_bufferTimer.addEventListener(TimerEvent.TIMER, updateBufferDisplay);
		}

		private function updateBufferDisplay(event:TimerEvent):void
		{
			_meter.value = _netStream.bufferLength;
			trace(_meter.value)
		}

		private function cameraChanged( event:Event ):void
		{
			_camera = _selector.value;
			_streamName = "liverc_Camera"+_camera+"_"+_trackVO.trackID;
			_window.title = _trackVO.trackName+" | "+_streamName;
			_netStream.play( _streamName, -1 );
		}

		private function goFullScreen( event:Event ):void
		{
			stage.fullScreenSourceRect = _video.getRect(this);
			stage.displayState=StageDisplayState.FULL_SCREEN;
		}

		private function handleClose( event:Event ):void
		{
			_netConnection.close();
			_bufferTimer.stop();
			_bufferTimer.removeEventListener(TimerEvent.TIMER, updateBufferDisplay);
			_bufferTimer = null;
			parent.removeChild(this);

		}

		public function connect():void
		{
			_netConnection = new NetConnection();
			_netConnection.addEventListener( NetStatusEvent.NET_STATUS, netStatusUpdate );
			_netConnection.addEventListener( SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler );
			_netConnection.client = this;
			var command:String = (_trackVO.customStream)?"rtmp://cp100553.live.edgefcs.net/live":"rtmp://stream.liverc.com/liverc_broadcast";
			if(_trackVO.currentEventID == 3721)
				command = "rtmp://stream5.liverc.com/liverc_broadcast";
			_netConnection.connect( command );
		}

		private function securityErrorHandler( event:SecurityErrorEvent ):void
		{
			_status.text += event.text + "\n";
		}

		private static const _BUFFER:int = 15;

		private function netStatusUpdate( event:NetStatusEvent ):void
		{
			_status.text += event.info.code + "\n";
			if ( event.info.code == "NetConnection.Connect.Success" )
			{
				_netStream = new NetStream( _netConnection );
				_netStream.bufferTime = _BUFFER;
				_netStream.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
				_netStream.client = this;
				_video.attachNetStream( _netStream );
				_netStream.play( _streamName, -1 );
				_bufferTimer.start();
			}
		}

		private function netStatusHandler( event:NetStatusEvent ):void
		{
			_status.text += event.info.code + "\n";
		}

		public function onMetaData( info:Object ):void
		{
//			_video.width = info.width;
//			_video.height = info.height;
			_status.text += _video.width+ " "+_video.height+ "\n";
			trace(_video.width+ " "+_video.height)
		}

		public function onBWDone( ):void
		{

		}

		public function onFCSubscribe( info:Object ):void
		{
			_status.text += info+ "\n";
			trace( info );
		}

		public function onCuePoint( info:Object ):void
		{
			trace( "cuepoint: time=" + info.time + " name=" + info.name + " type=" + info.type );
		}
	}
}