import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangeet_g/models/pagination.dart';
import 'package:sangeet_g/providers/providers.dart';

import '../component/product_card.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/product_filter.dart';

class HomeProductWidget extends ConsumerWidget {
  const HomeProductWidget({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // List<Product> list=List<Product>.empty(growable:true);
    // list.add(Product(productName: "productName", category: Category(categoryName: ""
    //     ,categoryId: "",categoryImage: ""), productShortDescription: "productShortDescription", productPrice: 120, productSalePrice: 100, productImage: "https://www.google.com/url?sa=i&url=http%3A%2F%2Ft1.gstatic.com%2Flicensed-image%3Fq%3Dtbn%3AANd9GcR61F36y-FxJ1SuhuKrBUmJeQtWyklBOtf_QcqLNnziuboOyVCBPXjSiJsNqIQ_AIvd&psig=AOvVaw2kqTz0y7RnAfl7EUl4x7Yg&ust=1691523642994000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIiq1eqmy4ADFQAAAAAdAAAAABAE", productSKU: "productSKU", productType: "productType", productStatus: "productStatus", productId: "productId")
    // );
    // list.add(Product(productName: "productName", category: Category(categoryName: ""
    //     ,categoryId: "",categoryImage: ""), productShortDescription: "productShortDescription", productPrice: 120, productSalePrice: 100, productImage: "https://www.google.com/url?sa=i&url=http%3A%2F%2Ft1.gstatic.com%2Flicensed-image%3Fq%3Dtbn%3AANd9GcR61F36y-FxJ1SuhuKrBUmJeQtWyklBOtf_QcqLNnziuboOyVCBPXjSiJsNqIQ_AIvd&psig=AOvVaw2kqTz0y7RnAfl7EUl4x7Yg&ust=1691523642994000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIiq1eqmy4ADFQAAAAAdAAAAABAE", productSKU: "productSKU", productType: "productType", productStatus: "productStatus", productId: "productId")
    // );
    // list.add(Product(productName: "productName", category: Category(categoryName: ""
    //     ,categoryId: "",categoryImage: ""), productShortDescription: "productShortDescription", productPrice: 120, productSalePrice: 100, productImage: "https://www.google.com/url?sa=i&url=http%3A%2F%2Ft1.gstatic.com%2Flicensed-image%3Fq%3Dtbn%3AANd9GcR61F36y-FxJ1SuhuKrBUmJeQtWyklBOtf_QcqLNnziuboOyVCBPXjSiJsNqIQ_AIvd&psig=AOvVaw2kqTz0y7RnAfl7EUl4x7Yg&ust=1691523642994000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIiq1eqmy4ADFQAAAAAdAAAAABAE", productSKU: "productSKU", productType: "productType", productStatus: "productStatus", productId: "productId")
    // );
    // list.add(Product(productName: "productName", category: Category(categoryName: ""
    //     ,categoryId: "",categoryImage: ""), productShortDescription: "productShortDescription", productPrice: 120, productSalePrice: 100, productImage: "https://www.google.com/url?sa=i&url=http%3A%2F%2Ft1.gstatic.com%2Flicensed-image%3Fq%3Dtbn%3AANd9GcR61F36y-FxJ1SuhuKrBUmJeQtWyklBOtf_QcqLNnziuboOyVCBPXjSiJsNqIQ_AIvd&psig=AOvVaw2kqTz0y7RnAfl7EUl4x7Yg&ust=1691523642994000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIiq1eqmy4ADFQAAAAAdAAAAABAE", productSKU: "productSKU", productType: "productType", productStatus: "productStatus", productId: "productId")
    // );
    // list.add(Product(productName: "productName", category: Category(categoryName: ""
    //     ,categoryId: "",categoryImage: ""), productShortDescription: "productShortDescription", productPrice: 120, productSalePrice: 100, productImage: "https://www.google.com/url?sa=i&url=http%3A%2F%2Ft1.gstatic.com%2Flicensed-image%3Fq%3Dtbn%3AANd9GcR61F36y-FxJ1SuhuKrBUmJeQtWyklBOtf_QcqLNnziuboOyVCBPXjSiJsNqIQ_AIvd&psig=AOvVaw2kqTz0y7RnAfl7EUl4x7Yg&ust=1691523642994000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIiq1eqmy4ADFQAAAAAdAAAAABAE", productSKU: "productSKU", productType: "productType", productStatus: "productStatus", productId: "productId")
    // );
    // list.add(Product(productName: "productName", category: Category(categoryName: ""
    //     ,categoryId: "",categoryImage: ""), productShortDescription: "productShortDescription", productPrice: 120, productSalePrice: 100, productImage: "https://www.google.com/url?sa=i&url=http%3A%2F%2Ft1.gstatic.com%2Flicensed-image%3Fq%3Dtbn%3AANd9GcR61F36y-FxJ1SuhuKrBUmJeQtWyklBOtf_QcqLNnziuboOyVCBPXjSiJsNqIQ_AIvd&psig=AOvVaw2kqTz0y7RnAfl7EUl4x7Yg&ust=1691523642994000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIiq1eqmy4ADFQAAAAAdAAAAABAE", productSKU: "productSKU", productType: "productType", productStatus: "productStatus", productId: "productId")
    // );



    return Container(
      color: const Color(0xffF4F7FA),
      child:   Column(
        children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16,top:15 ),
              child: Text("Top 10 Products",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),

          ],

        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _productList(ref),
        ),
      ],

      ),
    );
  }
}

Widget _buildProductList(List<Product> products){
  return Container(
    height: 200,
    alignment: Alignment.centerLeft,
    child: ListView.builder(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: ( context, index) {
        var data=products[index];
        return GestureDetector(
          onTap:(){},
          child: ProductCard(
            model:data
          ),
        );
      },
      itemCount: products.length,
    ),
  );
}


Widget _productList(WidgetRef ref){
  final products=ref.watch(
    homeProductProvider(
      ProductFilterModel(
        paginationModel:PaginationModel(page: 1, pageSize: 10),
      ),
    ),
  );

  return products.when(
      data:(list) {
        return _buildProductList(list! as List<Product>);
      },
      error: (_,__)=>
        const Center(
          child: Text('Error'),
        )
      ,
      loading: ()=> const Center(
    child: CircularProgressIndicator(),
  )
  );
}





