class DataModel {
  dynamic queryCost;
  dynamic latitude;
  dynamic longitude;
  dynamic resolvedAddress;
  dynamic address;
  dynamic timezone;
  dynamic tzoffset;
  dynamic description;
  List<Days>? days;
  List<dynamic>? alerts;
  Stations? stations;
  CurrentConditions? currentConditions;

  DataModel(
      {this.queryCost,
        this.latitude,
        this.longitude,
        this.resolvedAddress,
        this.address,
        this.timezone,
        this.tzoffset,
        this.description,
        this.days,
        this.alerts,
        this.stations,
        this.currentConditions});

  DataModel.fromJson(Map<String, dynamic> json) {
    queryCost = json['queryCost'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    resolvedAddress = json['resolvedAddress'];
    address = json['address'];
    timezone = json['timezone'];
    tzoffset = json['tzoffset'];
    description = json['description'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(Days.fromJson(v));
      });
    }
    alerts = json['alerts'];
    stations = json['stations'] != null ? Stations.fromJson(json['stations']) : null;
    currentConditions = json['currentConditions'] != null ? CurrentConditions.fromJson(json['currentConditions']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['queryCost'] = queryCost;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['resolvedAddress'] = resolvedAddress;
    data['address'] = address;
    data['timezone'] = timezone;
    data['tzoffset'] = tzoffset;
    data['description'] = description;
    if (days != null) {
      data['days'] = days!.map((v) => v.toJson()).toList();
    }
    data['alerts'] = alerts;
    if (stations != null) {
      data['stations'] = stations!.toJson();
    }
    if (currentConditions != null) {
      data['currentConditions'] = currentConditions!.toJson();
    }
    return data;
  }
}

class Days {
  dynamic datetime;
  dynamic datetimeEpoch;
  dynamic tempmax;
  dynamic tempmin;
  dynamic temp;
  dynamic feelslikemax;
  dynamic feelslikemin;
  dynamic feelslike;
  dynamic dew;
  dynamic humidity;
  dynamic precip;
  dynamic precipprob;
  dynamic precipcover;
  List<dynamic>? preciptype;
  dynamic snow;
  dynamic snowdepth;
  dynamic windgust;
  dynamic windspeed;
  dynamic winddir;
  dynamic pressure;
  dynamic cloudcover;
  dynamic visibility;
  dynamic solarradiation;
  dynamic solarenergy;
  dynamic uvindex;
  dynamic severerisk;
  dynamic sunrise;
  dynamic sunriseEpoch;
  dynamic sunset;
  dynamic sunsetEpoch;
  dynamic moonphase;
  dynamic conditions;
  dynamic description;
  dynamic icon;
  List<dynamic>? stations;
  dynamic source;
  List<Hours>? hours;

  Days(
      {this.datetime,
        this.datetimeEpoch,
        this.tempmax,
        this.tempmin,
        this.temp,
        this.feelslikemax,
        this.feelslikemin,
        this.feelslike,
        this.dew,
        this.humidity,
        this.precip,
        this.precipprob,
        this.precipcover,
        this.preciptype,
        this.snow,
        this.snowdepth,
        this.windgust,
        this.windspeed,
        this.winddir,
        this.pressure,
        this.cloudcover,
        this.visibility,
        this.solarradiation,
        this.solarenergy,
        this.uvindex,
        this.severerisk,
        this.sunrise,
        this.sunriseEpoch,
        this.sunset,
        this.sunsetEpoch,
        this.moonphase,
        this.conditions,
        this.description,
        this.icon,
        this.stations,
        this.source,
        this.hours});

  Days.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    tempmax = json['tempmax'];
    tempmin = json['tempmin'];
    temp = json['temp'];
    feelslikemax = json['feelslikemax'];
    feelslikemin = json['feelslikemin'];
    feelslike = json['feelslike'];
    dew = json['dew'];
    humidity = json['humidity'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    precipcover = json['precipcover'];
    preciptype = json['preciptype'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    cloudcover = json['cloudcover'];
    visibility = json['visibility'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    sunrise = json['sunrise'];
    sunriseEpoch = json['sunriseEpoch'];
    sunset = json['sunset'];
    sunsetEpoch = json['sunsetEpoch'];
    moonphase = json['moonphase'];
    conditions = json['conditions'];
    description = json['description'];
    icon = json['icon'];
    stations = json['stations'];
    source = json['source'];
    if (json['hours'] != null) {
      hours = <Hours>[];
      json['hours'].forEach((v) {
        hours!.add(Hours.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datetime'] = datetime;
    data['datetimeEpoch'] = datetimeEpoch;
    data['tempmax'] = tempmax;
    data['tempmin'] = tempmin;
    data['temp'] = temp;
    data['feelslikemax'] = feelslikemax;
    data['feelslikemin'] = feelslikemin;
    data['feelslike'] = feelslike;
    data['dew'] = dew;
    data['humidity'] = humidity;
    data['precip'] = precip;
    data['precipprob'] = precipprob;
    data['precipcover'] = precipcover;
    data['preciptype'] = preciptype;
    data['snow'] = snow;
    data['snowdepth'] = snowdepth;
    data['windgust'] = windgust;
    data['windspeed'] = windspeed;
    data['winddir'] = winddir;
    data['pressure'] = pressure;
    data['cloudcover'] = cloudcover;
    data['visibility'] = visibility;
    data['solarradiation'] = solarradiation;
    data['solarenergy'] = solarenergy;
    data['uvindex'] = uvindex;
    data['severerisk'] = severerisk;
    data['sunrise'] = sunrise;
    data['sunriseEpoch'] = sunriseEpoch;
    data['sunset'] = sunset;
    data['sunsetEpoch'] = sunsetEpoch;
    data['moonphase'] = moonphase;
    data['conditions'] = conditions;
    data['description'] = description;
    data['icon'] = icon;
    data['stations'] = stations;
    data['source'] = source;
    if (hours != null) {
      data['hours'] = hours!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hours {
  dynamic datetime;
  dynamic datetimeEpoch;
  dynamic temp;
  dynamic feelslike;
  dynamic humidity;
  dynamic dew;
  dynamic precip;
  dynamic precipprob;
  dynamic snow;
  dynamic snowdepth;
  List<dynamic>? preciptype;
  dynamic windgust;
  dynamic windspeed;
  dynamic winddir;
  dynamic pressure;
  dynamic visibility;
  dynamic cloudcover;
  dynamic solarradiation;
  dynamic solarenergy;
  dynamic uvindex;
  dynamic severerisk;
  dynamic conditions;
  dynamic icon;
  List<dynamic>? stations;
  dynamic source;

  Hours(
      {this.datetime,
        this.datetimeEpoch,
        this.temp,
        this.feelslike,
        this.humidity,
        this.dew,
        this.precip,
        this.precipprob,
        this.snow,
        this.snowdepth,
        this.preciptype,
        this.windgust,
        this.windspeed,
        this.winddir,
        this.pressure,
        this.visibility,
        this.cloudcover,
        this.solarradiation,
        this.solarenergy,
        this.uvindex,
        this.severerisk,
        this.conditions,
        this.icon,
        this.stations,
        this.source});

  Hours.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    temp = json['temp'];
    feelslike = json['feelslike'];
    humidity = json['humidity'];
    dew = json['dew'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    preciptype = json['preciptype'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    visibility = json['visibility'];
    cloudcover = json['cloudcover'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    conditions = json['conditions'];
    icon = json['icon'];
    stations = json['stations'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datetime'] = datetime;
    data['datetimeEpoch'] = datetimeEpoch;
    data['temp'] = temp;
    data['feelslike'] = feelslike;
    data['humidity'] = humidity;
    data['dew'] = dew;
    data['precip'] = precip;
    data['precipprob'] = precipprob;
    data['snow'] = snow;
    data['snowdepth'] = snowdepth;
    data['preciptype'] = preciptype;
    data['windgust'] = windgust;
    data['windspeed'] = windspeed;
    data['winddir'] = winddir;
    data['pressure'] = pressure;
    data['visibility'] = visibility;
    data['cloudcover'] = cloudcover;
    data['solarradiation'] = solarradiation;
    data['solarenergy'] = solarenergy;
    data['uvindex'] = uvindex;
    data['severerisk'] = severerisk;
    data['conditions'] = conditions;
    data['icon'] = icon;
    data['stations'] = stations;
    data['source'] = source;
    return data;
  }
}

class Stations {
  dynamic object;

  Stations({this.object});

  Stations.fromJson(Map<String, dynamic> json) {
    object = json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data.addAll(object);
    return data;
  }
}


class CurrentConditions {
  dynamic datetime;
  dynamic datetimeEpoch;
  dynamic temp;
  dynamic feelslike;
  dynamic humidity;
  dynamic dew;
  dynamic precip;
  dynamic precipprob;
  dynamic snow;
  dynamic snowdepth;
  dynamic preciptype;
  dynamic windgust;
  dynamic windspeed;
  dynamic winddir;
  dynamic pressure;
  dynamic visibility;
  dynamic cloudcover;
  dynamic solarradiation;
  dynamic solarenergy;
  dynamic uvindex;
  dynamic severerisk;
  dynamic conditions;
  dynamic icon;
  List<dynamic>? stations;
  dynamic source;

  CurrentConditions(
      {this.datetime,
        this.datetimeEpoch,
        this.temp,
        this.feelslike,
        this.humidity,
        this.dew,
        this.precip,
        this.precipprob,
        this.snow,
        this.snowdepth,
        this.preciptype,
        this.windgust,
        this.windspeed,
        this.winddir,
        this.pressure,
        this.visibility,
        this.cloudcover,
        this.solarradiation,
        this.solarenergy,
        this.uvindex,
        this.severerisk,
        this.conditions,
        this.icon,
        this.stations,
        this.source});

  CurrentConditions.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    temp = json['temp'];
    feelslike = json['feelslike'];
    humidity = json['humidity'];
    dew = json['dew'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    preciptype = json['preciptype'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    visibility = json['visibility'];
    cloudcover = json['cloudcover'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    conditions = json['conditions'];
    icon = json['icon'];
    stations = json['stations'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datetime'] = datetime;
    data['datetimeEpoch'] = datetimeEpoch;
    data['temp'] = temp;
    data['feelslike'] = feelslike;
    data['humidity'] = humidity;
    data['dew'] = dew;
    data['precip'] = precip;
    data['precipprob'] = precipprob;
    data['snow'] = snow;
    data['snowdepth'] = snowdepth;
    data['preciptype'] = preciptype;
    data['windgust'] = windgust;
    data['windspeed'] = windspeed;
    data['winddir'] = winddir;
    data['pressure'] = pressure;
    data['visibility'] = visibility;
    data['cloudcover'] = cloudcover;
    data['solarradiation'] = solarradiation;
    data['solarenergy'] = solarenergy;
    data['uvindex'] = uvindex;
    data['severerisk'] = severerisk;
    data['conditions'] = conditions;
    data['icon'] = icon;
    data['stations'] = stations;
    data['source'] = source;
    return data;
  }
}
