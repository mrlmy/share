package cn.utils
{
	import mx.core.UIComponent;
	import mx.managers.CursorManager;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.messaging.config.ServerConfig;
	import mx.resources.ResourceBundle;
	import mx.resources.ResourceManager;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	
	public class ApplicationDelegate
	{
		
		/**
		 *远程服务代理类
		 * @param response 调用这个方法的模块需要实现IResponder 接口
		 *
		 */
		public function ApplicationDelegate(response:IResponder, remoteUri:String)
		{
			this.response=response;
			this.remoteUri=remoteUri;
			remoteObject=new RemoteObject();
			
		}
/*		[Embed(source="com/skyfor/utils/CursorStyle/CursorStyle.swf")]
*/		
		public var imageCursor:Class;
		private var response:IResponder;
		
		private var remoteObject:RemoteObject;
		
		private var remoteUri:String;
		
		/**
		 *调用远程服务 
		 * @param beanName
		 * @param method
		 * @param args
		 * 
		 */
		public function getRemoteService(beanName:String,method:String,args:Array=null,messageName:String=null):void
		{
			try
			{
				CursorManager.setBusyCursor();
				
				remoteObject.requestTimeout=30;
				
				/**服务地址*/
				
				var channelSet:ChannelSet=new ChannelSet();
				var channel:AMFChannel=new AMFChannel("uri", this.remoteUri);
				channelSet.addChannel(channel);
				
				/**服务类名称*/
				remoteObject.destination=beanName;
				remoteObject.channelSet=channelSet;
				
				
				/**服务方法*/
				var op:AbstractOperation=remoteObject.getOperation(method);
				var token:AsyncToken=null;
				
				/**服务方法参数*/
				
				op.arguments = args;
				token=op.send();
				
				
				/**区分Proxy中回调函数的标识*/
				token.messageName=messageName;
				
				/**当服务调用完成时，通知相应*/
				token.addResponder(this.response);
			}
			catch (err:Error)
			{
				trace(err.message)
			}
			finally
			{
				CursorManager.removeBusyCursor();
			}
		}
	}
}