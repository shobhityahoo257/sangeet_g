import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sangeet_g/component/widget_custom_stepper.dart';

import '../config.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product? model;
  const ProductCard({super.key, this.model});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Visibility(
              visible: model!.calculateDiscount>0,
                child: Flexible(
                  child: Row(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                        ),
                        child:Text("${model!.calculateDiscount}% OFF",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),) ,

                      ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 60)),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                              size: 20,
                            ),
                          onTap: (){

                              },
                        ),
                      )],
                  ),
                )),
            GestureDetector(onTap: (){
              Navigator.of(context).pushNamed('/product-detail',
              arguments: {'productId':model!.productId},
              );

            },

              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Image.network(model!.fullImagePath,fit: BoxFit.cover
                  ,),
      ),
            ),
         Padding(
           padding:const EdgeInsets.only(top: 8,left: 10) ,
            child:Text(
           model!.productName,
           textAlign: TextAlign.left,
           overflow: TextOverflow.ellipsis,
           style: const TextStyle(
             fontSize: 13,
             color:Colors.black ,
             fontWeight: FontWeight.bold
           ),
         ),
         ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Row(
                    children: [
                      Text("${Config.currency}${model!.productPrice.toString()}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        color:model!.calculateDiscount>0 ?Colors.red :Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: model!.productSalePrice>0?TextDecoration.lineThrough:null
                      ),
                      ),
                      Text(
                        model!.calculateDiscount>0 ? model!.productSalePrice.toString() :"",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10),
                        child: CustomStepper(
                          loweLimit: 0,
                          upperLimit: 20,
                          stepValue: 1,
                          iconSize: 22.0,
                          value:0,
                          onChanged:(value){
                           // qty=value["qty"];
                          } ,

                        ),
                      ),
                    ],
                  ),
                  ),

                ],
              ),
            )
          ]
      ),
      )],
    );
  }
}
