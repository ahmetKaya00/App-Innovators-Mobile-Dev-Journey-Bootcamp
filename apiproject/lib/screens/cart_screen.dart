import 'package:apiproject/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Sepetim')),
      body: cartProvider.cartItems.isEmpty
        ? Center(child: Text("Sepetiniz Boş!"))
        : ListView.builder(
        itemCount: cartProvider.cartItems.length,
          itemBuilder: (context, index){
          return ListTile(
            title: Text(cartProvider.cartItems[index].title),
            subtitle: Text("\$${cartProvider.cartItems[index].price}"),
            trailing: IconButton(
                onPressed: (){
                  cartProvider.removeFromCart(cartProvider.cartItems[index]);
                },
                icon: Icon(Icons.remove_circle),
            ),
          );
          },
      ),
      bottomNavigationBar: Text(
        "Toplam: \$${cartProvider.totalPrice}",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}