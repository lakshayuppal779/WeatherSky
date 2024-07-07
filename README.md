
# WeatherSky

WeatherSky is a comprehensive weather application built using Flutter and GetX. It provides real-time weather updates for cities around the world. Users can search for the current weather, view detailed weather information, and maintain a history of previously searched cities.

## Features

- **Current Weather Information**: Displays current weather conditions, temperature, humidity, wind speed, and more.
- **City Search**: Allows users to search for weather information by city name.
- **Search History**: Maintains a history of previously searched cities along with their weather details.
- **Animated Search Bar**: Includes an animated search bar in the custom app bar.
- **Weather Icons**: Displays appropriate weather icons based on the current weather conditions.

## Screenshots

![Screenshot_2024-07-07-11-49-38-36_067ca54d029a1c65bea8d27590265e45](https://github.com/lakshayuppal779/WeatherSky/assets/117820155/56ef4d48-eb0d-4de4-9dbe-b8a75e96822a)
![Screenshot_2024-07-07-11-49-56-80_067ca54d029a1c65bea8d27590265e45](https://github.com/lakshayuppal779/WeatherSky/assets/117820155/0b6ee26f-ede8-46fb-baea-c54441bdefba)
![Screenshot_2024-07-07-11-49-48-84_067ca54d029a1c65bea8d27590265e45](https://github.com/lakshayuppal779/WeatherSky/assets/117820155/ddaff1db-3adc-4c30-8430-c88d487834ea)
![Screenshot_2024-07-07-11-51-15-03_067ca54d029a1c65bea8d27590265e45](https://github.com/lakshayuppal779/WeatherSky/assets/117820155/deb61e0a-9a96-4b98-a2d2-32b3fcf732c2)

## Installation

### Prerequisites

Before you begin, ensure you have met the following requirements:

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Git: [Install Git](https://git-scm.com/)
- Git LFS: [Install Git LFS](https://git-lfs.github.com/)

### Clone the Repository

To clone the repository, run the following commands:

```bash
git clone https://github.com/lakshayuppal779/WeatherSky.git
cd WeatherSky
```

### Install Dependencies

Navigate to the project directory and install the required dependencies:

```bash
flutter pub get
```

### Visual Crossing Weather API

WeatherSky uses the Visual Crossing Weather API to fetch real-time weather data. The API provides accurate weather information including temperature, humidity, wind speed, and more. To use the API, you need to sign up and obtain an API key from the Visual Crossing website.

Configure API key:

- Navigate to the lib/res/app_url/app_url.dart file.
- Replace YOUR_API_KEY with your Visual Crossing Weather API key.

```bash
class AppUrl {
  static const String baseUrl = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline';
  static const String apiKey = 'YOUR_API_KEY'; // Add your Visual Crossing API key here

  static String getWeather(String city) {
    return '$baseUrl/$city?unitGroup=metric&key=$apiKey';
  }
}
```

### Running the App

To run the app on an emulator or a physical device, use the following command:

```bash
flutter run
```

## Project Structure

```plaintext
lib/
├── main.dart                # Entry point of the application
├── view/                    # Contains UI components
│   ├── home/                # Home screen components
│   │   ├── components/      # Custom app bar and history item components
│   │   │   ├── custom_app_bar.dart
│   │   │   ├── history_item.dart
│   │   ├── history.dart     # History page
│   │   ├── home_screen.dart # Home screen
├── view_model/              # Contains controllers
│   ├── controllers/         # GetX controllers
│   │   ├── home_controller.dart
├── res/                     # Resources
│   ├── images/              # Image assets
│   │   ├── image_assets.dart
│   ├── app_url/             # API endpoints
│   │   ├── app_url.dart
├── utils/                   # Utility functions
│   ├── utils.dart
```

## Usage

### Searching for a City

1. Tap on the search icon in the custom app bar.
2. Enter the city name and press enter.
3. The app will display the current weather information for the entered city.

### Viewing Search History

1. Tap on the history icon in the custom app bar.
2. The app will display a list of previously searched cities.
3. Tap on any city in the list to view its weather details.
4. Tap on + icon to add new city.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributions

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature/your-feature-name`).
6. Open a pull request.
   

Happy Coding!
