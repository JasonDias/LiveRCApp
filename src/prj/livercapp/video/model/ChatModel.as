package prj.livercapp.video.model
{
	import org.robotlegs.mvcs.Actor;

	import prj.livercapp.video.events.LiveRCEvent;

	import prj.livercapp.video.model.vo.MessageVO;

	public class ChatModel extends Actor
	{
		public var messages:Vector.<MessageVO> = new Vector.<MessageVO>();
		private var lastMessageParseTime:String="";

		public function parseMessages(myData:String):void
		{
			messages = new Vector.<MessageVO>();
			var myMessagesArray:Array = myData.split("\n");
			for each (var myMessageString:String in myMessagesArray)
			{
				var myMessageData:Array = myMessageString.split("|");
				if (myMessageData)
				{
					var myMessageVO:MessageVO = new MessageVO();
					myMessageVO.time = new Date(Number(myMessageData[0])) || new Date();
					myMessageVO.username = myMessageData[3] || "Admin";
					myMessageVO.color = myMessageData[4] || "000000";
					myMessageVO.message = myMessageData[5] || "";
					messages.push(myMessageVO);
				}
			}
			var liveRCEvent:LiveRCEvent = new LiveRCEvent(LiveRCEvent.CHAT_UPDATED);
			liveRCEvent.messages = messages;
			dispatch(liveRCEvent);
		}
	}
}
