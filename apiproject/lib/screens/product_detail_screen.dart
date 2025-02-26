import 'package:apiproject/Models/product.dart';
import 'package:apiproject/providers/cart_provider.dart';
import 'package:apiproject/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget{
  final Product product;
  ProductDetailScreen({required this.product});
  
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                },
                icon: Icon(Icons.shopping_cart),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Consumer<CartProvider>(
                  builder: (context,carProvider,child){
                    return carProvider.cartItems.isEmpty
                        ? SizedBox()
                        :CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 10,
                      child: Text(
                        carProvider.cartItems.length.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(product.image, height: 200),
          SizedBox(height: 10),
          Text(product.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("\$${product.price}",style: TextStyle(fontSize: 18, color: Colors.green)),
          SizedBox(height: 10),
          Text(product.description),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: (){
                cartProvider.addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ürün sepete eklendi!")));
              },
              child: Text("Sepete Ekle"),
          )
        ],
      ),
    );
  }
}