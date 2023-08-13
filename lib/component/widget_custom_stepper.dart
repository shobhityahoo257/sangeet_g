import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
   CustomStepper({super.key, required this.loweLimit, required this.upperLimit, required this.stepValue, required this.iconSize, required this.onChanged,required this.value});

  final int loweLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  int value;
  final ValueChanged<dynamic> onChanged;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(10)

      ),
      margin: const EdgeInsets.only(top:10),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 2),
              child: Icon(
                Icons.remove,color: Colors.black,
                size:20
              ),
            ),
            onTap: (){
              setState(() {
              widget.value=widget.value ==widget.loweLimit?widget.loweLimit:widget.value-=widget.stepValue;
              widget.onChanged({"qty":widget.value,"type":"-"});
              });
            },
          ),
          SizedBox(
            width: widget.iconSize,
            child: Text(
              widget.value.toString(),
             style: TextStyle(
               fontSize:widget.iconSize*.7,
             color: Colors.black),
              textAlign: TextAlign.center,
            ),

          ),
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 2),
              child: Icon(
                  Icons.add,color: Colors.black,
                  size:20
              ),
            ),
            onTap: (){
              setState(() {
              widget.value=widget.value ==widget.upperLimit?widget.upperLimit:widget.value+=widget.stepValue;
              widget.onChanged({"qty":widget.value,"type":"+"});
              });
            },
          ),
        ],

      ),
    );
  }
}
