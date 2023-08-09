
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangeet_g/models/pagination.dart';
import 'package:sangeet_g/models/product_filter.dart';

class ProductFilterNotifier extends StateNotifier<ProductFilterModel>{
  
  ProductFilterNotifier():super(ProductFilterModel(
      paginationModel: PaginationModel(
      page: 0,
    pageSize: 10,
  ),
  ),
  );

  void setProductFilter(ProductFilterModel model){
    state=model;
  }

}