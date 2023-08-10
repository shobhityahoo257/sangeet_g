import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangeet_g/models/pagination.dart';
import 'package:sangeet_g/models/product_filter.dart';
import 'package:sangeet_g/providers/providers.dart';

import '../component/product_card.dart';
import '../models/product.dart';

class RelatedProductWidget extends ConsumerWidget {
  const RelatedProductWidget(this.relatedProduct, {super.key});
  final List<String> relatedProduct;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(

    child:  Column(
      children: [
        const Text("Related Product",
        style: TextStyle(
          fontSize:18,
          fontWeight: FontWeight.bold
        ),
        ),
        Visibility(
            child:_productList(ref),
          visible: relatedProduct.isNotEmpty,
        )
      ],
    ),);
  }
  Widget _buildProductList(List<Product>? product)
  {
   return Container(
     height: 200,
     alignment: Alignment.centerLeft,
     child: ListView.builder(
       shrinkWrap: true,
         physics: const ClampingScrollPhysics(),
         scrollDirection: Axis.horizontal,
         itemCount: product?.length,
         itemBuilder: (context,index){
         var data=product?[index];
         return GestureDetector(
           onTap: (){},
           child: ProductCard(
             model: data,
           ),

         );
         }),
   );
  }


  Widget _productList(WidgetRef ref)
  {
    final product=ref.watch(relatedProductProvider(
      ProductFilterModel(paginationModel: PaginationModel(
        pageSize: 10,
        page: 1
      ),)
    )
    );
    return product.when(
      data:(list){
        return _buildProductList(list);
      },
      error: (_,__)=> const Center(
        child: Text("Error"),
      ),
      loading:()=>const Center(child: CircularProgressIndicator(),)

    );
  }
}
