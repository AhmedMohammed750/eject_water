
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:water_edject/screens/blow.dart';
import 'package:water_edject/screens/home_screen.dart';
import 'package:water_edject/screens/suppurt.dart';
import 'package:water_edject/screens/test.dart';

class nav extends StatefulWidget {
  const nav({ Key? key }) : super(key: key);

  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav> {
  int index=0;
    static  List<Widget> _widgetOptions = <Widget>[  
    Home(),  
    test(),  
    dpmeter(),
    Support(),  
  ];  
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar:BottomNavigationBar(currentIndex:index,
    backgroundColor: Colors.blue[900],
    
       onTap: (index) {
         setState(() {
           this.index=index;
         });
       },
      // ignore: prefer_const_literals_to_create_immutables
      items: [

      BottomNavigationBarItem(icon: Icon(Icons.water),
      label: '1'.tr,
      backgroundColor: Colors.blue[900]
      
      ),
            BottomNavigationBarItem(icon: Icon(Icons.speaker),
      label: '16'.tr,
      backgroundColor: Colors.blue[700]
      
      ),
            BottomNavigationBarItem(icon: Icon(Icons.stacked_line_chart),
      label: '19'.tr,
      backgroundColor: Colors.blue[500]
      
      ),
      BottomNavigationBarItem(icon: Icon(Icons.support_agent),
      label: '8'.tr,
      backgroundColor: Colors.blue[300]

      )
      
      




    ],
    ),
    body: _widgetOptions[index],
    );
  }
}