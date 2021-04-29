import 'package:emails/model/user_data.dart';
import 'package:emails/screen_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.only(top:0.0),
                child: Container(
                  width: 250.0,
                  height: 250.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://www.macworld.co.uk/cmsdata/features/3682378/how-to-change-sender-name-in-mail-main_thumb1200_4-3.png'),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30.0,left:40.0),
                child: Column(
                  children: [
                    Sign_In(description:'Enter your name',index:1),
                    Sign_In(description:'Enter your Phone Number',index:2),
                    Sign_In(description:'Enter your Email',index:3),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: MaterialButton(
                  onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=> ContactScreen(),
                      ),
                    );
                  },
                  child:Container(
                    width: 150.0,
                    height: 60.0,
                    child: Center(
                      child: Text(
                        'sign in',
                        style: TextStyle(
                            fontSize: 20.0
                        ),
                      ),
                    ),
                    decoration:BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            //Color(0xff0d69ff).withOpacity(0.0),
                            Color(0xFF4FC3F7).withOpacity(0.10),
                            Color(0xFF4FC3F7).withOpacity(0.5),
                            Color(0xFF4FC3F7).withOpacity(0.5),
                            Color(0xFF4FC3F7).withOpacity(0.5),
                            Color(0xFF4FC3F7).withOpacity(0.20),
                          ],
                          stops: [
                            0.0,
                            0.25,
                            0.7,
                            0.75,
                            2.0
                          ]),
                    ),
                  ),

                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}


class Sign_In extends StatelessWidget {
  String description;
  int index;
  Sign_In({this.description,this.index});

  @override
  Widget build(BuildContext context) {
    return
        Padding(
          padding: const EdgeInsets.only(right:30.0,top:15.0),
          child: Container(
            width: 250.0,
              height: 80.0,
              child:TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: description,
                ),
                onSubmitted: (String str)
                {
                     if(index==1) UserData.nameUser=str;
                     else if(index==2) UserData.phoneNumberUser=str;
                     else if(index==3) UserData.emailUser=str;
                },
          ),

      ),
        );
  }
}