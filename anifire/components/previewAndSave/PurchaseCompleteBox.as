package anifire.components.previewAndSave
{
   import anifire.event.CcCoreEvent;
   import anifire.util.UtilDict;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil;
   import mx.containers.Canvas;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.Text;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class PurchaseCompleteBox extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil;
       
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      mx_internal var _bindingsByDestination:Object;
      
      public var _PurchaseCompleteBox_Button1:Button;
      
      public var _PurchaseCompleteBox_Button2:Button;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindings:Array;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public var _PurchaseCompleteBox_Text1:Text;
      
      public var _PurchaseCompleteBox_Text2:Text;
      
      public var _PurchaseCompleteBox_Text3:Text;
      
      public function PurchaseCompleteBox()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Text,
                  "id":"_PurchaseCompleteBox_Text1",
                  "stylesFactory":function():void
                  {
                     this.horizontalCenter = "0";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":41,
                        "y":10,
                        "selectable":false,
                        "styleName":"txtPurchaseTitle"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":VBox,
                  "stylesFactory":function():void
                  {
                     this.horizontalCenter = "0";
                     this.horizontalAlign = "center";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":188,
                        "y":45,
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Text,
                           "id":"_PurchaseCompleteBox_Text2",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"txtPurchaseCompleteCongratulations",
                                 "selectable":false
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"_PurchaseCompleteBox_Text3",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"txtPurchaseCompleteDescription",
                                 "selectable":false,
                                 "percentWidth":90
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"_PurchaseCompleteBox_Button1",
                           "events":{"click":"___PurchaseCompleteBox_Button1_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "x":32,
                                 "y":150,
                                 "styleName":"btnGoStudio",
                                 "buttonMode":true
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"_PurchaseCompleteBox_Button2",
                           "events":{"click":"___PurchaseCompleteBox_Button2_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "x":32,
                                 "y":180,
                                 "styleName":"btnMoreChar",
                                 "buttonMode":true
                              };
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         this.styleName = "bgMessageBoxBigWhite";
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
      {
         PurchaseCompleteBox._watcherSetupUtil = param1;
      }
      
      private function tellEveryoneUserGoToStudio() : void
      {
         var _loc1_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_GO_TO_STUDIO,this);
         this.dispatchEvent(_loc1_);
      }
      
      private function _PurchaseCompleteBox_bindingsSetup() : Array
      {
         var binding:Binding = null;
         var result:Array = [];
         binding = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","cc_purchase_complete_title");
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _PurchaseCompleteBox_Text1.text = param1;
         },"_PurchaseCompleteBox_Text1.text");
         result[0] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","cc_purchase_complete_congratulations");
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _PurchaseCompleteBox_Text2.text = param1;
         },"_PurchaseCompleteBox_Text2.text");
         result[1] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","I am now available in your studio.\n\nSelect \'Custom World\' theme to find me.");
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _PurchaseCompleteBox_Text3.text = param1;
         },"_PurchaseCompleteBox_Text3.text");
         result[2] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Go to Studio");
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _PurchaseCompleteBox_Button1.label = param1;
         },"_PurchaseCompleteBox_Button1.label");
         result[3] = binding;
         binding = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Create more characters");
            return _loc1_ == undefined ? null : String(_loc1_);
         },function(param1:String):void
         {
            _PurchaseCompleteBox_Button2.label = param1;
         },"_PurchaseCompleteBox_Button2.label");
         result[4] = binding;
         return result;
      }
      
      private function _PurchaseCompleteBox_bindingExprs() : void
      {
         var _loc1_:* = undefined;
         _loc1_ = UtilDict.toDisplay("cc","cc_purchase_complete_title");
         _loc1_ = UtilDict.toDisplay("cc","cc_purchase_complete_congratulations");
         _loc1_ = UtilDict.toDisplay("cc","I am now available in your studio.\n\nSelect \'Custom World\' theme to find me.");
         _loc1_ = UtilDict.toDisplay("cc","Go to Studio");
         _loc1_ = UtilDict.toDisplay("cc","Create more characters");
      }
      
      private function tellEveryoneUserGoToCc() : void
      {
         var _loc1_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_GO_TO_CHAR_CREATOR,this);
         this.dispatchEvent(_loc1_);
      }
      
      override public function initialize() : void
      {
         var target:PurchaseCompleteBox = null;
         var watcherSetupUtilClass:Object = null;
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         var bindings:Array = this._PurchaseCompleteBox_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_previewAndSave_PurchaseCompleteBoxWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },bindings,watchers);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         super.initialize();
      }
      
      public function ___PurchaseCompleteBox_Button1_click(param1:MouseEvent) : void
      {
         this.tellEveryoneUserGoToStudio();
      }
      
      public function ___PurchaseCompleteBox_Button2_click(param1:MouseEvent) : void
      {
         this.tellEveryoneUserGoToCc();
      }
   }
}
