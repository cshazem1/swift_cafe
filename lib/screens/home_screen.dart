import 'dart:ui';
import 'package:flutter/material.dart';
import '../components/search_and_data.dart';
import '../components/list_view_categry.dart';
import '../components/sliver_view_categry.dart';
import '../models/categry_models.dart';

class HomeScreen extends StatelessWidget {
 final List<CategryModels> list = [
    CategryModels(
        image:
            "https://th.bing.com/th/id/R.14a348302bddc6d3afc5b3733f39cddc?rik=PHJttrw%2bI6KCew&pid=ImgRaw&r=0",
        desc:
            "Coffee should be black as hell, strong as death and sweet as love.",
        name: "Turkish Coffee",
        rate: 2.5),
    CategryModels(
        image: "https://freepngimg.com/thumb/cup/11-coffee-cup-png-image.png",
        desc:
            "It’s a timeless classic – so even if you’re racing against the clock, you can still have a cup of joe before heading out to the commutes. Simply boil some water and add coffee (beans, grounds, or leaves) to it. Refine carefully – and you’re ready to clench fingers around your perfect cup of caffeine.",
        name: "Black Coffee",
        rate: 3),
    CategryModels(
        image:
            "https://th.bing.com/th/id/R.8d7781424af5897641f3f29f7c3ffde9?rik=BswC%2fQwkapPQcQ&riu=http%3a%2f%2fclipart-library.com%2fimages_k%2fcoffee-png-transparent%2fcoffee-png-transparent-18.png&ehk=ernzIUwrP8uNsJVJLNYnpnWKCBy2cFRAv%2fsrl0Z2NJw%3d&risl=&pid=ImgRaw&r=0",
        desc:
            "“Restricted” or “limited” in Italian means, it’s simply the first half of a full espresso shot while using the same amount of coffee grounds. Gourmet coffee enthusiasts often prefer ristretto as it gives you a sheer quality along with the rich and aromatic flavor of coffee beans.",
        name: "Ristretto",
        rate: 2.5),
    CategryModels(
        image:
            "https://th.bing.com/th/id/R.3c877a787415d1a4373329b527df6c73?rik=kyo2ijBYEDrndw&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f4%2fCafe.png&ehk=uJ8ZC07r4vSjTWwTaPhNrjWZLwtdoybpNiYpFUXOTgw%3d&risl=&pid=ImgRaw&r=0",
        desc:
            "It’s more than just the cool, it gives you caffeine-sip of iced coffee. Started from boutique coffee shops, it could take its place on the Caffe menus of big leagues like Starbucks and Pets.",
        name: "Cold Brew",
        rate: 4)
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    DateTime now =  DateTime.now();
    DateTime date =  DateTime(now.year, now.month, now.day);
    return Scaffold(
      body: Stack(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'image/cafe_background.webp'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRect(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ))),
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                  height: 630,
                  color: Colors.black26,
                  child: Column(
                    children: [
                      ResearchAndData(
                          date: date, nameController: nameController),
                      ListViewCategry(list: list),
                    ],
                  )),
            ),
            SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                sliver: SliverListCategry(list: list))
          ],
        )
      ]),
    );
  }
}
