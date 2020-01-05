import 'package:basic/services/api_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  @override
Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
      title: new Text('Demo')
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
              'Register User',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
                controller: userNameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "User Name")),
            TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email Address")),
            TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password")),
            RaisedButton(child: Text("Register"), onPressed:()=>registerUser(context)),
          ],
        ),
      );
      },
    ),
  );
}
 

  Future<dynamic> registerUser(context) async {
    Map user = {
      'email': emailController.text,
      'password': passwordController.text,
      'user_name': userNameController.text
    };
    final registerResponse = await register(user);
    print(registerResponse);
    final snackBar = SnackBar(content: Text(registerResponse['message']));
    //show error or success message to the user
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
