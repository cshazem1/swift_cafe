
import 'package:flutter/material.dart';

import '../models/categry_models.dart';
import 'categry.dart';

class ListViewCategry extends StatelessWidget {
  const ListViewCategry({
    super.key,
    required this.list,
  });

  final List<CategryModels> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0,left: 20),
            child: Text("Most Popular Beverages",style: TextStyle(color: Colors.white.withOpacity(.8),fontFamily: "YesevaOne" ,fontSize: 20)
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(

              scrollDirection: Axis.horizontal,

              itemCount: list.length,
              itemBuilder: (context, index) {
                return  Categry(list[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
