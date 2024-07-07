import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:weather/view_model/controllers/home_controller.dart';

class CitySelectionBottomSheet extends StatefulWidget {
  final ValueChanged<String> onCityChanged;  // Add this line to receive the callback

  CitySelectionBottomSheet({required this.onCityChanged});  // Update the constructor

  @override
  _CitySelectionBottomSheetState createState() => _CitySelectionBottomSheetState();
}

class _CitySelectionBottomSheetState extends State<CitySelectionBottomSheet> {
  final HomeController controller = Get.find<HomeController>();
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
    return SizedBox(
      height: MediaQuery.of(context).size.height - 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel", style: TextStyle(color: Colors.blue,fontSize: 16)),
                ),
                Spacer(),
                Text(
                  "Add city",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(flex: 2),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Icon(Icons.search, color: Colors.grey),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            focusNode: _focusNode,
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onSubmitted: (value) {
                              String capitalizedCity = value.trim();
                              if (capitalizedCity.isNotEmpty) {
                                capitalizedCity = capitalizedCity[0].toUpperCase() +
                                    capitalizedCity.substring(1);
                                widget.onCityChanged(capitalizedCity);  // Call the callback function
                              } else {
                                _showToast("Please enter a city name");
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text("Current city",style: TextStyle(color: Colors.grey),),
            SizedBox(height: 8),
            Chip(
              label: Text("Panipat", style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.all(3),
            ),
            SizedBox(height: 16),
            Text("Top cities",style: TextStyle(color: Colors.grey),),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildCityChip("New Delhi"),
                _buildCityChip("Kolkata"),
                _buildCityChip("Mumbai"),
                _buildCityChip("Chennai"),
                _buildCityChip("Lucknow"),
              ],
            ),
            SizedBox(height: 16),
            Text("Top cities - World",style: TextStyle(color: Colors.grey),),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildCityChip("New York"),
                _buildCityChip("Paris"),
                _buildCityChip("London"),
                _buildCityChip("Tokyo"),
                _buildCityChip("Rome"),
                _buildCityChip("Dubai"),
                _buildCityChip("Moscow"),
                _buildCityChip("Sydney"),
                _buildCityChip("Singapore"),
                _buildCityChip("Beijing"),
                _buildCityChip("Athens"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCityChip(String cityName) {
    return GestureDetector(
      onTap: () {
        widget.onCityChanged(cityName);  // Call the callback function
        Navigator.pop(context);
      },
      child: Chip(
        label: Text(cityName,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.all(3),
      ),
    );
  }
}
