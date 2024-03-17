import 'package:hive/hive.dart';
part 'order_models.g.dart';
@HiveType(typeId: 0)
class OrderModels extends HiveObject {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String salary;
  @HiveField(4)
  final String filling;
  @HiveField(5)
  final String milk;
  @HiveField(6)
  final String sugar;
  @HiveField(7)
  final String number;

  OrderModels(
      {required this.date,
      required this.name,
      required this.image,
      required this.salary,
      required this.filling,
      required this.milk,
      required this.sugar,
      required this.number});
}
