class Product {
  final int id;
  final int code;
  final String productname;
  final int cost;
  final String description;
  final int stock;

  Product(
      {this.id,
      this.code,
      this.productname,
      this.cost,
      this.description,
      this.stock});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      code: json['code'],
      productname: json['product_name'],
      cost: json['cost'],
      description: json['description'],
      stock: json['stock'],
    );
  }
}
