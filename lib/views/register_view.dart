import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/firebase_options.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('registeer'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter Your Email Here',
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: 'Enter Your Password Here',
            ),
          ),
          TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  final userCrendential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: password);
                  print(userCrendential);
                } on FirebaseException catch (e) {
                  if (e.code == 'weak-password')
                    print('weak password');
                  else if (e.code == 'email-already-in-use') {
                    print('email already in-use');
                  } else if (e.code == 'invalid-email') {
                    print('invalid email');
                  }
                }
              },
              child: const Text('Register')),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login/', (route) => false);
              },
              child: Text('Already registered ? Login here !'))
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Basic Registration Screen'),
    //   ),
    //   body: FutureBuilder(
    //       future: Firebase.initializeApp(
    //         options: DefaultFirebaseOptions.currentPlatform,
    //       ),
    //       builder: (context, snapshot) {
    //         switch (snapshot.connectionState) {
    //           case ConnectionState.done:
    //         ;
    //           default:
    //             return const Text('osLoading');
    //         }
    //       }),
    // );
  }
}