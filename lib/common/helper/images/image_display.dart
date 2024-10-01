import 'package:fashion_app/core/configs/constants/app_urls.dart';

class ImageDisplayHelper {

  static String generateProductImageUrl(String title) {
    return AppUrls.productImage + title + AppUrls.alt;
  }
}