import 'package:flutter/material.dart';
import '../../model/Item.dart';
import "package:provider/provider.dart";
import "../../provider/shoppingcart_provider.dart";
import "../../screen/MyCart.dart";

class Checkout extends StatelessWidget { //checkout page is a stateless widget
  const Checkout({super.key});
  @override
  Widget build(BuildContext context){ //builder for checkout page
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
       
      ),
      body: Column(
        children: <Widget>[
          const Text("Item Details"),
          const Divider(color: Colors.black, thickness: 2),
          getShoppingCart(context), //function call which will return a widget based on contents of the shopping cart
          
        ]
      )
    );
  } 

  Widget getShoppingCart(BuildContext context) {
    List<Item> shoppingCart = context.watch<ShoppingCart>().cart; //gets the contents of shopping cart using watch function as we need to keep track whether the list has changed (item was added or deleted)
    if(shoppingCart.isEmpty){ //checks if shopping cart is empty 
      return const Text("No items to checkout"); //display prompt text
    }
    else{ //if not, display all items in the shoppingCart with name and price as well as the Total Price and the Checkout button
      return Expanded(
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: shoppingCart.length,
              itemBuilder:(BuildContext context, int index){
                return ListTile(
                  title: Text(shoppingCart[index].name),
                  trailing: Text(shoppingCart[index].price.toString()),
                );
              },
            ),
            const Divider(color: Colors.black, thickness: 2),
            Text("Total price to pay: ${context.watch<ShoppingCart>().cartTotal.toString()}"), //watch function used on model ShoppingCart as we need to get the updated total cost of all the items in the cart
            ElevatedButton( //pay now button
              child: const Text("Pay Now"),
              onPressed: () {
                context.read<ShoppingCart>().removeAll(); //since we are accessing a function, we can use read function from the model
                ScaffoldMessenger.of(context).showSnackBar( const SnackBar( //show pop up message
                content: Text("Payment successful!"),
                duration: Duration(seconds: 1, milliseconds:
                100),
                
                ));
                Navigator.pop(context); //pop the current navigation page which goes back to My Cart page
                Navigator.pop(context); //pops My Cart page to go back to My Catalog page
              })
         ]
       )
      );
    }
  }
}