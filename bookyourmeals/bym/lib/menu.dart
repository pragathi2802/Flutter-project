import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'cart_model.dart';


void main() => runApp(MenuPage());

class MenuPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => MyCart(),
      child:  MaterialApp(
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
       routes: <String, WidgetBuilder> {
        '/home_page':(BuildContext context) => new HomePage1(),
        '/home_page':(BuildContext context) => new HomePage()
       },
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.amber,
      ),
        home: MyHomePage(title: 'Book Your Meals'),
    ),
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
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
        title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),//left top right bottom
                    child: Text('MENU',
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold
                            )
                            ),
                  )
                ],
              ),
            ),



            Container(
              padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 0.0),//left top right bottom
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
                                  Navigator.push(
                                            context,
                                  MaterialPageRoute(builder: (context) => HomePage()),
  );
},    
                        child: Center(
                          child: Text(
                            'VENDOR 1',
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
                           Navigator.push(
                                            context,
                                  MaterialPageRoute(builder: (context) => HomePage1()),
  );
                        },     
                        child: Center(
                          child: Text(
                            'VENDOR 2',
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

                ],
              ),
            ),
            
          ],
        ));
  }
}