import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:weather/view/home/components/app_bar.dart';
import 'package:weather/view/home/components/container_list.dart';
import 'package:weather/view/home/components/hours_list.dart';
import 'package:weather/view/home/components/info_card.dart';
import 'package:weather/view/home/components/location.dart';
import 'package:weather/view/next-days/next_14_days.dart';
import 'package:weather/view_model/controllers/home_controller.dart';

// new
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  DateTime? lastPressed;

  Future<void> _refresh() async {
    controller.getData();
  }

  Future<bool> onWillPop() async {
    final now = DateTime.now();
    const exitWarningDuration = Duration(seconds: 2);

    if (lastPressed == null || now.difference(lastPressed!) > exitWarningDuration) {
      lastPressed = now;
      Fluttertoast.showToast(
        msg: "Press again to exit the app",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.lightBlue,
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Obx(() {
            // Observe the loading state
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(), // Show progress indicator
              );
            } else {
              return RefreshIndicator(
                onRefresh: _refresh,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomAppBar(),
                        Location(),
                        Hero(
                          tag: 'TAG',
                          child: Material(
                            color: Colors.transparent,
                            child: InfoCard(),
                          ),
                        ),
                        ContainerList(),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => NextDays()),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Today',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Next 14 Days ->',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        HoursList(),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
