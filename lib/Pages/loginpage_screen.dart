import 'package:flutter/material.dart';


class LoginPageScreen extends StatefulWidget{

  LoginPageScreenState createState()=>LoginPageScreenState();
}
class LoginPageScreenState extends State<LoginPageScreen>{
  final emailController = TextEditingController();
  final passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          Image(image: NetworkImage("https://images.pexels.com/photos/995043/pexels-photo-995043.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            fit: BoxFit.contain,),
          Positioned(
            top: 100,
            child: Padding(padding: EdgeInsets.only(left: 32),
              child:  Text("Welcome!!",
                style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w700,),),
            ),
          ),
          Positioned(
            top: 400,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),
                height: MediaQuery.of(context).size.height/1,
                width: MediaQuery.of(context).size.width*1,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    semanticContainer: true,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 17,),
                          child: Text("Sign in",
                            style: TextStyle(fontSize: 27,fontWeight: FontWeight.w700,color: Colors.blue[900]),),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                          child:TextField(
                            controller: emailController,
                            enabled: false,
                            decoration: InputDecoration(
                                hintText: "Email:",
                                contentPadding: EdgeInsets.all(20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  ),
                                )
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10),
                          child:TextField(
                            controller: passwdController,
                            enabled: false,
                            decoration: InputDecoration(
                                hintText: "Password:",
                                contentPadding: EdgeInsets.all(20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.white
                                  ),
                                )
                            ),
                          ),

                        ),

                        SizedBox(
                          height: 27,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          color: Colors.lightBlueAccent,
                          onPressed: (){

                          },
                          child: Text("Sign in",style: TextStyle(color: Colors.white),),),
                        SizedBox(
                          height: 15,
                        ),

                        RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Don't have an account?",
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400)
                                ),
                                TextSpan(
                                    text: " Sign up",
                                    style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w400)

                                )
                              ]
                          ),
                        )

                      ],
                    )


                )

            ),
          )
        ],
      ),
    );

  }

}