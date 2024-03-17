class CategryModels  {
 final String name;
 final String desc;
 final String rate;
 final String image;
 final String salary;

  CategryModels(
      {
      required this.name,
      required this.desc,
      required this.rate,
      required this.image,
      required this.salary});
  factory CategryModels.fromJson(json) {
    return CategryModels(
        name: json['name'],
        desc: json['desc'],
        rate: json['rate'],
        image: json['image'],
        salary: json['salary'],
       );
  }
}
