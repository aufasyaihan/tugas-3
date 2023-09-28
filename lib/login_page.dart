import 'package:flutter/material.dart';
import 'package:pert3/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var namauser;

  void _saveUsername() async {
    // Inisialisasi  share Preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Simpan Username ke local storage
    prefs.setString('username', _usernameController.text);
  }

  _showInput(namacontroller, placeholder, isPassword) {
    return TextField(
      controller: namacontroller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }

  _showDialog(pesan, alamat) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(pesan),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => alamat,
                        ));
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Text color
              ),
            ),
            const SizedBox(height: 10),
            _showInput(_usernameController, 'Masukkan Username', false),
            _showInput(_passwordController, 'Masukkan Password', true),
            ElevatedButton(
                onPressed: () {
                  if (_usernameController.text == 'admin' &&
                      _passwordController.text == 'admin') {
                    // save username
                    _saveUsername();
                    // show alert
                    _showDialog('Anda berhasil login', const HomePage());
                  } else {
                    // show alert
                    _showDialog(
                        'Username atau Password anda Salah', const LoginPage());
                  }
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
