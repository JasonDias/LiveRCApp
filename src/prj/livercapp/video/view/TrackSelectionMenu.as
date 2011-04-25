package prj.livercapp.video.view
{
	import com.bit101.components.ComboBox;
	import com.bit101.components.PushButton;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;

	import prj.livercapp.video.events.LiveRCEvent;

	import prj.livercapp.video.events.TracksModelEvent;
	import prj.livercapp.video.model.vo.TrackVO;

	public class TrackSelectionMenu extends Sprite
	{
		private var _list:ComboBox;
		private var _currentSelectedValue:int;
		private var _tracks:Dictionary;
		private var _updateMessagesButton:PushButton;
		private var _chatUpdateTimer:Timer;
		public function TrackSelectionMenu()
		{
			_chatUpdateTimer = new Timer(10000, 0);
			_chatUpdateTimer.addEventListener(TimerEvent.TIMER, chatUpdateTimer);
			_tracks = new Dictionary();
			_list = new ComboBox( this, 0, 0, "Tracks");
//			_list.numVisibleItems = 50;
			_list.width=200;
			_list.addEventListener( Event.SELECT, handleSelectedItem );

			_updateMessagesButton = new PushButton( this, 200, 0, "Update Messages", updateChatMessages );
			_updateMessagesButton.toggle=true;
		}

		private function chatUpdateTimer(event:TimerEvent):void
		{
			dispatchEvent( new LiveRCEvent( LiveRCEvent.UPDATE_CHAT ) );
		}

		private function updateChatMessages( event:Event ):void
		{
			if(_updateMessagesButton.selected)
			{
				dispatchEvent( new LiveRCEvent( LiveRCEvent.UPDATE_CHAT ) );
				_chatUpdateTimer.start();
			} else {
				_chatUpdateTimer.stop();
			}
		}

		private function handleSelectedItem( event:Event ):void
		{
			if(_list.selectedItem.value != _currentSelectedValue)
			{
				_currentSelectedValue = _list.selectedItem.value;
				var tracksModelEvent:TracksModelEvent = new TracksModelEvent( TracksModelEvent.TRACK_SELECTED );
				tracksModelEvent.track = _tracks[_currentSelectedValue];
				dispatchEvent( tracksModelEvent );
			}
		}

		public function addTrack( myTrack:TrackVO ):void
		{
			_tracks[myTrack.trackID] = myTrack;
			_list.addItem( {label:myTrack.trackName, value:myTrack.trackID} );
		}
	}
}


