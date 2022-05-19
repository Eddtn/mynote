import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/firebase_options.dart';
import 'package:my_notes/views/login_view.dart';
import 'package:my_notes/views/register_view.dart';
import 'package:my_notes/views/verify_email_view.dart';
import 'dart:developer' as devtools show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (context) => RegisterView(),
        '/notes/': (context) => NoteView(),
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
                  return NoteView();
                  // print('email is verified');
                } else {
                  return verifyEmailView();
                }
              } else {
                return const LoginView();
              }

            // return Text('done');

            default:
              return const Text('isLoading');
          }
        });
  }
}

enum MenuAction { logout }

class NoteView extends StatefulWidget {
  NoteView({Key? key}) : super(key: key);

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Ui'),
        actions: [
          PopupMenuButton<MenuAction>(onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showlogOutDialog(context);
                if (shouldLogout) {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login/', (_) => false);
                }
                devtools.log(shouldLogout.toString());
                // TODO: Handle this case.
                break;
            }

            // devtools.log(
            //   value.toString(),'/login/'
            // );
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem<MenuAction>(
                value: MenuAction.logout,
                child: Text('logout'),
              )
            ];
          })
        ],
      ),
      body: const Text('hello world'),
    );
  }
}

Future<bool> showlogOutDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to signout'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('log out'),
            ),
          ],
        );
      }).then((value) => value ?? false);
}
