package cn.utils
{
	import flash.utils.Dictionary;
	
	import mx.controls.Alert;
	import mx.core.Application;

	public class  ViewLocator
	{
		private static var viewLocator : ViewLocator;
		private var viewHelpers : Dictionary;      
		
		
		public static function getInstance() : ViewLocator
		{
			if ( viewLocator == null )
				viewLocator = new ViewLocator();
			
			return viewLocator;
		}
		
		
		public function ViewLocator()
		{
			if ( ViewLocator.viewLocator != null )
			{
				
			}
			
			viewHelpers = new Dictionary();      
		}
		
		
		public function register( viewName : String, viewHelper : ViewHelper ) : void
		{
			if ( registrationExistsFor( viewName ) )
			{
				
				
			}
			
			
			viewHelpers[ viewName ] = viewHelper;
		}
		
		
		public function unregister( viewName : String ) : void
		{
			if ( !registrationExistsFor( viewName ) )
			{
				
			}
			
			delete viewHelpers[ viewName ];
		}
		
		
		public function getViewHelper( viewName : String ) : ViewHelper
		{
			if ( !registrationExistsFor( viewName ) )
			{
				
			}
			
			return viewHelpers[ viewName ];
		}
		
		
		public function registrationExistsFor( viewName : String ) : Boolean
		{
			return viewHelpers[ viewName ] != undefined;
		}
	}
}