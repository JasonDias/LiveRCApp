package prj.livercapp.video.view
{
	import flash.events.Event;

	import org.robotlegs.mvcs.Mediator;

	import prj.livercapp.video.events.LiveRCEvent;
	import prj.livercapp.video.model.vo.MessageVO;

	public class ChatViewMediator extends Mediator
	{
		[Inject]
		public var chatView:ChatView;

		override public function onRegister():void
		{
			addContextListener(LiveRCEvent.CHAT_UPDATED, updateMessages);
		}

		private function updateMessages(e:LiveRCEvent):void
		{
			if(e.messages.length > 0)
			{
				for each (var myMessageVO:MessageVO in e.messages)
				{
//					var myText:String = "["+myMessageVO.time.toLocaleTimeString()+"] ";
					var myText:String = "<font color='#"+myMessageVO.color+"'><strong>["+myMessageVO.username+"]</strong>: "+myMessageVO.message+"</font>";
					chatView.addMessage(myText);
				}
			}
		}
	}
}
