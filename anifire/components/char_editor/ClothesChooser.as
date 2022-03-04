package anifire.components.char_editor
{
   import anifire.cc_theme_lib.CcCharacter;
   import anifire.cc_theme_lib.CcTheme;
   import anifire.constant.CcLibConstant;
   import anifire.event.CcComponentThumbChooserEvent;
   import mx.containers.Tile;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   public class ClothesChooser extends Tile
   {
       
      
      private var _thumbChooserWidth:Number;
      
      private var moneyMode:int;
      
      private var _2020330632lowerBodyChooser:ComponentThumbChooser;
      
      private var _1568676041upperBodyChooser:ComponentThumbChooser;
      
      private var _biggerHeight:Number;
      
      private var _smallerHeight:Number;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      public function ClothesChooser()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Tile,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":ComponentThumbChooser,
                  "id":"upperBodyChooser",
                  "events":{"creationComplete":"__upperBodyChooser_creationComplete"}
               }),new UIComponentDescriptor({
                  "type":ComponentThumbChooser,
                  "id":"lowerBodyChooser",
                  "events":{"creationComplete":"__lowerBodyChooser_creationComplete"}
               })]};
            }
         });
         super();
         mx_internal::_document = this;
      }
      
      public function set biggerHeight(param1:Number) : void
      {
         this._biggerHeight = param1;
         if(this.initialized)
         {
            this.upperBodyChooser.biggerHeight = this._biggerHeight;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lowerBodyChooser() : ComponentThumbChooser
      {
         return this._2020330632lowerBodyChooser;
      }
      
      public function set thumbChooserWidth(param1:Number) : void
      {
         this._thumbChooserWidth = param1;
         if(this.initialized)
         {
            this.upperBodyChooser.width = param1;
            this.lowerBodyChooser.width = param1;
         }
      }
      
      private function onComponentThumbChoosen(param1:CcComponentThumbChooserEvent) : void
      {
         var _loc2_:CcComponentThumbChooserEvent = new CcComponentThumbChooserEvent(CcComponentThumbChooserEvent.COMPONENT_THUMB_CHOSEN,this);
         _loc2_.componentThumb = param1.componentThumb;
         this.dispatchEvent(_loc2_);
      }
      
      public function init(param1:CcCharacter, param2:CcTheme, param3:String, param4:int, param5:Boolean) : void
      {
         this.upperBodyChooser.init(param1,param2,CcLibConstant.COMPONENT_TYPE_UPPER_BODY,param4,param5);
         this.upperBodyChooser.addEventListener(CcComponentThumbChooserEvent.COMPONENT_THUMB_CHOSEN,this.onComponentThumbChoosen);
         this.lowerBodyChooser.init(param1,param2,CcLibConstant.COMPONENT_TYPE_LOWER_BODY,param4,param5);
         this.lowerBodyChooser.addEventListener(CcComponentThumbChooserEvent.COMPONENT_THUMB_CHOSEN,this.onComponentThumbChoosen);
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function __upperBodyChooser_creationComplete(param1:FlexEvent) : void
      {
         this.initComponentThumbChooser(this.upperBodyChooser);
      }
      
      public function set upperBodyChooser(param1:ComponentThumbChooser) : void
      {
         var _loc2_:Object = this._1568676041upperBodyChooser;
         if(_loc2_ !== param1)
         {
            this._1568676041upperBodyChooser = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"upperBodyChooser",_loc2_,param1));
         }
      }
      
      private function initComponentThumbChooser(param1:ComponentThumbChooser) : void
      {
         param1.smallerHeight = this._smallerHeight;
         param1.biggerHeight = this._biggerHeight;
         param1.width = this._thumbChooserWidth;
      }
      
      public function set smallerHeight(param1:Number) : void
      {
         this._smallerHeight = param1;
         if(this.initialized)
         {
            this.lowerBodyChooser.smallerHeight = this._smallerHeight;
         }
      }
      
      public function set lowerBodyChooser(param1:ComponentThumbChooser) : void
      {
         var _loc2_:Object = this._2020330632lowerBodyChooser;
         if(_loc2_ !== param1)
         {
            this._2020330632lowerBodyChooser = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lowerBodyChooser",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get upperBodyChooser() : ComponentThumbChooser
      {
         return this._1568676041upperBodyChooser;
      }
      
      public function __lowerBodyChooser_creationComplete(param1:FlexEvent) : void
      {
         this.initComponentThumbChooser(this.lowerBodyChooser);
      }
   }
}
