import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sangeet_g/component/product_card.dart';
import 'package:sangeet_g/models/category.dart';
import 'package:sangeet_g/widgets/widget_home_categories.dart';
import 'package:sangeet_g/widgets/widget_home_products.dart';
import 'package:sangeet_g/widgets/widget_home_slider.dart';

import '../models/product.dart';
import '../widgets/widget_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      body: ListView(children:  const [HomeSliderWidget() ,HomeCategoryWidget(),HomeProductWidget(),NavBar()
      ],),
    );
  }
}

