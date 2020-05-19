import 'food_model.dart';
import 'package:flutter/material.dart';
import 'values.dart';
import 'cart_model.dart';
import 'package:provider/provider.dart';


class FoodCard extends StatefulWidget{
  final Food food;
  FoodCard(this.food);
  _FoodCardState createState()=>_FoodCardState();
}

class FoodCard1 extends StatefulWidget{
  final Food1 food1;
  FoodCard1(this.food1);
  _FoodCardState1 createState()=>_FoodCardState1();
}

class _FoodCardState extends State<FoodCard> with SingleTickerProviderStateMixin {
  Food get food => widget.food;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: roundedRectangle12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildImage(),
            buildTitle(),
            buildPriceInfo(),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      child: Image.asset(
        food.image,
       
          
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Text(
        food.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: titleStyle,
      ),
    );
  }


  Widget buildPriceInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '\Rs ${food.price}',
            style: titleStyle,
          ),
          Card(
            margin: EdgeInsets.only(right: 0),
            shape: roundedRectangle4,
            color: mainColor,
            child: InkWell(
              onTap: addItemToCard,
              splashColor: Colors.white70,
              customBorder: roundedRectangle4,
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }

  addItemToCard() {
    final snackBar = SnackBar(
      content: Text('${food.name} added to cart'),
      duration: Duration(milliseconds: 500),
    );
    Scaffold.of(context).showSnackBar(snackBar);
    Provider.of<MyCart>(context).addItem(CartItem(food: food, quantity: 1));
  }
}


class _FoodCardState1 extends State<FoodCard1> with SingleTickerProviderStateMixin {
  Food1 get food => widget.food1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: roundedRectangle12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildImage(),
            buildTitle(),
            buildPriceInfo(),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      child: new Image.asset(
        food.image,
        fit:BoxFit.fill,
        height:MediaQuery.of(context).size.height/5,  
       
          
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Text(
        food.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: titleStyle,
      ),
    );
  }
  Widget buildPriceInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '\Rs ${food.price}',
            style: titleStyle,
          ),
          Card(
            margin: EdgeInsets.only(right: 0),
            shape: roundedRectangle4,
            color: mainColor,
            child: InkWell(
              onTap: addItemToCard,
              splashColor: Colors.white70,
              customBorder: roundedRectangle4,
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }

  addItemToCard() {
    final snackBar = SnackBar(
      content: Text('${food.name} added to cart'),
      duration: Duration(milliseconds: 500),
    );
    Scaffold.of(context).showSnackBar(snackBar);
    Provider.of<MyCart>(context).addItem1(CartItem1(food: food, quantity: 1));
  }
}
