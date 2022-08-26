import 'package:flutter/material.dart';

class Soal2 extends StatelessWidget {
  Soal2({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  var form1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Soal 2'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: SafeArea(
          child: Column(
            children: [
              TextFormField(
                controller: form1,
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                  onPressed: () {
                    cekGanjil(int.parse(form1.text));
                  },
                  child: Text
                    ('Test'))
            ],
          )),
    );
  }
  //fungsi cek angka ganjil atau genap dan membuat bingtang
  void cekGanjil(int number){
    if (number % 2 == 0){
      print('angka genap');
      showSnackBar();
    } else {
      print('angka ganjil');
      for(int a = 1; a<number; a++ ){
        print("* " * a);
      }
      for(int a = 1; a<=number; number-- ){
        print("* " * number);
      }
    }
  }

  //snackbar ketika salah input bilangan
  void showSnackBar() {
    final snackBarContent = SnackBar(
      content: Text("Bilangan Genap Tidak Bisa Diproses"),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.red,
    );
    _scaffoldkey.currentState!.showSnackBar(snackBarContent);
  }
}
