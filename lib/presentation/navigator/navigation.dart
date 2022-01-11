import 'package:get/route_manager.dart';

import '../../ui/pages/pages.dart';
import 'routes.dart';

class PagesRoutes {
  PagesRoutes._();

  static const String initial = AppRoutes.home;

  static final routes = [
    //General Routes
    GetPage(name: AppRoutes.home, page: () => const HomeView()),
    GetPage(name: AppRoutes.search, page: () => const SearchView()),
  ];
}
