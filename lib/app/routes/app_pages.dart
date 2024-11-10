import 'package:get/get.dart';
import 'package:appbaru/app/modules/home/bindings/home_binding.dart';
import 'package:appbaru/app/modules/home/bindings/welcome_binding.dart';
import 'package:appbaru/app/modules/home/views/home_view.dart';
import 'package:appbaru/app/modules/home/views/welcome.dart';
import 'package:appbaru/app/modules/article_detail/bindings/article_detail_bindings.dart';
import 'package:appbaru/app/modules/article_detail/views/article_detail_view.dart';
import 'package:appbaru/app/modules/article_detail/views/article_detail_web_view.dart';
import 'package:appbaru/app/modules/http_screen/views/http_view.dart';
import 'package:appbaru/app/modules/http_screen/bindings/http_bindings.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/welcome',
      page: () => WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.HTTP,
        page: () => const HttpView(),
        binding: HttpBinding()
        ),
    GetPage(
        name: _Paths.ARTICLE_DETAILS,
        page: () => ArticleDetailPage(article: Get.arguments),
        binding: ArticleDetailBinding()),
    GetPage(
        name: _Paths.ARTICLE_DETAILS_WEBVIEW,
        page: () => ArticleDetailWebView(article: Get.arguments),
        binding: ArticleDetailBinding()),
  ];
}
