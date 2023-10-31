import 'package:flutter/material.dart';
import 'package:learneng/Login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Learn English App",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              "Sign up your account",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize:35.0,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "User Email",
                prefixIcon: Icon(Icons.mail, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Password",
                prefixIcon: Icon(Icons.security, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              obscureText: true,
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Comfirm Password",
                prefixIcon: Icon(Icons.security, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: RawMaterialButton(
                fillColor: Color(0xFF1CD0E9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                onPressed: () {


                },
                child: const Text("Register", style: TextStyle(color: Colors.black, fontSize: 23.0, fontWeight: FontWeight.bold),),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                const Text("Do have an account?",
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                  ),
                ),
                Container(
                  child:  RawMaterialButton(
                    onPressed: (){
                      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text("Login", style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
