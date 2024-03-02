import 'package:flutter/material.dart';

class ResearchAndData extends StatelessWidget {
  const ResearchAndData({
    super.key,
    required this.date,
    required this.nameController,
  });

  final DateTime date;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Container(
        color: Colors.black45,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.waving_hand,
                          color: Colors.yellow, size: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "${date.day}/${date.month}/${date.year}",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.3),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Hazem Mahmoud",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.9),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.shopping_basket_rounded,
                            color: Colors.black.withOpacity(.8),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              color: Colors.green.withOpacity(.5)),
                          padding: const EdgeInsets.all(1),
                          width: 50,
                          height: 50,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black,
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://cdn.wallpapersafari.com/95/85/eV9PRm.jpg")))),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Icon(Icons.search_outlined),
                    ),
                    Container(
                        margin: const EdgeInsets.all(20),
                        width: 260,
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration.collapsed(
                            hintText: "Search Favorite Beverages",
                          ),
                        )),
                    const Icon(Icons.more_horiz)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
