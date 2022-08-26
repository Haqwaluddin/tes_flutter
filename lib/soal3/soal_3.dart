import 'package:flutter/material.dart';
import 'package:tesflutter/service/dbhelper.dart';

class Soal3 extends StatefulWidget {
  const Soal3({Key? key}) : super(key: key);

  @override
  State<Soal3> createState() => _Soal3State();
}

class _Soal3State extends State<Soal3> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController namaCtr = TextEditingController();
  TextEditingController usiaCtr = TextEditingController();
  TextEditingController pekerjaanCtr = TextEditingController();
  TextEditingController hobiCtr = TextEditingController();
  List<Map<String, dynamic>> _data = [];

  //get semua data di sqflite
  Future<void> getAllData() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _data = data;
    });
}

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Soal 3'),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                child: TextFormField(
                  // The validator receives the text that the user has entered.
                  validator: (value) => value == null && value!.isEmpty? 'Nama tidak boleh kosong':
                  value != null && value.isValidKapital()? null :"Gunakan huruf kapital",
                  controller: namaCtr,
                  decoration: InputDecoration(
                    labelText: "Nama",
                    labelStyle: TextStyle(
                        color: Colors.grey
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                child: TextFormField(
                  // The validator receives the text that the user has entered.
                  validator: (value) => value == null && value!.isEmpty? 'Usia tidak boleh kosong':
                  value != null && value.isValidusia()? null :"Gunakan angka saja",
                  controller: usiaCtr,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Usia",
                    labelStyle: TextStyle(
                        color: Colors.grey
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                child: TextFormField(
                  // The validator receives the text that the user has entered.
                  validator: (value) => value == null? 'Nama tidak boleh kosong':
                  value != null && value.isValidKapital()? null :"Gunakan huruf kapital",
                  controller: pekerjaanCtr,
                  decoration: InputDecoration(
                    labelText: "Pekerjaan",
                    labelStyle: TextStyle(
                        color: Colors.grey
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                child: TextFormField(
                  // The validator receives the text that the user has entered.
                  validator: (value) => value == null? 'Nama tidak boleh kosong':
                  value != null && value.isValidKapital()? null :"Gunakan huruf kapital",
                  controller: hobiCtr,
                  decoration: InputDecoration(
                    labelText: "Hobi",
                    labelStyle: TextStyle(
                        color: Colors.grey
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('email dan password sesuai')),
                      );
                      print('${namaCtr.text}${usiaCtr.text}${pekerjaanCtr.text}${hobiCtr.text}');
                      setState(() {
                        _addData(namaCtr.text,usiaCtr.text,pekerjaanCtr.text,hobiCtr.text);
                        getAllData();
                      });
                    }
                  },
                  child: const Text('Add Data'),
                ),
              ),
              Expanded(
                  child: _data.isEmpty?Container():ListView.builder(
                    itemCount: _data.length,
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nama        :  ${_data[index]['nama']}"),
                              Text("Usia           :  ${_data[index]['usia']}"),
                              Text("Pekerjaan : ${_data[index]['pekerjaan']}"),
                              Text("Hobi          :  ${_data[index]['hobi']}"),
                            ],
                          ),
                        );
                      },
                  ))
            ],
          ),
        )
    );
  }
  //add data ke sqflite
  Future<void> _addData(String name, String usia, String pekerjaan,String hobi) async {
    await SQLHelper.createItem(
        name, usia,pekerjaan,hobi);
  }
}
//validator ketika hanya boleh huruf kapital dan spasi dan tidak boleh kosong
extension EmailValidator on String {
  bool isValidKapital() {
    return RegExp(
        r'^(?=.*?[A-Z])[A-Z ]*$')
        .hasMatch(this);
  }
}
//validator ketika hanya boleh angka dan tidak boleh kosong
extension usiaValidator on String {
  bool isValidusia() {
    return RegExp(
        r'^(?=.*?[0-9])[0-9]*$')
        .hasMatch(this);
  }
}
