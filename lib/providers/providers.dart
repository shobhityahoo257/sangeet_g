import 'dart:async';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangeet_g/api/api_service.dart';
import 'package:sangeet_g/application/notifier/product_filter_notifier.dart';
import 'package:sangeet_g/application/notifier/products_notifier.dart';
import 'package:sangeet_g/application/state/product_state.dart';
import 'package:sangeet_g/models/pagination.dart';
import 'package:sangeet_g/models/product.dart';
import 'package:sangeet_g/models/product_filter.dart';

import '../models/category.dart';

final categoriesProvider=
FutureProvider.family<List<Category>?,PaginationModel >(
        (ref,paginationModel) {
      final apiRepository=ref.watch(apiService);
      return apiRepository.getCategories(
          paginationModel.page,
          paginationModel.pageSize
      );
    }
);


final homeProductProvider=
FutureProvider.family<List<Product>?,ProductFilterModel>
  ((ref,productFilterModel){
  final apiRepository=ref.watch(apiService);
  return apiRepository.getProducts(productFilterModel);
});

final productFilterProvider=
StateNotifierProvider<ProductFilterNotifier,ProductFilterModel>(
    (ref)=> ProductFilterNotifier(),
);

final productNotifierProvider=
    StateNotifierProvider<ProductNotifier,ProductState>(
        (ref)=>ProductNotifier(
          ref.watch(apiService),
          ref.watch(productFilterProvider),
        ),
    );