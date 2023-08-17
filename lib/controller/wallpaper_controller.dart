import 'package:get/get.dart';

import '../models/wallpaper_model.dart';

class WallpeparController extends GetxController {
  WallpeparModel wallpeparModel = WallpeparModel();

  getIndex({required int index}) {
    wallpeparModel.indexCheck = index;
    update();
  }
}
