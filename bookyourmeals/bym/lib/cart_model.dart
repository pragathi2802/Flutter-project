import 'package:flutter/material.dart';
import 'food_model.dart';


class MyCart extends ChangeNotifier {
  List<CartItem> items = [];
  List<CartItem1> items1 = [];
  List<CartItem> get cartItems => items;
  
  List<CartItem1> get cartItems1 => items1;

  void addItem(CartItem cartItem) {
    for (CartItem cart in cartItems) {
      if (cartItem.food.name == cart.food.name) {
        cartItems[cartItems.indexOf(cart)].quantity++;
        notifyListeners();
        return;
      }
    }
    items.add(cartItem);
    notifyListeners();
  }
  void addItem1(CartItem1 cartItem) {
    for (CartItem1 cart in cartItems1) {
      if (cartItem.food.name == cart.food.name) {
        cartItems1[cartItems1.indexOf(cart)].quantity++;
        notifyListeners();
        return;
      }
    }
    items1.add(cartItem);
    notifyListeners();
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }
  void clearCart1() {
    items1.clear();
    notifyListeners();
  }

  void decreaseItem(CartItem cartModel) {
    if (cartItems[cartItems.indexOf(cartModel)].quantity <= 1) {
      return;
    }
    cartItems[cartItems.indexOf(cartModel)].quantity--;
    notifyListeners();
  }
  void decreaseItem1(CartItem1 cartModel) {
    if (cartItems1[cartItems1.indexOf(cartModel)].quantity <= 1) {
      return;
    }
    cartItems1[cartItems1.indexOf(cartModel)].quantity--;
    notifyListeners();
  }

  void increaseItem(CartItem cartModel) {
    cartItems[cartItems.indexOf(cartModel)].quantity++;
    notifyListeners();
  }

  void increaseItem1(CartItem1 cartModel) {
    cartItems1[cartItems1.indexOf(cartModel)].quantity++;
    notifyListeners();
  }


  void removeAllInCart(Food food) {
    cartItems.removeWhere((f) {
      return f.food.name == food.name;
    });
    notifyListeners();
  }

  void removeAllInCart1(Food1 food) {
    cartItems1.removeWhere((f) {
      return f.food.name == food.name;
    });
    notifyListeners();
  }
}

class CartItem {
  Food food;
  int quantity;

  CartItem({this.food, this.quantity});
}
class CartItem1 {
  Food1 food;
  int quantity;

  CartItem1({this.food, this.quantity});
}