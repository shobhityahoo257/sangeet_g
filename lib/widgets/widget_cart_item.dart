import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sangeet_g/component/widget_custom_stepper.dart';

import '../config.dart';
import '../models/cart_product.dart';

class CartItemWidget extends StatelessWidget {

  const CartItemWidget({
    Key?key,
    required this.model,
    this.onQtyUpdate,
    this.onItemRemove,
}):super(key: key);

  final CartProduct model;
  final Function? onQtyUpdate;
  final Function? onItemRemove;


  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.white),
          child: cartItem(context),
      ),
    );
  }

  Widget cartItem(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0,10,10,5),
          child: Container(
            width: 100,
            alignment: Alignment.center,
            child: Image.network(model.product.productImage!=null ?model.product.productImage :"" ,
            height: 100,
            fit: BoxFit.fill,),
          ),
        ),
        SizedBox(
          width: 230,
            child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                Text(
                  model.product.productName,
                  style: const TextStyle(
                    color:Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${Config.currency}${model.product.productPrice.toString()}",
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomStepper(
                        loweLimit: 1, upperLimit: 20, stepValue: 1, iconSize: 15.0, onChanged: (value){
                          onQtyUpdate!(model,value["qty"],value["type"]);
                    }, value: model.qty.toInt(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5),
                      child: GestureDetector(
                        child: const Icon(
                          Icons.delete,color: Colors.red,
                        ),
                        onTap: (){
                          onItemRemove!(model);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
        )
      ],
    );
  }
}
