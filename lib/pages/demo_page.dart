import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class GradientContainer extends StatelessWidget{
  const GradientContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white,Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text('This is App',style: TextStyle(
              color: Colors.white
          ),),
        ),
      ),
    );
    throw UnimplementedError();
  }

}