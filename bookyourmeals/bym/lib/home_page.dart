import 'package:flutter/material.dart';
import 'values.dart';
import 'cart_model.dart';
import 'food_model.dart';
import 'cart_bottom_sheet.dart';
import 'food_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:new MyHomePage(),
    );
  }
}

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:new MyHomePage1(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePageState1 createState() => _MyHomePageState1();
}

class _MyHomePageState extends State<MyHomePage> {
  int value = 1;

  showCart() {
    showModalBottomSheet(
      shape: roundedRectangle40,
      context: context,
      builder: (context) => CartBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: <Widget>[
            buildAppBar(),
            Divider(),
            buildFoodList(),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    int items = 0;
    Provider.of<MyCart>(context).cartItems.forEach((cart) {
      items += cart.quantity;
    });
    return SafeArea(
      child: Row(
        children: <Widget>[
          Text('MENU', style: headerStyle),
          Spacer(),
          Stack(
            children: <Widget>[
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: showCart),
              Positioned(
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: mainColor),
                  child: Text(
                    '$items',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFoodList() {
    return Expanded(
      child: GridView.count(
        childAspectRatio: 0.65,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        crossAxisCount: 2,
        physics: BouncingScrollPhysics(),
        children: foods.map((food) {
          return FoodCard(food);
        }).toList(),
      ),
    );
  }
}
class _MyHomePageState1 extends State<MyHomePage1> {
  int value = 1;

  showCart() {
    showModalBottomSheet(
      shape: roundedRectangle40,
      context: context,
      builder: (context) => CartBottomSheet1(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: <Widget>[
            buildAppBar(),
            Divider(),
            buildFoodList(),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    int items = 0;
    Provider.of<MyCart>(context).cartItems1.forEach((cart) {
      items += cart.quantity;
    });
    return SafeArea(
      child: Row(
        children: <Widget>[
          Text('MENU', style: headerStyle),
          Spacer(),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          Stack(
            children: <Widget>[
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: showCart),
              Positioned(
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: mainColor),
                  child: Text(
                    '$items',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFoodList() {
    return Expanded(
      child: GridView.count(
        childAspectRatio: 0.65,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        crossAxisCount: 2,
        physics: BouncingScrollPhysics(),
        children: foods1.map((food) {
          return FoodCard1(food);
        }).toList(),
      ),
    );
  }
}