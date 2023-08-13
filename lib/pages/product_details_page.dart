import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sangeet_g/component/widget_col_exp.dart';
import 'package:sangeet_g/component/widget_custom_stepper.dart';
import 'package:sangeet_g/providers/providers.dart';

import '../config.dart';
import '../models/product.dart';
import '../widgets/widget_related_product.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  const ProductDetailPage({super.key});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
 int qty=1;
 String productId="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: _productDetail(ref),
      ),
    );
  }

  @override
  void didChangeDependencies(){
    final Map arguments=ModalRoute.of(context)!.settings.arguments as Map;
    if(arguments!=null){
      productId=arguments["productId"];
      print(productId);
    }
    super.didChangeDependencies();
  }
 Widget _productDetailUI(Product model)
 {
   return Container(
     color: Colors.white,
     padding: const EdgeInsets.all(10),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         SizedBox(
           height: 200,
           // width: MediaQuery.of(context).size.width,
           child: Image.network(model.productImage,
             fit: BoxFit.fitHeight,),
         ),
         Text(model.productName,
         style: const TextStyle(
           fontSize: 25,
           color: Colors.black,
           fontWeight: FontWeight.bold
         ),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Row(
               children: [
                 Text("${Config.currency}${model.productPrice.toString()}",
                   textAlign:TextAlign.left ,
                 style: TextStyle(
                   fontSize: 20,
                   color: model.calculateDiscount>0 ?Colors.red:Colors.black,
                   decoration: model.productSalePrice>0?TextDecoration.lineThrough:null
                 ),
                 ),
                 Text(
                   (model.calculateDiscount>0)?" ${Config.currency}${model.productSalePrice.toString()}":"",
                   textAlign:TextAlign.left ,
                   style: TextStyle(
                       fontSize: 20,
                       color: model.calculateDiscount>0 ?Colors.black:Colors.black,
                       fontWeight: FontWeight.bold
                   ),
                 ),

               ],
             ),
             TextButton.icon(onPressed: (){},
                 icon: const Text("SHARE",
                   style: TextStyle(
                       color:Colors.black,
                       fontSize: 13),
                 ),
                 label: const Icon(
                     Icons.share,
                     color: Colors.black,
                     size:20
                 ))
           ],
         ),
         const Text("Availability: YES",
         textAlign: TextAlign.center,
         style: TextStyle(
           fontSize: 13,
           color:Colors.black,
           fontWeight: FontWeight.bold
         ),
         ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("Product Code :${model.productSKU}",
             textAlign: TextAlign.center,
             style: const TextStyle(
                 fontSize: 13,
                 color:Colors.black,
                 fontWeight: FontWeight.bold
             ),
         ),
          ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             CustomStepper(
               loweLimit: 1,
               upperLimit: 20,
               stepValue: 1,
               iconSize: 22.0,
               value:1,
               onChanged:(value){
                 qty=value["qty"];
               } ,

             ),
             TextButton.icon(onPressed: (){
               final cartViewModel=ref.read(cartItemsProvider.notifier);
               cartViewModel.addCartItems(model.productId, qty);
             },
                 style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all(Colors.green),
                 ),
                 icon: const Icon(Icons.shopping_basket,
                 color: Colors.white,) ,
                 label: const Text(
                   "ADD TO Cart",
                   style:TextStyle(color: Colors.white) ,
                 ),
             )
           ],
         ),
         const SizedBox(
           height:15,
         ),
          ColExpand(title:"SHORT DESCRIPTION",
         content: model.productShortDescription,)

       ],

     ),
   );
 }

 Widget _productDetail(WidgetRef ref)
 {
   final  detail=ref.watch(productDetailsProvider(productId));
   return detail.when(data: (model){
     return Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         _productDetailUI(model!),
         RelatedProductWidget(model.relatedProducts!)
       ],
     );
   }, error: (_,__)=>
       const Center(
         child: Text("Error"),
       )
       , loading: ()=>const Center(child:CircularProgressIndicator())
   );



 }

}