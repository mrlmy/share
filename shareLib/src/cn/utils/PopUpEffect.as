package cn.utils
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.controls.PopUpButton;
	import mx.core.IFlexDisplayObject;
	import mx.effects.Zoom;
	import mx.events.FlexEvent;
	import mx.events.TweenEvent;
	import mx.managers.PopUpManager;
	
	public class PopUpEffect
	{
		
		public function PopUpEffect()
		{
		}
		
		public static function Show(control:IFlexDisplayObject, parent:DisplayObject, modal:Boolean=true):void
		{
			var mShowEffect:Zoom=new Zoom();
			mShowEffect.zoomWidthFrom=0;
			mShowEffect.zoomHeightFrom=0;
			mShowEffect.zoomHeightTo=1;
			mShowEffect.zoomWidthTo=1;
			mShowEffect.target=control;
			PopUpManager.addPopUp(control, parent, modal);
			mShowEffect.play();

		
			
		}
		
		
		public static function Hide(control:IFlexDisplayObject):void
		{
			
			var mHideEffect:Zoom=new Zoom();
			
			mHideEffect.zoomHeightFrom=1;
			mHideEffect.zoomWidthFrom=1;
			mHideEffect.zoomHeightTo=0;
			mHideEffect.zoomWidthTo=0;
			mHideEffect.addEventListener(TweenEvent.TWEEN_END, function():void
			{
				PopUpManager.removePopUp(control);
			});
			mHideEffect.duration=300;
			mHideEffect.target=control;
			mHideEffect.play();
		}
		
	}
	
}