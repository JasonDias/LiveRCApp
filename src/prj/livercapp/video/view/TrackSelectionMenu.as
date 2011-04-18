/**
 * Copyright (c) 2010 CIE Games, All Rights Reserved
 * @author Jason Dias
 * @contact jason.dias@ciegames.com
 */
package prj.livercapp.video.view
{
	import com.bit101.components.ComboBox;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;

	import prj.livercapp.video.events.TracksModelEvent;
	import prj.livercapp.video.model.vo.TrackVO;

	public class TrackSelectionMenu extends Sprite
	{
		private var _list:ComboBox;
		private var _currentSelectedValue:int;
		private var _tracks:Dictionary;

		public function TrackSelectionMenu()
		{
			_tracks = new Dictionary();
			_list = new ComboBox( this, 0, 0, "Tracks");
//			_list.numVisibleItems = 50;
			_list.width=200;
			_list.addEventListener( Event.SELECT, handleSelectedItem );
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


