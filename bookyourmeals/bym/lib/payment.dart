import 'package:flutter/material.dart';
void main() => runApp(PaymentPage());

class PaymentPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyPaymentPage(title: 'Book Your Meals'),
    );
  }
}

class MyPaymentPage extends StatefulWidget {
  MyPaymentPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyPaymentPageState createState() => _MyPaymentPageState();
}

class _MyPaymentPageState extends State<MyPaymentPage> {
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
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 90.0, 0.0, 0.0),//left top right bottom
                    child: Text('PAYMENT',
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
              padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 0.0),//left top right bottom
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
                        },     
                        child: Center(
                          child: Text(
                            'Pay Online',
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
      
        )
    
        );
    
  }
}