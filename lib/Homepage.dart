import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String code="";
  String getCode="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
      ),
      body: Container(
        color: Color(0xFF121212),
        child: Center(
          child: FlatButton.icon(
            onPressed: () {},
            icon: Icon(Icons.shopping_basket),
            label: Text('Scan Product'),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
