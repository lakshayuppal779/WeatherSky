import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/view_model/controllers/home_controller.dart';
import '../../../res/images/image_assets.dart';
import '../../../utils/utils.dart';

class Location extends StatelessWidget {
  Location({Key? key}) : super(key: key);

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.getAddress(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  Utils.formateDate(DateTime.now()),
                  style: TextStyle(
                    color: Colors.grey.withOpacity(.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10), // Spacer or SizedBox for spacing
          SizedBox(
            height: 150,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  ImageAssets.map,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
