import 'package:flutter/cupertino.dart';
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
                      Icon(Icons.waving_hand,
                          color: Colors.yellow, size: 30),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "${date.day}/${date.month}/${date.year}",
                              style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(.3),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 8.0),
                            child: Text("Hazem Mahmoud",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white)),
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
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))),
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.shopping_basket_rounded,
                            color: Colors.black.withOpacity(.8),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50)),
                              color:
                              Colors.green.withOpacity(.5)),
                          padding: EdgeInsets.all(1),
                          width: 50,
                          height: 50,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(50),
                                  color: Colors.black,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-6/357681465_3138343516464852_1124048481726826689_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=9c7eae&_nc_eui2=AeHa8VxKe7D0Z95jIJOh_l0_AI650qRYawwAjrnSpFhrDMMyfWSrs1Pja6l1Ecu2Wr8Zg6105twJccRXer3qx66l&_nc_ohc=NBkFNsQ3lCUAX_Myjo3&_nc_ht=scontent.fcai19-8.fna&oh=00_AfCvhDn9Z6_5J-2NH601Gi7Z2AQ4BVWBqfOW3AdW6cJgRA&oe=65B18DD4")))),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),                              color: Colors.white,
                ),

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Icon(Icons.search_outlined),
                    ),
                    Container(
                        margin: EdgeInsets.all(20),
                        width: 260,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration.collapsed(
                            hintText: "Search Favorite Beverages",
                          ),
                        )),
                    Icon(Icons.more_horiz)
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
