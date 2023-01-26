import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_flutter_exchange_project/page/routes/app_routes.dart';
import '../home/home.dart';

class App {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
  ];
}
