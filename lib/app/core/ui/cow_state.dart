import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class CowState<S extends StatefulWidget, C extends GetxController>
    extends State<S> {
  C get controller => Get.find();
}
