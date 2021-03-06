import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:my_notes/firebase_options.dart';
import 'dart:developer' as devtools show log;

import 'package:my_notes/constants/routes.dart';
import 'package:my_notes/utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
        title: const Text('login'),
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
                  // final userCrendential =
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email, password: password);
                  final User = FirebaseAuth.instance.currentUser;
                  if (User?.emailVerified ?? false) {
                    //user email is verified
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(noteRoute, (route) => false);
                  } else {
                    //user email is nit berified
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        verifyEmailRoute, (route) => false);
                  }

                  // devtools.log(userCrendential.toString());
                  // print(userCrendential);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    // devtools.log('user-not-found');
                    await showErrorDialog(context, 'user not found');
                    // print('user-not-found');
                  } else if (e.code == 'wrong-password') {
                    // devtools.log('wrong passwoerd');
                    await showErrorDialog(context, 'wrong credentials');

                    // print('wrong passwoerd');
                  } else {
                    await showErrorDialog(
                      context,
                      'Error: ${e.code}',
                    );
                  }
                } catch (e) {
                  await showErrorDialog(
                    context,
                    e.toString(),
                  );
                }
              },
              child: const Text('Login')),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(registerRoute, (route) => false);
              },
              child: const Text('Not registered yet ? Register here !'))
        ],
      ),
    );
  }
}
