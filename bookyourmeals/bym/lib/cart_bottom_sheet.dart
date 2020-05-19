import 'package:flutter/material.dart';
import 'values.dart';
import 'cart_model.dart';
import 'checkout_page.dart';
import 'package:provider/provider.dart';

class CartBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyCart cart = Provider.of<MyCart>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Container(
              width: 90,
              height: 8,
              decoration: ShapeDecoration(
                  shape: StadiumBorder(), color: Colors.black26),
            ),
          ),
          buildTitle(cart),
          Divider(),
          if (cart.cartItems.length <= 0)
            noItemWidget()
          else
            buildItemsList(cart),
          Divider(),
          buildPriceInfo(cart),
          SizedBox(height: 8),
          addToCardButton(cart, context),
        ],
      ),
    );
    
  }

  Widget buildTitle(cart) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Your Order', style: headerStyle),
        RaisedButton.icon(
          icon: Icon(Icons.delete_forever),
          color: Colors.red,
          shape: StadiumBorder(),
          splashColor: Colors.white60,
          onPressed: cart.clearCart,
          textColor: Colors.white,
          label: Text('Clear'),
        ),
      ],
    );
  }

  Widget buildItemsList(MyCart cart) {
    return Expanded(
      child: ListView.builder(
        itemCount: cart.cartItems.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: new Image.asset(cart.cartItems[index].food.image)),
              title: Text('${cart.cartItems[index].food.name}',
                  style: subtitleStyle),
              subtitle: Text('\Rs ${cart.cartItems[index].food.price}'),
              trailing: Text('x ${cart.cartItems[index].quantity}',
                  style: subtitleStyle),
            ),
          );
        },
      ),
    );
  }

  Widget noItemWidget() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('You don\'t have any order yet!!', style: titleStyle2),
            SizedBox(height: 16),
            Icon(Icons.remove_shopping_cart, size: 40),
          ],
        ),
      ),
    );
  }

  Widget buildPriceInfo(MyCart cart) {
    double total = 0;
    for (CartItem cartModel in cart.cartItems) {
      total += cartModel.food.price * cartModel.quantity;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Total:', style: headerStyle),
        Text('\Rs ${total.toStringAsFixed(2)}', style: headerStyle),
      ],
    );
  }

  Widget addToCardButton(cart, context) {
    return Center(
      child: RaisedButton(
        child: Text('Add to Cart', style: titleStyle),
        onPressed: cart.cartItems.length == 0
            ? null
            : () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckOutPage()));
              },
        padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
        color: mainColor,
        shape: StadiumBorder(),
      ),
    );
  }
}




class CartBottomSheet1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyCart cart = Provider.of<MyCart>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Container(
              width: 90,
              height: 8,
              decoration: ShapeDecoration(
                  shape: StadiumBorder(), color: Colors.black26),
            ),
          ),
          buildTitle(cart),
          Divider(),
          if (cart.cartItems1.length <= 0)
            noItemWidget()
          else
            buildItemsList(cart),
          Divider(),
          buildPriceInfo(cart),
          SizedBox(height: 8),
          addToCardButton(cart, context),
        ],
      ),
    );
    
  }

  Widget buildTitle(cart) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Your Order', style: headerStyle),
        RaisedButton.icon(
          icon: Icon(Icons.delete_forever),
          color: Colors.red,
          shape: StadiumBorder(),
          splashColor: Colors.white60,
          onPressed: cart.clearCart1,
          textColor: Colors.white,
          label: Text('Clear'),
        ),
      ],
    );
  }

  Widget buildItemsList(MyCart cart) {
    return Expanded(
      child: ListView.builder(
        itemCount: cart.cartItems1.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: new Image.asset(cart.cartItems1[index].food.image)),

              title: Text('${cart.cartItems1[index].food.name}',
                  style: subtitleStyle),
              subtitle: Text('\Rs ${cart.cartItems1[index].food.price}'),
              trailing: Text('x ${cart.cartItems1[index].quantity}',
                  style: subtitleStyle),
            ),
          );
        },
      ),
    );
  }

  Widget noItemWidget() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('You don\'t have any order yet!!', style: titleStyle2),
            SizedBox(height: 16),
            Icon(Icons.remove_shopping_cart, size: 40),
          ],
        ),
      ),
    );
  }

  Widget buildPriceInfo(MyCart cart) {
    double total = 0;
    for (CartItem1 cartModel in cart.cartItems1) {
      total += cartModel.food.price * cartModel.quantity;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Total:', style: headerStyle),
        Text('\Rs ${total.toStringAsFixed(2)}', style: headerStyle),
      ],
    );
  }

  Widget addToCardButton(cart, context) {
    return Center(
      child: RaisedButton(
        child: Text('Add to Cart', style: titleStyle),
        onPressed: cart.cartItems1.length == 0
            ? null
            : () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckOutPage1()));
              },
        padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
        color: mainColor,
        shape: StadiumBorder(),
      ),
    );
  }
}
