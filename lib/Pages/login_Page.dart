import 'package:firstapp/utils/routes.dart';
import 'package:flutter/material.dart';
//import 'package:async/src/widgets/form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    print("ontap");
    if (_formkey.currentState?.validate() ?? false) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              // Image.network("https://42f2671d685f51e10fc6-b9fcecea3e50b3b59bdc28dead054ebc.ssl.cf5.rackcdn.com/v2/undraw_social_20.png"),
              // Image(image: Image.asset("assets/images/login_page.png")),
              Image.asset(
                "assets/images/login_page.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Wellcome $name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter User Name",
                        labelText: "User Name",
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Password not be empty";
                        } else if ((value?.length ?? 0) < 6) {
                          return "Password Length should be at least 6 ";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        alignment: Alignment.center,
                        height: 50,
                        width: changeButton ? 50 : 150,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(20)),
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                      ),
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       print("Button pressed");
                    //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //     },
                    //     child: Text("Login"),
                    //     style: TextButton.styleFrom(minimumSize: Size(100, 40))
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
