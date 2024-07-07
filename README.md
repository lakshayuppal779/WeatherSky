
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

### Running the App

To run the app on an emulator or a physical device, use the following command:

```bash
flutter run
```

### Using Git Large File Storage (LFS)

This project uses Git LFS to manage large files such as images and data files. Ensure Git LFS is installed and initialized:

```bash
git lfs install
```

Track your large files:

```bash
git lfs track "*.jpg" "*.png" "data/*.csv"
```

Add and commit your changes:

```bash
git add .
git commit -m "Add large files tracked by Git LFS"
```

Push to the remote repository:

```bash
git push origin main
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
4. Tap on + icon to add new city 

## Contributions

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature/your-feature-name`).
6. Open a pull request.

Happy Coding!
