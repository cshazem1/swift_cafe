import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_cafe/components/custom_text_name.dart';
import 'package:swift_cafe/cubits/my_id_cubit/get_id_cubit.dart';
import 'package:swift_cafe/cubits/shopping_basket_cubit/shopping_basket_cubit.dart';
import 'package:swift_cafe/models/user_model.dart';

import '../firebase/cloud_storage/users.dart';
import '../screens/shopping_basket_screen.dart';

class ResearchAndData extends StatefulWidget {
   const ResearchAndData({
    super.key,
    required this.date,
    required this.nameController, required this.email,
  });

   final String email;
  final DateTime date;
  final TextEditingController nameController;

  @override
  State<ResearchAndData> createState() => _ResearchAndDataState();
}

class _ResearchAndDataState extends State<ResearchAndData> {
  var future;
  UserModel? userModel;
  @override
  void initState()  {

    future=  Users().searchUsersAndEmail(widget.email);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<dynamic>(
      builder:(context, snapshot) {
        if(snapshot.hasData){
           userModel=snapshot.data;
           log(userModel!.id);
BlocProvider.of<GetIdCubit>(context).getId(userModel!.id);

        return  SizedBox(
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
                                    "${widget.date.day}/${widget.date.month}/${widget.date.year}",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(.3),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(userModel!.name,

                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white)),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [

                                GestureDetector(
                                  onTap:()  {
                                Navigator.pushNamed(context, SoppingBasketScreen.id);
                                  } ,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(.9),
                                          borderRadius:
                                          const BorderRadius.all(Radius.circular(10))),
                                      height: 40,
                                      width: 40,
                                      child: Center(
                                        child: Icon(
                                        Icons.shopping_basket_rounded,
                                        color: Colors.black.withOpacity(.8),
                                                                            ),
                                      )),
                                ),
                                BlocBuilder<ShoppingBasketCubit, ShoppingBasketState>(
  builder: (context, state) {


    return Positioned(
                                    top:-12 ,
                                    left: -10,
                                    child: Container(
padding: EdgeInsets.symmetric(vertical: 1,horizontal: 3),
                                        decoration: BoxDecoration(color: Colors.deepOrange.withOpacity(.7),borderRadius: const BorderRadius.all(Radius.circular(500))),
                                        child: TextName(fontSize:18 , textName: '${BlocProvider.of<ShoppingBasketCubit>(context).order.length}+', textOpacity: .7,)));
  },
),

                              ],
                            ),
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
                                controller: widget.nameController,
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

        else {
          return  const CircularProgressIndicator();
        }
      },
      future: future,
    );
  }
}
