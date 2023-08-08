import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sangeet_g/widgets/widget_home_categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: ListView(children: const [HomeCategoryWidget()],),
      ),
    );
  }
}

