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
		
		public function result(data:Object):void
		{
			var rsMsgName:String=data.token.messageName;
			switch (rsMsgName)
			{
				case "flushData":
					view.dg.dataProvider = data.result;
					break;
				default:
					break;
			}
		}
		
		public function fault(info:Object):void
		{
		}
		
		public function btn_clickHandler():void {
			var dele:ApplicationDelegate = new ApplicationDelegate(this,'http://192.168.1.2/Gateway.aspx');
			dele.getRemoteService('Bestecch.ServiceLib.FM.FMCollection.TestService','GetTestData',null,'flushData');
		}
	}
}