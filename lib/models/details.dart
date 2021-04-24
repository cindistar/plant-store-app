class Details {
  Details.fromMap(Map<String, dynamic> map) {
    height = map['height'] as String;
    humidity = map['humidity'] as String;
    weight = map['weight'] as String;
    temperature = map['temperature'] as String;
  }

  String height;
  String humidity;
  String weight;
  String temperature;

  @override
  String toString() {
    return 'Details(height: $height, humidity: $humidity, weight: $weight, temperature: $temperature)';
  }
}
