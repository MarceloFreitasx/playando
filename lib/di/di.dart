import 'package:get/get.dart';

import '../data/services/services.dart';
import '../domain/services/services.dart';
import '../infra/infra.dart';
import '../presentation/controllers/controllers.dart';
import '../presentation/presenters/presenters.dart';
import '../ui/pages/pages.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HttpClient>(HttpService());
    Get.put<VideoStorageData>(VideoStorage(LocalStorageService('videos')));

    Get.lazyPut<HomePresenter>(() => HomePresentation());
    Get.lazyPut<HomeController>(() => HomeControl(Get.find()));
  }
}
