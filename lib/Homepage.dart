import 'package:barcode/Details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  String code = "";
//  String getcode = "";

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanBarcodeNormal() async {
    try {
      await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE).then((String code){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(code)));
      });
    } on PlatformException {
      return 'Failed to get platform version.';
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Product Scanner'),
        backgroundColor: Color(0xFF121212),
      ),
      body: Container(
        color: Color(0xFF121212),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: FlatButton.icon(
                  color: Colors.white,
                  onPressed: () => scanBarcodeNormal(),
                  label: Text('Scan Product'),
                  icon: Icon(Icons.add_shopping_cart)),
            ),
          ],
        ),
      ),
    );
  }
}
