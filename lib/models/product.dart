import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sangeet_g/models/category.dart';

part 'product.freezed.dart';
part 'product.g.dart'

@freezed
abstract class Product with $Product{
  factory Product({
    required String productName,
    required Category category,
    required String productShortDescription,
    required double productPrice,
    required double productSalePrice,
    required String productImage,
    required String productSKU,
    required String productType,
    required String productStatus,
    required String productId,

  })=_Product;

  factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);

}

extension ProductExt on Product {
  String get fullImagePath => productImage;
}
