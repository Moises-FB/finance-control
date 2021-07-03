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
      case Category.BILLS: return Globals.instance!.texts.billCategory;
      case  Category.FOOD: return Globals.instance!.texts.foodCategory;
      case  Category.GAIN: return Globals.instance!.texts.gainCategory;
      case Category.LEISURE: return Globals.instance!.texts.leisureCategory;
      case Category.TRANSPORT: return Globals.instance!.texts.transportCategory;
    }
  }

  String get rawValue {
    switch(this){
      case Category.BILLS: return 'BILLS';
      case  Category.FOOD: return 'FOOD';
      case  Category.GAIN: return 'GAIN';
      case Category.LEISURE: return 'LEISURE';
      case Category.TRANSPORT: return 'TRANSPORT';
    }
  }
}