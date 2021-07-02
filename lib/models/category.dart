import 'package:finance_control/utils/globals.dart';

enum Category{
  GAIN,
  LEISURE,
  BILLS,
  FOOD,
  TRANSPORT,
}

extension CategoryExtension on Category {
  String get displayTitle {
    switch(this){
      case Category.BILLS: return Globals.instance!.texts.billCategory ;
      case  Category.FOOD: return Globals.instance!.texts.foodCategory ;
      case  Category.GAIN: return Globals.instance!.texts.gainCategory ;
      case Category.LEISURE: return Globals.instance!.texts.leisureCategory ;
      default: return Globals.instance!.texts.transportCategory ;
    }
  }
}