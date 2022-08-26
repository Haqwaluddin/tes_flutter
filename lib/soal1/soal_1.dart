import 'package:flutter/material.dart';

class Soal1 extends StatefulWidget {
  const Soal1({Key? key}) : super(key: key);

  @override
  State<Soal1> createState() => _Soal1State();
}

class _Soal1State extends State<Soal1> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  bool passwordVisible = false;

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soal 1'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
              child: TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) => value!.isValidEmail() ? null : "Please enter valid email",
                controller: emailCtr,
                decoration: InputDecoration(
                  labelText: "Email",
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
                validator: (value) => value!.isValidPass() ? null : "password harus memiliki 1 huruf besar, 1 special karakter",
                controller: passwordCtr,
                obscureText: !passwordVisible,
                // style: regular4.copyWith(color: primaryText),
                decoration: InputDecoration(
                  labelText: "Password",
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
                  suffixIcon: IconButton(
                    color: Colors.grey,
                    splashRadius: 1,
                    icon: Icon(passwordVisible
                        ? Icons.visibility_outlined
                        : Icons
                        .visibility_off_outlined),
                    onPressed: togglePassword,
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
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      )
    );
  }
}
//validator email dan tidak boleh kosong
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
//validator password harus memiliki 1 huruf besar, 1 special karakter dan tidak boleh kosong
extension PasswordValidator on String {
  bool isValidPass() {
    return RegExp(
        r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~ ]).{0,}$')
        .hasMatch(this);
  }
}
