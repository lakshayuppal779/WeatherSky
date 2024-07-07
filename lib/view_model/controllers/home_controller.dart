import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/Model/data_model.dart';
import 'package:weather/repositry/home_repositry.dart';
import 'package:weather/view/home/home_screen.dart';
import '../../res/app_url/app_url.dart';
import '../../res/images/image_assets.dart';
import '../../utils/utils.dart';

class HomeController extends GetxController {
  Rx<DataModel?> model = Rx<DataModel?>(null);
  Rx<Hours?> hours = Rx<Hours?>(null);
  Rx<int> currentIndex = 0.obs;
  RxBool animator = false.obs;
  RxBool isLoading = false.obs;
  RxList<String> searchHistory = <String>[].obs;
  RxBool isLoadingHistory = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadSearchHistory();
  }

  Future<void> loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    searchHistory.value = prefs.getStringList('searchHistory') ?? [];
  }

  Future<void> saveSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('searchHistory', searchHistory.toList());
  }

  int getCurrentIndex() => currentIndex.value;
  bool compareIndex(int index) => index == currentIndex.value;
  String getHour(int index) => Utils.formateTimeWithout(model.value!.days![0].hours![index].datetime);
  String getImage(int index) =>  Utils.imageMap[model.value!.days![0].hours![index].conditions.toString()] == null ? ImageAssets.nightStarRain : Utils.imageMap[model.value!.days![0].hours![index].conditions.toString()]!;
  String getAddress() => '${model.value!.address.toString()},\n${model.value!.timezone.toString()}';
  String getCondition() => hours.value!.conditions.toString();
  String getCurrentTemp() => hours.value!.temp.toInt().toString();
  String getFeelLike() => hours.value!.feelslike.toString();
  String getCloudOver() => hours.value!.cloudcover.toInt().toString();
  String getWindSpeed() => hours.value!.windspeed.toInt().toString();
  String getHumidity() => hours.value!.humidity.toInt().toString();

  Future<void> getData() async {
    isLoading.value = true;
    try {
      final value = await HomeReposirty.hitApi();
      print('API Response: $value');
      model.value = DataModel.fromJson(value);
      for (int i = 0; i < model.value!.days![0].hours!.length; i++) {
        if (Utils.checkTime(model.value!.days![0].hours![i].datetime)) {
          hours.value = model.value!.days![0].hours![i];
          currentIndex.value = i;
          break;
        }
      }
      isLoading.value = false;
      Get.off(HomeScreen());
    } catch (error) {
      print('Error fetching data: $error');
      isLoading.value = false;
    }
  }

  Future<Map<String, dynamic>> fetchCityWeather(String city) async {
    AppUrl.updateCity(city);
    final value = await HomeReposirty.hitApi();
    final dataModel = DataModel.fromJson(value);
    final currentHour = dataModel.days![0].hours![0];
    return {
      'condition': currentHour.conditions,
      'temperature': currentHour.temp.toInt().toString(),
    };
  }

  Future<void> loadHistoryData() async {
    isLoadingHistory.value = true;
    try {
      await Future.wait(
        searchHistory.map((city) => fetchCityWeather(city)).toList(),
      );
    } finally {
      isLoadingHistory.value = false;
    }
  }

  Future<String> getConditionForCity(String city) async {
    final weatherData = await fetchCityWeather(city);
    return weatherData['condition'];
  }

  Future<String> getTemperatureForCity(String city) async {
    final weatherData = await fetchCityWeather(city);
    return weatherData['temperature'];
  }

  void setHour(int index) {
    Timer(Duration(milliseconds: 100), () => animator.value = true);
    currentIndex.value = index;
    hours.value = model.value!.days![0].hours![index];
    Timer(Duration(milliseconds: 100), () => animator.value = false);
  }

  void updateCity(String city) async {
    AppUrl.updateCity(city);
    if (!searchHistory.contains(city)) {
      searchHistory.add(city);
      saveSearchHistory();
    }
    await getData();
  }
}
