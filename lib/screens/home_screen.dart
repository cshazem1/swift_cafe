
import 'package:flutter/material.dart';
import 'package:swift_cafe/components/background.dart';
import 'package:swift_cafe/screens/admin_screen.dart';
import '../components/search_and_data.dart';
import '../components/list_view_categry.dart';
import '../components/sliver_view_categry.dart';
import '../models/categry_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeScreen extends StatefulWidget {
  static String id = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('categry').snapshots();
String? id;

  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController();
   String email= ModalRoute.of(context)!.settings.arguments as String;
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    // TODO: implement build

    return Scaffold(
          body: Stack(children: [
         Background(imageUrl: "image/cafe_background.webp"),
        StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CategryModels> categry = [];
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                categry.add(CategryModels.fromJson(snapshot.data!.docs[i]));
              }


              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                        height: 630,
                        color: Colors.black26,
                        child: Column(
                          children: [
                            ResearchAndData(
                                date: date, nameController: nameController,email:email),
                            ListViewCategry(list: categry),
                          ],
                        )),
                  ),
                  SliverToBoxAdapter(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const AdminScreen();
                          },
                        ));
                      },
                      child: const Text(
                        "Add User",
                      ),
                    ),
                  ),
                  SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      sliver: SliverListCategry(list: categry))
                ],
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        )
      ]));
  }
}
