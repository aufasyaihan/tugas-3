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

  _showInputUser(namacontroller, placeholder, isPassword) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: TextField(
        controller: namacontroller,
        obscureText: isPassword,
        decoration: InputDecoration(
            hintText: placeholder,
            border: InputBorder.none,
            icon: const Icon(Icons.person)),
      ),
    );
  }

  _showInputPass(namacontroller, placeholder, isPassword) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: TextField(
        controller: namacontroller,
        obscureText: isPassword,
        decoration: InputDecoration(
            hintText: placeholder,
            border: InputBorder.none,
            icon: const Icon(Icons.lock)),
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
            const Center(
              child: Text(
                'Pemrograman Mobile',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color
                ),
              ),
            ),
            const SizedBox(height: 10),
            _showInputUser(_usernameController, 'Masukkan Username', false),
            _showInputPass(_passwordController, 'Masukkan Password', true),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  if (_usernameController.text == 'aufa' &&
                      _passwordController.text == 'aufaganteng') {
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
                child: const Text('Login',
                    style: TextStyle(
                      fontSize: 20,
                    )))
          ],
        ),
      ),
    );
  }
}
