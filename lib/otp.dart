import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';


class MyOtp extends StatefulWidget {
  const MyOtp({super.key});

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {




  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.black,
        ),
        ),),
      body: Container(
        margin: EdgeInsets.only(left:25,right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/img.png',width: 150,height: 150,),
              SizedBox(height: 20,),
              Text('Phone Authentication',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              Text('We need to register Before started',style: TextStyle(fontSize: 16)),
              SizedBox(height: 20,),

              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                validator: (s) {
                  return s == '2222' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),


              SizedBox(height: 20,),
              SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                  }, child: Text('Verify OTP'),style: ElevatedButton.styleFrom(
                      primary: Colors.green.shade600,shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
                  ),)
              ),
              Row(
                  children:[
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, 'homePage');
                    }, child: Text('Edit Mobile Number ?',style: TextStyle(color: Colors.black),) ),]
              )
            ],
          ),
        ),
      ),
    );
  }
}
