import 'dart:async';
import 'dart:convert';


import 'package:sangeet_g/config.dart';
import 'package:sangeet_g/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangeet_g/models/product_filter.dart';

import '../models/product.dart';

final apiService=Provider((ref)=>APIService());

class APIService{
  static var client =http.Client();
  FutureOr<List<Category>?> getCategories(page,pageSize) async {
    print("CALLING API");
    Map<String,String> requestHeaders= {
      'Content-Type':'application/json'
    };

    Map<String,String> queryString={
      'page':page.toString(),
      'pageSize':pageSize.toString()
    };

    var url=Uri.http(Config.apiURL,Config.categoryAPI);

    var response= await client.get(url,headers: requestHeaders);
    var body=response.body;

    if(response.statusCode==200)
      {
        var data=jsonDecode(response.body);
        return categoriesFromJson(data["data"]) ;
      }
    else {
      return null;
    }
  }


  FutureOr<List<Product>?> getProducts(ProductFilterModel productFilterModel) async {
    print("CALLING API");
    Map<String,String> requestHeaders= {
      'Content-Type':'application/json'
    };
    print('Below MAP');
    Map<String,String> queryString={
      'page':productFilterModel.paginationModel.page.toString(),
      'pageSize':productFilterModel.paginationModel.pageSize.toString()
    };
    print('apiUrl=${Config.apiURL}');
    print('categoryAPI=${Config.categoryAPI}');
    print('queryString=$queryString');

    if(productFilterModel.categoryId!=null){
      queryString["categoryId"]=productFilterModel.categoryId.toString();
    }

    if(productFilterModel.sortBy!=null)
      {
        queryString["sort"]=productFilterModel.sortBy!;
      }
    var url=Uri.http(Config.apiURL,Config.productAPI);

    print('url=$url');


    var response= await client.get(url,headers: requestHeaders);
    var body=response.body;
    print('BODY=$body');
    print('response=$response');
    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      return productsFromJson(data["data"]) ;
    }
    else {
      return null;
    }
  }



}