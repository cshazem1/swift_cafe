import 'package:flutter/material.dart';
import 'package:swift_cafe/public.dart';
import 'package:swift_cafe/models/categry_models.dart';

import '../screens/select_item_screen.dart';
class Categry extends StatelessWidget {
 final CategryModels categryModels;
   const Categry(this.categryModels, {super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            choiceFilling="";
            choiceSugar="";
            choiceMilk="";
            return SelectItemScreen(categryModels);
          },
        ));
      },
      child: Container(
          margin:  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: 250,
          decoration: BoxDecoration(
            borderRadius:  const BorderRadius.all(Radius.circular(10)),
            color: Colors.white60.withOpacity(.3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                spreadRadius: 3,
                blurRadius: 5,
                offset:  const Offset(1, 3), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 40,
                left: 50,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(.2),
                        spreadRadius: 1,
                        blurRadius: 400,
                        offset: const Offset(0, 60), // changes position of shadow
                      ),
                    ],

                    image: DecorationImage(
                        image:
                        NetworkImage(categryModels.image),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Positioned(
                top: 191,
                left: 30,
                child: Text(
                  categryModels.name,
                  style:  const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "YesevaOne"),
                ),
              ),
              Positioned(
                top: 220,
                left: 30,
                child: SizedBox(
                  width: 140,
                  child: Text(
                    categryModels.desc,
                    style:  const TextStyle(color: Colors.black, fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Positioned(
                top: 240,
                left: 30,
                child: Text(
                  categryModels.salary.toString(),
                  style:  const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Positioned(
                  right: 10,
                  top: 220,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                    child:  const Icon(Icons.add, color: Colors.white),
                  )),
            ],
          )),
    );
  }
}
