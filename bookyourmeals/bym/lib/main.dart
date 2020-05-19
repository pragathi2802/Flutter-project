import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/signup':(BuildContext context) => new SignupPage(),
        '/login':(BuildContext context) => new LoginPage()
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
 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      resizeToAvoidBottomPadding:false,
      appBar: AppBar(
     
        title: Text(widget.title),
      ),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: Stack(
                children: <Widget>[
                   Center(
                        
                              
                              child: Image.asset('assets/i.png'),

                            ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 190.0, 0.0, 0.0),//left top right bottom
                    child: Text('Book Your Meals!',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold
                            )
                            ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 90.0, 20.0, 0.0),//left top right bottom
              child: Column(
                children: <Widget>[
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.amberAccent,
                      color: Colors.amber,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/signup');
                        },     
                        child: Center(
                          child: Text(
                            'SIGNUP',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.amberAccent,
                      color: Colors.amber,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                           Navigator.of(context).pushNamed('/login');
                        },     
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                 

                ],
              ),
            ),
           
          ],
     
        )
   
        );
      
  }
}


