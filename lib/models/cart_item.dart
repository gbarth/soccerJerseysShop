class CartItem {
  final String id;
  final String productId;
  final String name;
  final int quantity;
  final double price;
  final String imageP;

  CartItem({
    required this.imageP,
    required this.id,
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
  });
}
