import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:weather/view/home/components/history.dart';
import 'package:weather/view_model/controllers/home_controller.dart';
import '../../../res/images/image_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: AnimatedSearchBar(
            onCityChanged: (city) {
              // Update the city and fetch new data
              controller.updateCity(city);
            },
          ),
        ),
        const Spacer(),
        IconButton(
          icon: Icon(Icons.history,color: Colors.grey,size: 30,),
          onPressed: () {
            Get.to(HistoryPage());
          },
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            ImageAssets.nightRain,
            height: 40,
            width: 40,
          ),
        )
      ],
    );
  }
}

class AnimatedSearchBar extends StatefulWidget {
  final ValueChanged<String> onCityChanged;

  AnimatedSearchBar({required this.onCityChanged});

  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _isSearchActive = false;
  final _focusNode = FocusNode();
  final _textController = TextEditingController();

  void _toggleSearch() {
    setState(() {
      _isSearchActive = !_isSearchActive;
    });
    if (!_isSearchActive) {
      _focusNode.unfocus();
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSearch,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        width: _isSearchActive ? 210 : 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.5, 0.5),
              blurRadius: 4.0,
            ),
            BoxShadow(
              color: Colors.white24,
              offset: Offset(-0.5, -0.5),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: _isSearchActive ? 10 : 0),
              child: Icon(Icons.search, color: Colors.grey),
            ),
            _isSearchActive
                ? Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: TextField(
                  controller: _textController,
                  autofocus: true,
                  focusNode: _focusNode,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    hintText: "Enter city name...",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onSubmitted: (value) {
                    // Capitalize the first letter of the city name
                    String capitalizedCity = value.trim();
                    if (capitalizedCity.isNotEmpty) {
                      capitalizedCity = capitalizedCity[0].toUpperCase() +
                          capitalizedCity.substring(1);
                      widget.onCityChanged(capitalizedCity);
                    } else {
                      _showToast("Please enter a city name");
                    }
                  },
                ),
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
