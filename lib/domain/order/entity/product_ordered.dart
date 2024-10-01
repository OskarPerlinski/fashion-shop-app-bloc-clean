class ProductOrderedEntity {
  final String productId;
  final String productTitle;
  final String productSize;
  final double productPrice;
  final String productImage;
  final String createdDate;
  final String id;

  ProductOrderedEntity(
      {required this.productId,
      required this.productTitle,
      required this.productSize,
      required this.productPrice,
      required this.productImage,
      required this.createdDate,
      required this.id});
}