import 'dart:async';
import 'dart:convert';


import 'package:sangeet_g/config.dart';
import 'package:sangeet_g/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangeet_g/models/product_filter.dart';

import '../models/cart.dart';
import '../models/product.dart';
import '../models/slider.dart';

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

    if(productFilterModel.productIds!=null){
      queryString["productIds"]=productFilterModel.productIds!.join(",");
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

  Future<List<SliderModel>?> getSliders(page,pageSize) async {
    Map<String,String> requestHeaders= {
      'Content-Type':'application/json'
    };

    Map<String,String> queryString={
      'page':page.toString(),
      'pageSize':pageSize.toString()
    };

    var url=Uri.http(Config.apiURL,Config.sliderAPI);

    var response= await client.get(url,headers: requestHeaders);
    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      return sliderFromJson(data["data"]) ;
    }
    else {
      return null;
    }

  }

Future<Product?> getProductDetail(String productId) async{
  Map<String,String> requestHeaders= {
    'Content-Type':'application/json'
  };
  var url=Uri.http(Config.apiURL,"${Config.productAPI}/$productId");
  var response=await client.get(url,headers: requestHeaders);
  if(response.statusCode==200)
  {
    var data=jsonDecode(response.body);

    return Product.fromJson(data["data"]);
  }
  else {
    return null;
  }
}


Future<Cart?> getCart() async{

    Map<String,String> requestHeaders={
      'Content-Type':'application/json',
      'Authorization':'Basic token'
    };

    var url=Uri.http(Config.apiURL,Config.cartAPI);
    var response=await client.get(url,headers: requestHeaders);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);

      return Cart.fromJson(data["data"]);
    }
    else if(response.statusCode==401)
      {
        //user's token is expired
        //write code to move user to login page
      }
    else {
      return null;
    }



}

  Future<bool?> addCartItem(productId,qty) async{

    Map<String,String> requestHeaders={
      'Content-Type':'application/json',
      'Authorization':'Basic token'
    };

    var url=Uri.http(Config.apiURL,Config.cartAPI);
    var response=await client.post(url,headers: requestHeaders,body: jsonEncode({
      "products":[
        {
          "product":productId,
           "qty":qty
        }
      ]
    }));

    if(response.statusCode==200)
    {
      return true;
    }
    else if(response.statusCode==401)
    {
      //user's token is expired
      //write code to move user to login page
    }
    else {
      return null;
    }



  }


  Future<bool?> removeCartItem(productId,qty) async{

    Map<String,String> requestHeaders={
      'Content-Type':'application/json',
      'Authorization':'Basic token'
    };

    var url=Uri.http(Config.apiURL,Config.cartAPI);
    var response=await client.delete(url,headers: requestHeaders,body: jsonEncode({
        {
          "productId":productId,
          "qty":qty
        }

    }));

    if(response.statusCode==200)
    {
      return true;
    }
    else if(response.statusCode==401)
    {
      //user's token is expired
      //write code to move user to login page
    }
    else {
      return null;
    }



  }




}