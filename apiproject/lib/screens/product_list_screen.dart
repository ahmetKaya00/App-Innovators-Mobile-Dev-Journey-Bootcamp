import 'package:apiproject/Models/product.dart';
import 'package:apiproject/providers/cart_provider.dart';
import 'package:apiproject/screens/cart_screen.dart';
import 'package:apiproject/screens/product_detail_screen.dart';
import 'package:apiproject/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget{
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen>{
  final ApiService apiService = ApiService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürünler"),
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
      body: FutureBuilder<List<Product>>(
        future: apiService.fetchProducts(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
            return Center(child: Text("Hata: ${snapshot.error}"));
          }else{
            List<Product> products = snapshot.data ?? [];
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: Image.network(products[index].image, width: 50),
                    title: Text(products[index].title),
                    subtitle: Text("\$${products[index].price}"),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductDetailScreen(product: products[index]))
                      );
                    },
                  );
                }
            );
          }
        },
      ),
    );
  }
}