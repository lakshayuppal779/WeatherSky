import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final String city;
  final String condition;
  final String temperature;
  final VoidCallback onTap;

  HistoryItem({
    required this.city,
    required this.condition,
    required this.temperature,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.withOpacity(.7),
              Colors.blue,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.5, 0.5),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  condition,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              '$temperature°',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
