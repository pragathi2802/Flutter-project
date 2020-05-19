import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'values.dart';
import 'cart_model.dart';
import 'payment.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
        '/payment':(BuildContext context)=>new PaymentPage(),
      },
      home:new CheckOutPage(),
    );
  }
}

class CheckOut1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
        '/payment':(BuildContext context)=>new PaymentPage(),
      },
      home:new CheckOutPage1(),
    );
  }
}


class CheckOutPage extends StatefulWidget {
  _CheckOutPageState createState() => _CheckOutPageState();
}

class CheckOutPage1 extends StatefulWidget {
  _CheckOutPageState1 createState() => _CheckOutPageState1();
}

class _CheckOutPageState extends State<CheckOutPage> {
  var now = DateTime.now();
  get weekDay => DateFormat('EEEE').format(now);
  get day => DateFormat('dd').format(now);
  get month => DateFormat('MMMM').format(now);

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<MyCart>(context);
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...buildHeader(),
              ListView.builder(
                itemCount: cart.cartItems.length,
                shrinkWrap: true,
                controller: scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return buildCartItemList(cart, cart.cartItems[index]);
                },
              ),
              SizedBox(height: 16),
              Divider(),
              buildPriceInfo(cart),
              proceedtopaymentButton(cart,context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildHeader() {
    return [
      SafeArea(
        child: InkWell(
          customBorder: StadiumBorder(),
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.arrow_back_ios),
                SizedBox(width: 8),
                Text('Back', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Text('Cart', style: headerStyle),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 0),
        child: Text('$weekDay, ${day}th of $month ', style: headerStyle),
      ),
      FlatButton(
        child: Text('+ Order More'),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ];
  }

  Widget buildPriceInfo(MyCart cart) {
    double total = 0;
    for (CartItem cart in cart.cartItems) {
      total += cart.food.price * cart.quantity;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Total:', style: headerStyle),
        Text('\Rs ${total.toStringAsFixed(2)}', style: headerStyle),
      ],
    );
  }

Widget proceedtopaymentButton(MyCart cart, context) {
    return Container(
      margin: EdgeInsets.only(top: 24, bottom: 64),
      width: double.infinity,
      child: RaisedButton(
        child: Text('Payment', style: titleStyle),
        onPressed: () {
          Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentPage()),
    );
        },
        padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
        color: mainColor,
        shape: StadiumBorder(),
      ),
    );
  }


  Widget buildCartItemList(MyCart cart, CartItem cartModel) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Image.asset(cartModel.food.image),
              ),
            ),
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 45,
                    child: Text(
                      cartModel.food.name,
                      style: subtitleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        customBorder: roundedRectangle4,
                        onTap: () => cart.decreaseItem(cartModel),
                        child: Icon(Icons.remove_circle),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
                        child: Text('${cartModel.quantity}', style: titleStyle),
                      ),
                      InkWell(
                        customBorder: roundedRectangle4,
                        onTap: () => cart.increaseItem(cartModel),
                        child: Icon(Icons.add_circle),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 45,
                    width: 70,
                    child: Text(
                      '\Rs ${cartModel.food.price}',
                      style: titleStyle,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  InkWell(
                    onTap: () => cart.removeAllInCart(cartModel.food),
                    customBorder: roundedRectangle12,
                    child: Icon(Icons.delete_sweep, color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





class _CheckOutPageState1 extends State<CheckOutPage1> {
  var now = DateTime.now();
  get weekDay => DateFormat('EEEE').format(now);
  get day => DateFormat('dd').format(now);
  get month => DateFormat('MMMM').format(now);

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<MyCart>(context);
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...buildHeader(),
              //cart items list
              ListView.builder(
                itemCount: cart.cartItems1.length,
                shrinkWrap: true,
                controller: scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return buildCartItemList(cart, cart.cartItems1[index]);
                },
              ),
              SizedBox(height: 16),
              Divider(),
              buildPriceInfo(cart),
              //checkoutButton(cart, context),
              proceedtopaymentButton(cart,context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildHeader() {
    return [
      SafeArea(
        child: InkWell(
          customBorder: StadiumBorder(),
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.arrow_back_ios),
                SizedBox(width: 8),
                Text('Back', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Text('Cart', style: headerStyle),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 0),
        child: Text('$weekDay, ${day}th of $month ', style: headerStyle),
      ),
      FlatButton(
        child: Text('+ Order More'),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ];
  }

  Widget buildPriceInfo(MyCart cart) {
    double total = 0;
    for (CartItem1 cart in cart.cartItems1) {
      total += cart.food.price * cart.quantity;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Total:', style: headerStyle),
        Text('\Rs ${total.toStringAsFixed(2)}', style: headerStyle),
      ],
    );
  }

  /*Widget checkoutButton(MyCart cart, context) {
    return Container(
      margin: EdgeInsets.only(top: 24, bottom: 64),
      width: double.infinity,
      child: RaisedButton(
        child: Text('Checkout', style: titleStyle),
        onPressed: () {
          cart.clearCart1();
          Navigator.of(context).pop();
        },
        padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
        color: mainColor,
        shape: StadiumBorder(),
      ),
    );
  }*/

Widget proceedtopaymentButton(MyCart cart, context) {
    return Container(
      margin: EdgeInsets.only(top: 24, bottom: 64),
      width: double.infinity,
      child: RaisedButton(
        child: Text('Payment', style: titleStyle),
        onPressed: () {
          Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentPage()),
    );
        },
        padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
        color: mainColor,
        shape: StadiumBorder(),
      ),
    );
  }


  Widget buildCartItemList(MyCart cart, CartItem1 cartModel) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Image.asset(cartModel.food.image),
              ),
            ),
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 45,
                    child: Text(
                      cartModel.food.name,
                      style: subtitleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        customBorder: roundedRectangle4,
                        onTap: () => cart.decreaseItem1(cartModel),
                        child: Icon(Icons.remove_circle),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
                        child: Text('${cartModel.quantity}', style: titleStyle),
                      ),
                      InkWell(
                        customBorder: roundedRectangle4,
                        onTap: () => cart.increaseItem1(cartModel),
                        child: Icon(Icons.add_circle),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 45,
                    width: 70,
                    child: Text(
                      '\Rs ${cartModel.food.price}',
                      style: titleStyle,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  InkWell(
                    onTap: () => cart.removeAllInCart1(cartModel.food),
                    customBorder: roundedRectangle12,
                    child: Icon(Icons.delete_sweep, color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}