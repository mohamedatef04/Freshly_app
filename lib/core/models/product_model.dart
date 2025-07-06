class ProductModel {
  final String? productId;
  final String? name;
  final String? description;
  final String? image;
  final String? price;
  final bool? isBestSelling;
  final String? organicPercentage;
  final String? expirationDate;
  final String? calories;
  final String? category;
  final List? cartItems;
  final List? wishlistProducts;
  final List? purchasedProducts;
  final List? ratesProducts;
  int quantity;

  ProductModel({
    this.productId,
    this.name,
    this.description,
    this.image,
    this.isBestSelling,
    this.price,
    this.organicPercentage,
    this.expirationDate,
    this.calories,
    this.category,
    this.cartItems,
    this.wishlistProducts,
    this.purchasedProducts,
    this.ratesProducts,

    this.quantity = 1,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productId: json['id'],
    name: json['product_name'],
    description: json['product_description'],
    image: json['product_image'],
    isBestSelling: json['is_best_selling'],
    price: json['product_price'],
    organicPercentage: json['organic_percentage'],
    expirationDate: json['expiration_date'],
    calories: json['calories'],
    category: json['category'],
    cartItems: json['cart_products'],
    wishlistProducts: json['wishlist_products'],
    purchasedProducts: json['purchased_products'],
    ratesProducts: json['rates_table'],
  );

  icreasement() {
    quantity = quantity + 1;
  }

  decrement() {
    if (quantity > 1) {
      quantity = quantity - 1;
    }
  }

  calculatePrice() {
    return double.parse(price!) * quantity;
  }
}
