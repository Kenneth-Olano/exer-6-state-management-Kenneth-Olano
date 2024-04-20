import 'package:flutter/material.dart';
import '../../model/Item.dart';
import "package:provider/provider.dart";
import "../../provider/shoppingcart_provider.dart";
import "../../screen/MyCart.dart";

class Checkout extends StatelessWidget {
  const Checkout({super.key});
  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
       
      ),
      body: Column(
        children: <Widget>[
          const Text("Item Details"),
          const Divider(color: Colors.black, thickness: 2),
          getShoppingCart(context),
          
        ]
      )
    );
  } 

  Widget getShoppingCart(BuildContext context) {
    List<Item> shoppingCart = context.watch<ShoppingCart>().cart;
    if(shoppingCart.isEmpty){
      return const Text("No items to checkout");
    }
    else{
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
            Text("Total price to pay: ${context.watch<ShoppingCart>().cartTotal.toString()}"),
            ElevatedButton(
              child: Text("Pay Now"),
              onPressed: () {
                context.read<ShoppingCart>().removeAll();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Payment successful!"),
                duration: const Duration(seconds: 1, milliseconds:
                100),
                
                ));
                Navigator.pop(context);
                Navigator.pop(context);
              })
         ]
       )
      );
    }
  }
}