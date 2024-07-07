class AppUrl {
  static String url = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Panipat?unitGroup=metric&key=B8SCSBSA3D9UJUN4UJVZ2F9AY&contentType=json';

  static void updateCity(String city) {
    url = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$city?unitGroup=metric&key=B8SCSBSA3D9UJUN4UJVZ2F9AY&contentType=json';
  }
}
