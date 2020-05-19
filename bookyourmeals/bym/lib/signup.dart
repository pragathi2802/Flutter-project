import 'dart:ui';
import 'package:flutter/material.dart';
import 'menu.dart';
void main() => runApp(SignupPage());

class SignupPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/menu':(BuildContext context) => new MenuPage()
      },
      
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Book Your Meals'),
    );
  }
}

class MyHomePage extends StatefulWidget {
MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      resizeToAvoidBottomPadding: false,
     
        appBar: AppBar(
        title: Text(widget.title),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 80.0, 10.0, 0.0),
                    child: Text(
                      'SIGNUP',
                      style: TextStyle(
                        fontSize: 30.0,fontWeight: FontWeight.bold)
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:35.0,left:20.0,right:20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'USERNAME',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color:Colors.grey
                      ),  
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber)
                      )
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color:Colors.grey
                      ),  
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber)
                      )
                    ),
                    obscureText: true,
                  ),

                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color:Colors.grey
                      ),  
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber)
                      ),
                    suffixIcon:IconButton(
                              icon:Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                              onPressed: (){
                                setState(()
                                {
                                    _obscureText = !_obscureText;


                                });
                              },
                            )
                            
                            
                            ),
                  ),


                  SizedBox(height: 20.0,),
                  Container(
                    height: 40.0,
                    child:Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.amberAccent,
                      color: Colors.amber,
                      elevation: 1.0,
                      child:GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/menu');
                        },
                        child: Center(
                          child:Text(
                            'SIGNUP',
                            style:TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0,),
                 
                  Container(
                    height: 40.0, 
                    color: Colors.transparent,
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image.asset('assets/gmail1.png'),
                            ),
                            SizedBox(width: 10.0),
                            Center(
                              child: Text(
                                'Continue with Google',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            )
                          ],
                        )),
                  ),

                 
                ],
              ),
            ),
           

          ],
        )
   );
  }
}