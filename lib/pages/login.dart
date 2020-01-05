import 'package:basic/models/user_model.dart';
import 'package:basic/pages/product_add.dart';
import 'package:basic/services/api_service.dart';
import './register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
    body: new Builder(
      // Create an inner BuildContext so that the onPressed methods
      // can refer to the Scaffold with Scaffold.of().
      builder: (BuildContext context) {
        return new Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              'Login Information',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email Address")),
            TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password")),
            RaisedButton(child: Text("LOGIN"), onPressed: ()=> login(context)),
            RaisedButton(child: Text("Register"), onPressed: signupUser),
          ],
        ),
      );
      },
    ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  Future<void> signupUser() {
     Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterPage()),
      );
  }

  Future<void> login(context) async {
    Map user = {
      'email': emailController.text,
      'password': passwordController.text
    };
    final loginResponse =
        await loginUser(user);
    print(loginResponse);
    final snackBar = SnackBar(content: Text(loginResponse['message']));
    //show error or success message to the user
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
