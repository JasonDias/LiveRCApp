package prj.livercapp.video.view
{
	import com.bit101.components.TextArea;
	import com.bit101.components.Window;

	import flash.display.Sprite;

	public class ChatView extends Sprite
	{
		private var _textArea:TextArea;
		private var _window:Window;

		public function ChatView()
		{
			_window = new Window(this, 200, 480, "Messages");
			_window.setSize(870, 150);
			_textArea = new TextArea(_window, 0, 20);
			_textArea.setSize(870, 150);
			_textArea.html = true;
		}

		public function addMessage(myMessage:String):void
		{
			_textArea.textField.htmlText = myMessage+"<br />"+_textArea.textField.htmlText;
		}

		public function clearMessages():void
		{
			_textArea.textField.htmlText = "";
		}
	}
}
