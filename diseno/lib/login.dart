import 'package:diseno/dash.dart';
import 'package:diseno/service/graph_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 60.0,
                    color: Color(0xFF4353F7),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 245, 241),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: InputBorder.none,
                          filled: false,
                          contentPadding: EdgeInsets.only(right: 8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 245, 241),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: InputBorder.none,
                          filled: false,
                          contentPadding: EdgeInsets.only(right: 8.0),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      print('Username: ${_usernameController.text}');
                      print('Password: ${_passwordController.text}');
                      authService.autenticando = true;
                      final token =
                          await authService.login(_usernameController.text, _passwordController.text);
                      authService.autenticando = false;
                      if (token != null) {
                        print(token);
                        print('Login');
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashPage()));
                      } else {
                        print("error");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF4353F7),
                      onPrimary: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Ink(
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 100.0, minHeight: 35.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  TextButton(
                    onPressed: () {
                      print('¿Aun no tienes cuenta?');
                    },
                    style: TextButton.styleFrom(
                      primary: Color(0xFF4353F7),
                    ),
                    child: Text(
                      '¿Aun no tienes cuenta?',
                      style: TextStyle(color: Color(0xFF4353F7)),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  OutlinedButton(
                    onPressed: () {
                      print('Registrarse');
                    },
                    style: OutlinedButton.styleFrom(
                      primary: Color(0xFF4353F7),
                      side: BorderSide(color: Color(0xFF4353F7), width: 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      'Registrarse',
                      style: TextStyle(color: Color(0xFF4353F7)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}