import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

  static String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller= AnimationController(
      duration: Duration(seconds:1),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {

      });
      // print(animation.value);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value*80,
                  ),
                ),
            SizedBox(

               child: DefaultTextStyle(
                  style:TextStyle(
                     fontSize: 50.0,
                     color: Colors.black,
                      fontWeight: FontWeight.bold),
                child: AnimatedTextKit(
                   animatedTexts: [
                      TypewriterAnimatedText('Flash Chat'),
                   ],
                 ),
               ),
             ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: "Log In",
              colour: Colors.lightBlueAccent,
              onPress:(){
                 Navigator.pushNamed(context, LoginScreen.id);
              } ,
            ),
            RoundedButton(
              title: "Register",
              colour: Colors.blueAccent,
              onPress:(){
                Navigator.pushNamed(context, RegistrationScreen.id);
              } ,
            ),

          ],
        ),
      ),
    );
  }
}


