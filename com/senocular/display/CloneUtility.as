package com.senocular.display
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class CloneUtility
   {
       
      
      public function CloneUtility()
      {
         super();
      }
      
      public static function writeObjectToByteArray(param1:Object) : ByteArray
      {
         var _loc2_:String = getQualifiedClassName(param1).replace("::",".");
         var _loc3_:ByteArray = new ByteArray();
         registerClassAlias(_loc2_,getDefinitionByName(_loc2_) as Class);
         _loc3_.writeObject(param1);
         _loc3_.position = 0;
         return _loc3_;
      }
      
      public static function registerClass(param1:Object) : void
      {
         var _loc2_:String = getQualifiedClassName(param1).replace("::",".");
         registerClassAlias(_loc2_,getDefinitionByName(_loc2_) as Class);
      }
   }
}
