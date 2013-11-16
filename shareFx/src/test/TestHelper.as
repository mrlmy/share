package test
{
	import cn.utils.ApplicationDelegate;
	import cn.utils.ViewHelper;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	public class TestHelper extends ViewHelper implements IResponder
	{
		public function TestHelper()
		{
			super();
		}
		
		public var vw:Test = view as Test;

		public function result(data:Object):void
		{
			var rsMsgName:String=data.token.messageName;
			switch (rsMsgName)
			{
				case "flushData":
					vw.dg.dataProvider = data.list;
					Alert.show(view.text1.text);
					break;
				default:
					break;
			}
		}
		
		public function fault(info:Object):void
		{
		}
		
		public function btn_clickHandler():void {
			Alert.show(view.text1.text);
			/*var dele:ApplicationDelegate = new ApplicationDelegate(this,'localhost');
			dele.getRemoteService('','',[],'flushData');*/
		}
	}
}