
import 'package:freezed_annotation/freezed_annotation.dart';
part 'slider.freezed.dart';
part 'slider.g.dart';

@freezed
abstract class SliderModel with _$SliderModel{
  factory SliderModel(
  {
    required String sliderName,
    required String sliderImage,
    required String sliderId,
   }
      )= _Slider;
  factory SliderModel.fromJson(Map<String,dynamic> json )=>
      _$SliderModelFromJson(json);
}

extension SliderModerlExt on SliderModel {
  String get fullImagePath=>sliderImage;
}

List<SliderModel> sliderFromJson(dynamic str)=>
    List<SliderModel>.from((str).map((x)=>
 SliderModel.fromJson(x)
));