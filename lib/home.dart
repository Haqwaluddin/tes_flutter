import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tesflutter/soal1/soal_1.dart';
import 'package:tesflutter/soal2/soal_2.dart';
import 'package:tesflutter/soal3/soal_3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.purpleAccent,
      ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
              onPressed: (){
                Get.to(Soal1());
              },
              child: Text('Soal 1')),
        ),
        SizedBox(height: 10,),
        Center(
          child: ElevatedButton(
              onPressed: (){
                Get.to(Soal2());
              },
              child: Text('Soal 2')),
        ),
        SizedBox(height: 10,),
        Center(
          child: ElevatedButton(
              onPressed: (){
                Get.to(Soal3());
              },
              child: Text('Soal 2')),
        )
      ],
    ),
    );
  }
}
