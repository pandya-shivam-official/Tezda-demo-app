class HomeModel {
  HomeModel({
    required this.name,
    required this.power,
    required this.url,
  });

  final String name;
  final String power;
  final String url;

  factory HomeModel.fromMap(Map<String, dynamic> json) {
    return HomeModel(
      name: json['name'],
      power: json['power'],
      url: json['url'],
    );
  }
}
