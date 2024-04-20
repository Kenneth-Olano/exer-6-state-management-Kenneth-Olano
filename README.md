# exer-6-state-management-Kenneth-Olano

Kenneth O. Olano
2022-06983
CMSC 23 - UV4L

This app is a modification of the sample code from the handout, which features a shopping experience where users can view products fro the Catalog page and add to their cart
the products that they want to buy. They can add or delete any products to their cart, and when they're done, they can checkout the products that is in their cart and will display
each item along with its price, and the total price.

In the code, I added an ElevatedButton widget to the MyCart.dart for the checkout button on the My Cart page. Moreover, I also added a new dart file inside the screen folder
named Checkout.dart. This file contains the Checkout class which will build the Checkout page which will display once the user presses the checkout page on the My Cart page.
If the user's cart is empty, the checkout page will display a prompt that says the cart is empty, which is returned as a Text widget by the getShoppingCart function. Else, it 
will display all of the Item elements in the cart list, along with the total price of all the items in the cart and the checkout button. The checkout button will clear all
of the items in the cart list and reset the total price to 0, and eventually go back to the catalog page.

The challenge(s) that I faced when developing the app is understanding the concept of State Management and how can I apply it properly in to the code and implement what was on the
specifications required in the exercise. I struggled figuring out what files should I add to the program and how will I use state management on it,