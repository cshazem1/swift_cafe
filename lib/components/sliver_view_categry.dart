import 'package:flutter/cupertino.dart';

import '../models/categry_models.dart';
import 'categry.dart';

class SliverListCategry extends StatelessWidget {
  const SliverListCategry({
    super.key,
    required this.list,
  });

  final List<CategryModels> list;

  @override
  Widget build(BuildContext context) {
    return SliverList(

        delegate: SliverChildBuilderDelegate(
          childCount: list.length,
              (context, index) {

            return SizedBox(
                height: 280,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Categry(list[index]),
                ));

          },));
  }
}
