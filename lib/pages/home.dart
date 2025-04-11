import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vu/models/category_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  void _getCategories(){
    categories =CategoryModel.getCategories();
  }
  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _user(),
          SizedBox(height: 15,),
          _userName(),
          _searchField(),
          SizedBox(height: 40,),
          _categoriesSection()
        ],
      ),
      bottomNavigationBar:bottomNavigationBar());
  }

  BottomNavigationBar bottomNavigationBar(){
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Calls',
          ),
        ] );

  }
  Card _user(){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.all(15),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                 'assets/icons/user.svg',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),

                Container(width: 20,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 Container(height: 5,),
                    Text('Robotas Robotauskas',
                      style:TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Container(height: 5,),
                    Text('Informacinių sistemų inžinerija',
                      style:TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Container(height: 5,),
                    Text('3 kursas, studentas',
                      style:TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ))
              ],
            ))
          ],
        )
    );
  }

  Container _userName(){
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0x3c490f0f),
          borderRadius: BorderRadius.circular(20)
        ),
      child: Row(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text('Robotas Robotauskas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: const EdgeInsets.only(left: 20),
                  child: Text('Informacinių sistemų inžinerija',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400
                  )),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.only(left:20, bottom: 10),
                    child:Text('3 kursas, studentas',
                    style: TextStyle(
                      color:Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                    )
                    ),
                    ),
                  ],
              )

            ],
          ),
        ],
      ),
    );
  }

  Column _categoriesSection() {
    return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Kategorijos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 120,
              child: ListView.separated(
                itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20
                  ),
                  separatorBuilder: (context,index)=> SizedBox(width: 25,),
                  itemBuilder:(context, index){
                   return Container(
                     width: 100,
                     decoration: BoxDecoration(
                       color: categories[index].boxColor.withOpacity(0.3),
                       borderRadius: BorderRadius.circular(16)
                     ),
                     child:Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Container(
                           width: 50,
                           height: 50,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             shape: BoxShape.circle
                           ),
                           child: Padding(
                               padding:const EdgeInsets.all(8.0),
                               child: SvgPicture.asset(categories[index].iconPath)
                           ),
                         ),
                         Text(
                           categories[index].name,
                           style: TextStyle(
                             fontWeight: FontWeight.w600,
                             color: Colors.black,
                             fontSize: 14
                           ),
                         )
                       ],
                     )
                   );
                  },
                 ),
            )
          ],
        );
  }

  Container _searchField() {
    return Container(
          margin:EdgeInsets.only(top:40, left: 20,right: 20) ,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
              )
            ]
          ),
          child:
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(15),
                hintText: 'Ieškoti...',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12) ,
                  child: SvgPicture.asset('assets/icons/search.svg'),
                ),
                suffixIcon: Container(
                  width: 100,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        VerticalDivider(
                          color: Colors.black,
                          indent: 10,
                          endIndent: 10,
                          thickness: 0.1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:SvgPicture.asset('assets/icons/filter.svg'),
                        ),
                      ],
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
                )
              ),
            )
        );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('VU IS',
        style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Color(0xff490f0f),
      centerTitle: true,
      leading:
      GestureDetector(
        onTap: () {

        },
        child:
        Container(
          margin: EdgeInsets.all(10),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Color(0xff490f0f),
              borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset('assets/icons/arrow-left.svg',
            height: 24,
            width: 24,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {

          },
          child:
          Container(
            margin: EdgeInsets.all(10),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Color(0xff490f0f),
                borderRadius: BorderRadius.circular(10)
            ),
            child: SvgPicture.asset('assets/icons/dots-horizontal.svg',
              height: 24,
              width: 24,
            ),
          ),
        )

      ],
    );
  }
}