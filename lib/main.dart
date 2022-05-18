import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/firebase_options.dart';
import 'package:my_notes/views/login_view.dart';
import 'package:my_notes/views/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/login/': (context) => LoginView(),
        '/register/': (context) => RegisterView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final User = FirebaseAuth.instance.currentUser;
              if (User != null) {
                if (User.emailVerified) {
                  print('email is verified');
                } else {
                  return VerticalDivider();
                }
              } else {
                return LoginView();
              }
              return Text('dine');
              // final user = FirebaseAuth.instance.currentUser;
              // print(user);
              // if (user?.emailVerified ?? false) {
              //   // print('You are a verified user');
              //   return const Text('Done');
              // } else {
              //   // print('You need to verify your emaiol first');

              //   return verifyEmailView();
              // }
              return LoginView();

            default:
              return const Text('isLoading');
          }
        });
  }
}


  // Navigator.of(context).push(
  //                 MaterialPageRoute(
  //                   builder: (context) => verifyEmailView(),
  //                 ),
  //               );