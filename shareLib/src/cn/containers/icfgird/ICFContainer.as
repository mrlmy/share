/******************************************************************
 ** 文件名:ICFContainer
 ** Copyright (c) 1998-2008 *********公司技术开发部
 ** 创建人:马瑞礼
 ** 日 期:2013-07-11
 ** 描 述:组件容器类
 ** 版 本:1.0
 **-----------------------------------------------------------------
 ******************************************************************/
package cn.containers.icfgird
{
	import cn.containers.icfgird.app.AdvancedFilterApp;
	import cn.containers.icfgird.app.ColumnFreezeApp;
	import cn.containers.icfgird.app.ICFDataGridApp;
	import cn.containers.icfgird.app.ListFieldApp;
	import cn.containers.icfgird.app.PageChangerApp;
	import cn.containers.icfgird.checkbox.HeaderThumb;
	import cn.containers.icfgird.checkbox.ItemThumb;
	import cn.containers.icfgird.events.AddColumnEvent;
	import cn.containers.icfgird.events.PageChangeEvent;
	import cn.containers.icfgird.renderer.CurrencyRenderer;
	import cn.containers.icfgird.renderer.DateRenderer;
	import cn.containers.icfgird.renderer.LabelRenderer;
	import cn.containers.icfgird.renderer.UrlLinkRenderer;
	import cn.containers.icfgird.vo.FormVO;
	import cn.containers.icfgird.vo.PageChangerVO;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Box;
	import mx.containers.Canvas;
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.Alert;
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.core.ClassFactory;
	import mx.core.ScrollPolicy;
	import mx.events.FlexEvent;
	import mx.formatters.CurrencyFormatter;
	import mx.formatters.DateFormatter;
	import mx.messaging.Channel;
	import mx.messaging.config.ServerConfig;
	import mx.rpc.IResponder;
	import mx.utils.ObjectProxy;
	
	[IconFile("com/skyfor/component/icfgird/image/ICFContainer.png")]
	public class ICFContainer extends  Box implements IResponder
	{
		
		
		
		public function ICFContainer()
		{
			super();
			pageChangerVO   = new PageChangerVO();
			formVO = new FormVO();
			
		}
		
		[Bindable]
		public var headerThumb:ClassFactory;
		[Bindable]
		public var thumb:ClassFactory;
		
		/**表格组件*/
		private var _icfgridApp:ICFDataGridApp 

		public function get icfgridApp():ICFDataGridApp
		{
			return _icfgridApp;
		}

		public function set icfgridApp(value:ICFDataGridApp):void
		{
			_icfgridApp = value;
		}

	
		private var _advancedFilterApp :cn.containers.icfgird.app.AdvancedFilterApp 
		
		public function get advancedFilterApp():AdvancedFilterApp
		{
			return _advancedFilterApp;
		}

		public function set advancedFilterApp(value:AdvancedFilterApp):void
		{
			_advancedFilterApp = value;
		}


		private var _columnFreezeApp:ColumnFreezeApp;
		public function get columnFreezeApp():ColumnFreezeApp
		{
			return _columnFreezeApp;
		}

		public function set columnFreezeApp(value:ColumnFreezeApp):void
		{
			_columnFreezeApp = value;
		}

		;

		private var _listFieldApp :ListFieldApp;
		public function get listFieldApp():ListFieldApp
		{
			return _listFieldApp;
		}

		public function set listFieldApp(value:ListFieldApp):void
		{
			_listFieldApp = value;
		}

		private var _pageChangerApp:PageChangerApp 
		public function get pageChangerApp():PageChangerApp
		{
			return _pageChangerApp;
		}

		public function set pageChangerApp(value:cn.containers.icfgird.app.PageChangerApp):void
		{
			_pageChangerApp = value;
		}

		[Bindable]
		private var _dataList :ArrayCollection 
		public function get dataList():ArrayCollection
		{
			return _dataList;
		}

		public function set dataList(value:ArrayCollection):void
		{
			_dataList = value;
		}

		/** 列表字段自定义列集合 */
		[Bindable]
		private  var _listFieldCollcetion : ArrayCollection 
		public function get listFieldCollcetion():ArrayCollection
		{
			return _listFieldCollcetion;
		}

		public function set listFieldCollcetion(value:ArrayCollection):void
		{
			_listFieldCollcetion = value;
		}

		
		private var _isDisplayCheckColumn :Boolean =true;

		public function get isDisplayCheckColumn():Boolean
		{
			return _isDisplayCheckColumn;
		}

		public function set isDisplayCheckColumn(value:Boolean):void
		{
			_isDisplayCheckColumn = value;
		}

		
		
		private var _arrSelected :ArrayCollection;
		[Bindable]
		public function get arrSelected():ArrayCollection
		{
			return _arrSelected;
		}

		public function set arrSelected(value:ArrayCollection):void
		{
			_arrSelected = value;
		}

		
		private var _arrUnSelected :ArrayCollection;
		[Bindable]
		public function get arrUnSelected():ArrayCollection
		{
			return _arrUnSelected;
		}

		public function set arrUnSelected(value:ArrayCollection):void
		{
			_arrUnSelected = value;
		}

		
		private  var _pageChangerVO :PageChangerVO 
		[Bindable]
		public function get pageChangerVO():PageChangerVO
		{
			return _pageChangerVO;
		}
		public function set pageChangerVO(value:PageChangerVO):void
		{
			_pageChangerVO = value;
		}

;
		[Bindable]
		private var _formVO :FormVO 
		public function get formVO():FormVO
		{
			return _formVO;
		}

		public function set formVO(value:FormVO):void
		{
			_formVO = value;
		}

;
		[Bindable]
		private var _currentEcode : String 
		public function get currentEcode():String
		{
			return _currentEcode;
		}

		public function set currentEcode(value:String):void
		{
			_currentEcode = value;
		}

;
		

		private var _remoteUri:String ;
		/**远程服务地址*/
		public function set remoteUri(value:String):void
		{
			_remoteUri = value;
		}
		
		public function get remoteUri():String
		{
			var amfChannel :Channel = ServerConfig.getChannel("my-amf",false);
			
			return amfChannel ==null ? _remoteUri :  amfChannel.endpoint ; 
		}
		private var _isPagination:Boolean =true;

		public function get isPagination():Boolean
		{
			return _isPagination;
		}

		public function set isPagination(value:Boolean):void
		{
			_isPagination = value;
		}

		private var _isFreezeButton:Boolean =true;

		public function get isFreezeButton():Boolean
		{
			return _isFreezeButton;
		}

		public function set isFreezeButton(value:Boolean):void
		{
			_isFreezeButton = value;
		}

		private var _isAdvancedButton:Boolean =true;

		public function get isAdvancedButton():Boolean
		{
			return _isAdvancedButton;
		}

		public function set isAdvancedButton(value:Boolean):void
		{
			_isAdvancedButton = value;
		}

		private var _islistButton:Boolean =true;

		public function get islistButton():Boolean
		{
			return _islistButton;
		}

		public function set islistButton(value:Boolean):void
		{
			_islistButton = value;
		}
		private var _rowCount:int =20;

		public function get rowCount():int
		{
			return _rowCount;
		}

		public function set rowCount(value:int):void
		{
			_rowCount = value;
		}
		/**填充颜色  */
		private var _checkBoxColor:uint=0x009900; 

		public function get checkBoxColor():uint
		{
			return _checkBoxColor;
		}

		public function set checkBoxColor(value:uint):void
		{
			_checkBoxColor = value;
		}
		private var _textSelectedColor:uint; 

		/**表格选中字体颜色  */
		public function get textSelectedColor():uint
		{
			return _textSelectedColor;
		}

		/**
		 * @private
		 */
		public function set textSelectedColor(value:uint):void
		{
			_textSelectedColor = value;
		}
		
		private var _isMultiSort :Boolean =false;

		public function get isMultiSort():Boolean
		{
			return _isMultiSort;
		}

		public function set isMultiSort(value:Boolean):void
		{
			_isMultiSort = value;
		}
		
		private var _isSelectedCopy :Boolean =false;

		public function get isSelectedCopy():Boolean
		{
			return _isSelectedCopy;
		}

		public function set isSelectedCopy(value:Boolean):void
		{
			_isSelectedCopy = value;
		}
		
		
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var a:VBox =new VBox();
			
			a.setStyle("verticalCenter","0");
			a.setStyle("horizontalCenter","0");
			this.addChild(a);

			
			/**创建第一个孩子*/
			var a1:Canvas = new Canvas();
			a1.verticalScrollPolicy = ScrollPolicy.OFF;
			a1.horizontalScrollPolicy = ScrollPolicy.OFF;
			a1.setStyle("verticalCenter","0");
			
			a1.setStyle("horizontalCenter","0");
			
			a.addChild(a1);
			
			var a11:VBox =new VBox();
			a11.setStyle("width","100%");
			a11.setStyle("height","100%");
			a11.setStyle("horizontalAlign","left");
			a11.setStyle("verticalAlign","middle");
			a1.addChild(a11);
			
			var a111 :HBox =new HBox();
			a111.setStyle("verticalAlign","middle");
			a111.setStyle("height","100%");
			a111.setStyle("width","100%");
			a11.addChild(a111);
			
			
			_pageChangerApp = new PageChangerApp();
			_pageChangerApp.pageChangerHelper.icfcontainer =this;
			_pageChangerApp.addEventListener(PageChangeEvent.PAGE_CHANGE_EVENT,pageChangerApp_PageChangeEvent);
			a111.addChild(_pageChangerApp);
			
			if(this.isPagination ==false)
			{
				_pageChangerApp.visible =false;
				_pageChangerApp.includeInLayout =false;
			}
			
			_listFieldApp = new ListFieldApp();
			_listFieldApp.listFieldAppHelper.icfcontainer =this;
			a111.addChild(_listFieldApp);
			
			if(this.islistButton ==false)
			{
				_listFieldApp.visible =false;
				_listFieldApp.includeInLayout =false;
			}
			
			_columnFreezeApp = new ColumnFreezeApp();
			_columnFreezeApp.columnFreezeHelper.icfcontainer =this;
			a111.addChild(_columnFreezeApp);
			
			if(this.isFreezeButton ==false)
			{
				_columnFreezeApp.visible =false;
				_columnFreezeApp.includeInLayout =false;
			}
			
			_advancedFilterApp = new AdvancedFilterApp();
			_advancedFilterApp.advancedFilterHelperApp.icfcontainer =this;
			a111.addChild(_advancedFilterApp);
			
			if(this.isAdvancedButton ==false)
			{
				_advancedFilterApp.visible =false;
				_advancedFilterApp.includeInLayout =false;
			}
			
			
			
			/**创建第二个孩子*/
			var a2:Canvas = new Canvas();
			a2.verticalScrollPolicy = ScrollPolicy.OFF;
			a2.horizontalScrollPolicy = ScrollPolicy.OFF;
			a2.setStyle("verticalCenter","0");
			a2.setStyle("horizontalCenter","0");
			a.addChild(a2);
			
			var a21:VBox =new VBox();
			a21.setStyle("width","100%");
			a21.setStyle("height","100%");
			a21.setStyle("horizontalAlign","left");
			a21.setStyle("verticalAlign","middle");
			a2.addChild(a21);
			
			_icfgridApp = new  ICFDataGridApp();
			_icfgridApp.icfcontainer =this;
			_icfgridApp.width =this.width;
			_icfgridApp.rowCount= this.rowCount;
			_icfgridApp.addEventListener( AddColumnEvent.ADD_COLUMN_EVENT,DataBinder);
			a21.addChild(_icfgridApp);
			

			
		
		}
		public function  pageChangerApp_PageChangeEvent(event:PageChangeEvent):void
		{
			   
				
			var delegate:ApplicationDelegate=new ApplicationDelegate(this, this.remoteUri);
			delegate.getRemoteService("formDefineService", "findPageByFormCode", new Array(
																				this.formVO.FormCode,
																				this.formVO.FormType,
																				this.formVO.WhereCondition,
																				this.pageChangerVO.currentIndex,
																				this.pageChangerVO.pageSize,
																				this.formVO.DefaultSort), "getPageChangerMessage");
			
		
		}
		public function  DataBinder( event:AddColumnEvent):void
		{
			var delegate:ApplicationDelegate=new ApplicationDelegate(this, this.remoteUri);
			delegate.getRemoteService("formDefineService", "getDynamicColumnsSource",  new Array(this.formVO.FormCode,this.formVO.FormType), "getColumnMessage");
			
		
		}

		override public function initialize():void
		{
			
			super.initialize();
		}

		public function setup(primaryKey:String, formCode:String, formType:String, whereCondition:String, currentEcode:String ,defaultSort :String):void
		{

			//系统初始化参数

			this.formVO.PrimaryKey=primaryKey
			this.formVO.FormCode=formCode;
			this.formVO.FormType=formType;
			this.formVO.WhereCondition=whereCondition;	
			this.currentEcode=currentEcode;
			this.formVO.DefaultSort = defaultSort ;
		}
		public function changeCurrentUser(user:String):void
		{
			this.currentEcode =user;
			
			this.icfgridApp.dataGrid_createComplete(new FlexEvent("changeUserEvent"));
		}
		/**响应结果*/
		public function result(data:Object):void
		{
			cursorManager.removeBusyCursor();
			switch (data.token.messageName)
			{
				case "getColumnMessage":
					if (data.result != null )
					{
						var columnsArray:ArrayCollection = data.result as ArrayCollection;
						try
						{
							if (columnsArray != null && columnsArray.length > 0)
							{ 
								/** 使用modellocator 控制器 中的 dataGrid 初始化 DataGrid Instance */
								this.listFieldCollcetion=columnsArray;
								
								splitListFieldCollcetion(columnsArray);
								
								var colArr:Array=MakeDataGridColumns();
								
								this.icfgridApp.columns=colArr;
								
								
								
								/**在创建列表之后 为了保证pageChangerHelper对象创建成功，使用轮询方法*/
								_pageChangerApp.pageChangerHelper.initial(this.pageChangerVO.currentIndex);
								
							}
						}
						catch (e:Error)
						{
							Alert.show("AddColumnCommand:" + e.message.toString());
						}
					}
					break;
				case "getPageChangerMessage":
					if (data.result != null)
					{
						var arrayCollection:ArrayCollection=data.result.list as ArrayCollection;
						
						/**格式化数据，是object 具有IEventDispatcher 能力*/
						var item:Object ;
						for(var i:int =0 ;i<arrayCollection.length  ;i++)
						{
							item = arrayCollection.getItemAt(i);
							
							arrayCollection.setItemAt(new ObjectProxy(item),i)
						
						}
						
						try
						{


							this.dataList=arrayCollection;
							this.icfgridApp.dataProvider=arrayCollection;
							this.pageChangerVO.totalRecords=data.result.count;
							this.pageChangerVO.totalPages=Math.ceil(this.pageChangerVO.totalRecords / this.pageChangerVO.pageSize) == 0 ? 1 : Math.ceil(this.pageChangerVO.totalRecords / this.pageChangerVO.pageSize);
							if (this.pageChangerVO.currentIndex > this.pageChangerVO.totalPages)
							{

								_pageChangerApp.pageChangerHelper.initial(Math.min(this.pageChangerVO.currentIndex, this.pageChangerVO.totalPages));
							}
						}
						catch (e:Error)
						{

						}
					}
					break;
				default:
			}
		}
		/** 把结果集合按照是否选择拆分成两个集合*/
		public function splitListFieldCollcetion(columnsArray:ArrayCollection):void
		{
			
			var arrSelected :ArrayCollection = new ArrayCollection();
			
			var arrUnSelected :ArrayCollection = new ArrayCollection();
			
			for(var i:int =0 ;i<columnsArray.length ;i++)
			{
				if (columnsArray[i].isPk == false && columnsArray[i].selectedColumn ==0)
				{
					arrUnSelected.addItem(columnsArray[i]);
				}
				else if(columnsArray[i].isPk == false && columnsArray[i].selectedColumn ==1)
				{
					arrSelected.addItem(columnsArray[i]);
					
				}
				
			}
			this.arrSelected =arrSelected ;
			
			this.arrUnSelected =arrUnSelected;
			
		}
	
		
		/** 生成Datagrid各种类型的Columns */
		private function MakeDataGridColumns():Array
		{
			try
			{
				/** 创建动态列 */
				var columns:Array=new Array();
				var tempDgColumn:DataGridColumn=new DataGridColumn();
				createCheckColumn(columns);
				
				for (var i:int=0; i < this.listFieldCollcetion.length; i++)
				{
					var item:Object=this.listFieldCollcetion[i];
					if ( item.selectedColumn ==1)//item.isPk == true ||
					{
						tempDgColumn=new DataGridColumn();
						/** 列渲染器处理 */
						daterendererClass(tempDgColumn, item);
						currencyrendererClass(tempDgColumn, item);
						formatColumnInfo(tempDgColumn, item);
						labelrendererClass(tempDgColumn, item);
						urllinkrendererClass(tempDgColumn, item);
						
						/** 表头渲染器 */
						multiHeaderRendererClass(tempDgColumn, item);
						
						columns.push(tempDgColumn);
					}
				}	
				return columns;
			}
			catch (e:Error)
			{
				Alert.show("CreateColumn:" + e.message.toString());
				columns=new Array();
				return columns;
			}
			return null;
		}
		
		/** 创建checkbox列 */
		private function createCheckColumn(columns:Array):void
		{
			if (this.isDisplayCheckColumn == true)
			{
				
				var dgColumnThumb:DataGridColumn=new DataGridColumn();
				dgColumnThumb.width=40;
				dgColumnThumb.dataField="isSelected";
				headerThumb = new ClassFactory(HeaderThumb);
				dgColumnThumb.headerRenderer=headerThumb;
				dgColumnThumb.sortable=false;
				
				 thumb = new ClassFactory(ItemThumb);
				 dgColumnThumb.itemRenderer =thumb ;
				 thumb.properties={controlType: "checkboxrenderer"};
				
				columns.push(dgColumnThumb);
				
				
			}
		}
		
		/* 列宽位置可见性约束 */
		private function formatColumnInfo(tempDgColumn:DataGridColumn, item:Object):void
		{
			if (item.column_Width != null)
				tempDgColumn.width=item.column_Width
			/* 文本位置 */
			if (item.column_Align != null)
				tempDgColumn.setStyle("textAlign", String(item.column_Align).toLowerCase());
			
		}
		
		
		/**渲染表头列 */
		private function multiHeaderRendererClass(tempDgColumn:DataGridColumn, item:Object):void
		{
			
			/*var multiHeaderRenderer:ClassFactory = new ClassFactory(MultiHeaderRenderer);
			multiHeaderRenderer.properties={controlType: "multiheaderrenderer", customTextField: item.display_Name, customDataField: item.isExpress == true ? item.expression : item.field_Code};
			tempDgColumn.headerRenderer=multiHeaderRenderer;*/
			
			tempDgColumn.dataField=item.field_Code;
			tempDgColumn.headerText=item.display_Name;
			
			//tempDgColumn.sortable=false;
			
			
		}
		
		/** 渲染字符列 */
		private function labelrendererClass(tempDgColumn:DataGridColumn, item:Object):void
		{
			
			if (String(item.columnType).toLowerCase() == "string" )
			{
				var labelRenderer:ClassFactory=new ClassFactory(LabelRenderer);
				tempDgColumn.itemRenderer=labelRenderer;
				labelRenderer.properties={controlType: "labelrenderer",isPk:item.isPk};
				
			}
		}
		
		/** 渲染货币列 */
		private function currencyrendererClass(tempDgColumn:DataGridColumn, item:Object):void
		{
			
			if (String(item.columnType).toLowerCase() == "numeric")
			{
				var currencyRenderer:ClassFactory=new ClassFactory(CurrencyRenderer);
				currencyRenderer.properties={controlType: "currencyrenderer", formatType: item.format_Type};
				tempDgColumn.itemRenderer=currencyRenderer;
				tempDgColumn.labelFunction=numericFormat;
			}
		}
		
		/**渲染日期列  */
		private function daterendererClass(tempDgColumn:DataGridColumn, item:Object):void
		{
			
			if (String(item.columnType).toLowerCase() == "datetime")
			{
				var dateRenderer:ClassFactory=new ClassFactory(DateRenderer);
				dateRenderer.properties={controlType: "daterenderer", formatType: item.format_Type};
				tempDgColumn.itemRenderer=dateRenderer;
				tempDgColumn.labelFunction=dateFormat;
			}
		}
		
		/**渲染链接列  */
		private function urllinkrendererClass(tempDgColumn:DataGridColumn, item:Object):void
		{
			if (Boolean(item.isHotLink) == true)
			{
				var urlLinkRenderer:ClassFactory=new ClassFactory(UrlLinkRenderer);
				urlLinkRenderer.properties={controlType: "urllinkrenderer", linkButtonLabel: item.display_Name, linkButtonField: item.hotLinkKey, urlLink: item.hotLinkURL,formatType: item.format_Type};
				
				tempDgColumn.itemRenderer=urlLinkRenderer;
			}
		}
		
		/**日期格式化函数 */
		private function dateFormat(item:Object, column:Object):String
		{
			
			var result:String="";
			var df:DateFormatter=new DateFormatter();
			try
			{
				
				if (item[column.dataField] != null)
				{
					
					df.formatString=column.itemRenderer.properties.formatType == null ? "YYYY-MM-DD" : column.itemRenderer.properties.formatType;
					result=df.format(item[column.dataField]);
				}
			}
			catch (errr:Error)
			{
			}
			return result;
		}
		
		/**货币格式化函数 */
		private function numericFormat(item:Object, column:Object):String
		{
			
			var result:String="";
			try
			{
				if (item[column.dataField] != null)
				{
					
					var cf:CurrencyFormatter=new CurrencyFormatter();
					cf.decimalSeparatorFrom=".";
					cf.decimalSeparatorTo=".";
					cf.currencySymbol="";
					cf.useThousandsSeparator=true;
					cf.alignSymbol="left";
					cf.useNegativeSign=true;
					cf.precision=column.itemRenderer.properties.formatType=null ? 2 : column.itemRenderer.properties.formatType;
					result=cf.format(item[column.dataField]);
					
					if(Number(result)==0){
						result="";
					}
				}else
				{
					result="";
				}
				
			}
			catch (errr:Error)
			{
				
				
			}
			return result;
		}
		/**响应结果*/
		public function fault(event:Object):void
		{
			cursorManager.removeBusyCursor();
	
		}
		
		/**获取list组件的宽度，默认是145*/
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			
		}
	}
}