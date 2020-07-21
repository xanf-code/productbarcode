import 'dart:convert';
import 'package:barcode/Model/ModelProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsPage extends StatefulWidget {
  final String code;
  DetailsPage(this.code);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Product product;

  Future<Product> getProduct()async{
    await http.get("http://127.0.0.1/productapi/getProduct.php?code=${widget.code}",headers: {"Accept": "application/json"})
        .then((response){
          if(jsonDecode(response.body)!=null){
            product = Product.fromJson(jsonDecode(response.body));
          }
    });
    return product;
  }

  @override
  void initState() {
    getProduct();
    print(product);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: product==null
          ? Center(child: Text("Value : ${widget.code}",style: TextStyle(color: Colors.white),),) :
      Container(
          child: Column(
            children: [
              Text("CODE: ${product.code}",style: TextStyle(fontSize: 20,color: Colors.white),),
              Text("ID: ${product.id}",style: TextStyle(fontSize: 20,color: Colors.white),),
              Text("NAME: ${product.productname}",style: TextStyle(fontSize: 20,color: Colors.white),),
              Text("DESCRIPTION: ${product.description}",style: TextStyle(fontSize: 20,color: Colors.white),),
              Text("COST: ${product.cost}",style: TextStyle(fontSize: 20,color: Colors.white),),
              Text("STOCK: ${product.stock}",style: TextStyle(fontSize: 20,color: Colors.white),)
            ],
          ),
      ),
    );
  }
}
