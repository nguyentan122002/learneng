import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learneng/HomeScreenPage.dart';
import 'package:learneng/Register.dart';



class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
   static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
     FirebaseAuth auth = FirebaseAuth.instance;
     User? user;
     try{
       UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
       user = userCredential.user;
     } on FirebaseAuthException catch (e){
       if (e.code == "người dùng đéo tồn tại"){
         print("Đéo tìm thấy người dùng nào có email trên");
       }
     }
     return user;
   }

  @override
  Widget build(BuildContext context) {

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          )
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50.0,
          ),
          const Text("Learn English app",
              style: TextStyle (
                color: Colors.black,
                fontSize:25.0,
                fontWeight: FontWeight.bold,

              )
          ),
          const Text("Login to your app",
            style: TextStyle(
              color: Colors.black,
              fontSize: 45.0,
              fontWeight: FontWeight.bold,
            ),  
          ),
          const SizedBox(
            height: 50.0,
          ),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: "User Email",
              prefixIcon: Icon(Icons.mail, color: Colors.black,),
            ),
          ),
          const SizedBox(height: 26.0,
          ),

          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: "User Password",
              prefixIcon: Icon(Icons.security, color: Colors.black,),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text(
            "Don't remember your Password?",
            style: TextStyle(color: Colors.blue,),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: RawMaterialButton(
              fillColor: const Color(0xFF1CD0E9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              padding: const EdgeInsets.symmetric(vertical: 20.0),

              onPressed: () async {
                User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                print(user);
                if (user != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreenPage()));
                }
              },
              child: const Text("Login",
              style:  TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0,
                  letterSpacing: 1.5,
              ),
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Row(
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                ),
              ),
              Container(
                child:  RawMaterialButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const RegisterPage()));
                  },
                  child: const Text("Sign up", style: TextStyle(
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
    );

  }
}
