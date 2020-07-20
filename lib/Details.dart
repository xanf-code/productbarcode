import 'dart:convert';

import 'package:barcode/ModelProduct.dart';
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
    await http.get("http://127.0.0.1/productapi/getProduct.php?code=${widget.code}")
        .then((response){
          if(jsonDecode(response.body)!=null){
            product=Product.fromJson(jsonDecode(response.body));
          }
    });
    return product;
  }

  @override
  void initState() {
    getProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: product==null
          ? Center(child: Text('VALUE: ${widget.code}',style: TextStyle(color: Colors.white),)) :
      Container(
          child: Column(
            children: [
              Text("CODE: ${product.code}",style: TextStyle(fontSize: 20),),
              Text("CODE: ${product.id}",style: TextStyle(fontSize: 20),),
              Text("CODE: ${product.productname}",style: TextStyle(fontSize: 20),),
              Text("CODE: ${product.description}",style: TextStyle(fontSize: 20),),
              Text("CODE: ${product.cost}",style: TextStyle(fontSize: 20),),
              Text("CODE: ${product.stock}",style: TextStyle(fontSize: 20),)
            ],
          ),
      ),
    );
  }
}
