class CategryModels {
  String name;
  String desc;
  String rate;
  String image;

  CategryModels(
      {required this.name,
      required this.desc,
      required this.rate,
      required this.image});
  factory CategryModels.fromJson(json){
    return CategryModels(name: json['name'], desc: json['desc'], rate: json['rate'], image:json['image']);
  }
}
