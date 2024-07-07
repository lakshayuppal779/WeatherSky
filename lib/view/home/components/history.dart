import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/view/home/components/bottom%20sheet.dart';
import 'package:weather/view/home/components/custom%20history%20item.dart';
import 'package:weather/view_model/controllers/home_controller.dart';
import '../../../res/images/image_assets.dart';


class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _loadHistoryData();
  }

  Future<void> _loadHistoryData() async {
    await controller.loadHistoryData();
  }

  void _onCityChanged(String city) {
    controller.updateCity(city);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search History',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              ImageAssets.nightRain,
              height: 40,
              width: 40,
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 10),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              builder: (context) {
                return CitySelectionBottomSheet(onCityChanged: _onCityChanged);
              },
            );
          },
          child: Icon(Icons.add, color: Colors.white, size: 34),
          backgroundColor: Colors.blueAccent,
          shape: CircleBorder(),
        ),
      ),
      body: Obx(() {
        if (controller.isLoadingHistory.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.searchHistory.length,
            itemBuilder: (context, index) {
              final city = controller.searchHistory[index];
              return FutureBuilder<Map<String, String>>(
                future: controller.fetchCityWeather(city).then((weatherData) => {
                  'condition': weatherData['condition'],
                  'temperature': weatherData['temperature'],
                }),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox.shrink();
                  } else if (snapshot.hasError) {
                    return ListTile(
                      title: Text(city),
                      subtitle: Text('Error loading weather data'),
                    );
                  } else {
                    final weatherData = snapshot.data!;
                    return HistoryItem(
                      city: city,
                      condition: weatherData['condition']!,
                      temperature: weatherData['temperature']!,
                      onTap: () {
                        controller.updateCity(city);
                        Get.back(); // Go back to the previous screen (HomeScreen)
                      },
                    );
                  }
                },
              );
            },
          );
        }
      }),
    );
  }
}
