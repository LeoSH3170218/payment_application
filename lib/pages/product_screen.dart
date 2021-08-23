import 'package:flutter/material.dart';

import '../main.dart';
import 'cart_screen.dart';

class ProductScreen extends StatefulWidget {
  static const String id = "PRODUCT_SCREEN";

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> products = [
    Product(productID: 1, productName: "Mobile", productPrice: 200.50, color: Colors.green, productDescription: "Samsung"),
    Product(productID: 2, productName: "Red Dragon Keyboard", productPrice: 70.00, color: Colors.blue, productDescription: "Mechanical"),
    Product(productID: 3, productName: "Dell laptop", productPrice: 750.00, color: Colors.grey, productDescription: "inspiron"),
    Product(productID: 4, productName: "Custom PC", productPrice: 9500.00, color: Colors.yellow, productDescription: "Gaming pc"),
    Product(productID: 5, productName: "RTX 3090", productPrice: 2000.00, color: Colors.cyan, productDescription: "GPU"),
  ];
  CartModel cart = new CartModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        backgroundColor: Color.fromRGBO(36, 62, 110, 0.85),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: products.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              String productName = products[index].productName;
              return GestureDetector(
                onTap: () {
                  final scaffold = ScaffoldMessenger.of(context);
                  cart.add(products[index]);
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text('$productName added Successfully to Cart'),
                      duration: Duration(seconds: 1),
                      action: SnackBarAction(
                          label: 'HIDE',
                          onPressed: scaffold.hideCurrentSnackBar
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: products[index].color,
                          radius: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].productName,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              products[index].productDescription,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          products[index].productPrice.toString() + " JOD",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
              );
            },
          ),
          Spacer(),
          CustomButton(
              callback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen(cart: cart,)),
                );
              },
              text: "Cart",
              color: Color.fromRGBO(36, 62, 110, 0.85)
          ),
        ],
      )
    );
  }
}

class Product{
  int productID;
  String productName;
  String productDescription;
  double productPrice;
  Color color;
  Product({
    required this.productID,
    required this.productName,
    required this.productPrice,
    required this.color,
    required this.productDescription
});
}
