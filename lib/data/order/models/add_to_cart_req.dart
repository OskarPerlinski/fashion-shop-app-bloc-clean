// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddToCartReq {
  final String productId;
  final String productTitle;
  final String productSize;
  final double productPrice;
  final String productImage;
  final String createdDate;

  AddToCartReq({
    required this.productId,
    required this.productTitle,
    required this.productSize,
    required this.productPrice,
    required this.productImage,
    required this.createdDate
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productSize': productSize,
      'productPrice': productPrice,
      'productImage': productImage,
      'createdDate': createdDate,
    };
  }

}