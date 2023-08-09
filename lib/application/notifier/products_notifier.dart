import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:sangeet_g/application/state/product_state.dart';
import 'package:sangeet_g/models/pagination.dart';

import '../../api/api_service.dart';
import '../../models/product_filter.dart';

class ProductNotifier extends StateNotifier<ProductState>{
  final APIService _apiService;
  final ProductFilterModel _filterModel;
  ProductNotifier(this._apiService,this._filterModel):super(const ProductState());

  int _page=1;
  Future<void> getProducts() async{
    if(state.isLoading|| !state.hasNext){
      return;
    }
    state=state.copyWith(isLoading:true);
    var filterModel =_filterModel.copyWith(
      paginationModel: PaginationModel(
      page:_page,
      pageSize:10,)
    );
    final products=await _apiService.getProducts(filterModel);
    final newProducts=[...state.products,...products!];
    if(products.length%10 !=0 || products.isEmpty){
      state=state.copyWith(hasNext: false);
    }
    state=state.copyWith(products: newProducts);
    _page++;
    state=state.copyWith(isLoading: false);
  }

  Future<void> refreshProducts()async {
    state=state.copyWith(products: [],hasNext: true);
    _page=1;
    await getProducts();
  }

}