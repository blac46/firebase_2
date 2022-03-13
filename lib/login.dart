import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginwith_firebase/homepage.dat.dart';

final auth = FirebaseAuth.instance;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  TextEditingController emailControllar = TextEditingController();
  TextEditingController passwordControllar = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: emailControllar,
              decoration: InputDecoration(
                  hintText: 'Email', prefixIcon: Icon(Icons.email)),
            ),
            TextField(
              controller: passwordControllar,
              decoration: InputDecoration(
                  hintText: 'Password', prefixIcon: Icon(Icons.lock)),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final currentuser = await auth.signInWithEmailAndPassword(
                    email: emailControllar.text,
                    password: passwordControllar.text,
                  );
                  if (currentuser != null) {
                    print(currentuser.credential);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WelcomePage(),
                      ),
                    );
                  }
                } on FirebaseAuthException catch (e) {
                  print(e.message.toString());
                }
              },
              child: Text('submit'),
            )
          ],
        ),
      ),
    );
  }
}
