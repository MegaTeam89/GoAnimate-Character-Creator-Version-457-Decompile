package com.adobe.webapis.gettext
{
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class Parser
   {
      
      protected static const LE:uint = 2500072158;
      
      protected static const BE:uint = 3725722773;
       
      
      public function Parser()
      {
         super();
      }
      
      public static function parse(param1:ByteArray) : Object
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:String = null;
         var _loc20_:String = null;
         var _loc21_:Number = NaN;
         var _loc22_:Array = null;
         var _loc23_:String = null;
         var _loc24_:Array = null;
         var _loc26_:uint = 0;
         var _loc2_:Object = new Object();
         var _loc3_:Object = new Object();
         var _loc4_:String = "";
         var _loc12_:Number = param1.bytesAvailable;
         var _loc13_:Number;
         if((_loc13_ = param1.readUnsignedInt()) == Parser.BE)
         {
            param1.endian = Endian.BIG_ENDIAN;
         }
         else
         {
            if(_loc13_ != Parser.LE)
            {
               throw new IOError("Invalid file");
            }
            param1.endian = Endian.LITTLE_ENDIAN;
         }
         _loc11_ = param1.readUnsignedInt();
         _loc10_ = param1.readUnsignedInt();
         _loc8_ = param1.readUnsignedInt();
         _loc9_ = param1.readUnsignedInt();
         var _loc25_:Number = 0;
         while(_loc25_ < _loc10_)
         {
            param1.position = _loc8_;
            _loc14_ = param1.readUnsignedInt();
            _loc16_ = (_loc15_ = param1.readUnsignedInt()) + _loc14_;
            param1.position = _loc9_;
            _loc17_ = param1.readUnsignedInt();
            _loc21_ = (_loc18_ = param1.readUnsignedInt()) + _loc17_;
            if(!(_loc16_ < _loc12_ && _loc21_ < _loc12_))
            {
               throw IOError("File is corrupt");
            }
            param1.position = _loc15_;
            _loc19_ = param1.readUTFBytes(_loc16_ - _loc15_);
            param1.position = _loc18_;
            _loc20_ = param1.readUTFBytes(_loc21_ - _loc18_);
            _loc2_[_loc19_] = _loc20_;
            if(_loc14_ == 0)
            {
               _loc5_ = _loc6_ = null;
               _loc22_ = _loc20_.split("\n");
               _loc26_ = 0;
               while(_loc26_ < _loc22_.length)
               {
                  if((_loc23_ = _loc22_[_loc26_]) != "")
                  {
                     if(_loc23_.indexOf(":") >= 0)
                     {
                        _loc6_ = (_loc24_ = _loc23_.split(":",2))[0];
                        _loc7_ = _loc24_[1];
                        _loc6_ = _loc6_.toLowerCase();
                        _loc3_[_loc6_] = _loc7_;
                        _loc5_ = _loc6_;
                     }
                     else if(_loc5_)
                     {
                        _loc3_[_loc5_] += "\n" + _loc23_;
                     }
                     if(_loc6_ == "content-type")
                     {
                        _loc4_ = _loc7_.split("charset=")[1];
                     }
                  }
                  _loc26_++;
               }
            }
            param1.position = 0;
            _loc8_ += 8;
            _loc9_ += 8;
            _loc25_++;
         }
         return {
            "translation":_loc2_,
            "info":_loc3_,
            "charset":_loc4_
         };
      }
   }
}
