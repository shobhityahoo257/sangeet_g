import 'dart:async';
import 'dart:convert';


import 'package:sangeet_g/config.dart';
import 'package:sangeet_g/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiService=Provider((ref)=>APIService());

class APIService{
  static var client =http.Client();
  FutureOr<List<Category>?> getCategories(page,pageSize) async {
    print("CALLING API");
    Map<String,String> requestHeaders= {
      'Content-Type':'application/json'
    };
    print('Below MAP');
    Map<String,String> queryString={
      'page':page.toString(),
      'pageSize':pageSize.toString()
    };
    print('apiUrl=${Config.apiURL}');
    print('categoryAPI=${Config.categoryAPI}');
    print('queryString=$queryString');

    var url=Uri.http(Config.apiURL,Config.categoryAPI);

    print('url=$url');


    var response= await client.get(url,headers: requestHeaders);
    var body=response.body;
    print('BODY=$body');
    print('response=$response');
    if(response.statusCode==200)
      {
        var data=jsonDecode(response.body);
        return categoriesFromJson(data["data"]) ;
      }
    else {
      return null;
    }
  }
}