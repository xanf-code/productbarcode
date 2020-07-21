# Demo

[![Demo Link](https://img.youtube.com/vi/_2oKN243dLs/0.jpg)](https://www.youtube.com/watch?v=_2oKN243dLs)

# Barcode Checkout System
A minimal fast barcode product check out system built using Flutter for frontend and SEQUEL as backend.

## How does it work?
Let's start off by storing a set of products to the backend SQL Database, and host it on a local server. Now we have a JSON list of products which can be parsed using appropriate header callback function and flutter HTTP package.

### Connection.php

![connphp](https://github.com/xanf-code/productbarcode/blob/master/AppShots/conn.PNG)

Above is the block of code which will be used to establish the connection with the localhost server.
As mentioned above the callback function here is the "$code", the callback code is appended to the header of the url when the barcode is scanned, and the matching row in the SQL table is returned as a list tile.

### getProduct.php

![productsphp](https://github.com/xanf-code/productbarcode/blob/master/AppShots/getProducts.PNG)

As you can above the callback function is $code and we query for the keyword code from the table Producttable(in my case), the $YOUR_TABLE_NAME must be replaced with your table name.

### Checklist

- [x] Product Scanner
- [ ] Barcode Search implementation

### Database Structure

![DB Structure](https://github.com/xanf-code/productbarcode/blob/master/AppShots/dbStruct.PNG)

The Structure of the MySql Database.

### JSON Structure

![JSON Structure](https://github.com/xanf-code/productbarcode/blob/master/AppShots/postman.PNG)

The H001 at the end of http://localhost/productapi/getProduct.php?code=H001 is the callback which is passed to the server after the barcode is scanned.

You can create custom barcodes using [InkScape](https://inkscape.org/) and pass the code into the barcode as UTF-8 format.

### Link to the backend files

[Backend Files](https://github.com/xanf-code/BackendProdCode)

### LICENCE

Released under the [MIT](./LICENSE) License.<br>
