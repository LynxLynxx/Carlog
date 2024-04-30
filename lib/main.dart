import 'package:carlog/core/theme/theme.dart';
import 'package:carlog/features/auth_features/login/presentation/pages/login_page.dart';
import 'package:carlog/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carlog',
      theme: const MaterialTheme(TextTheme()).light(),
      darkTheme: const MaterialTheme(TextTheme()).dark(),
      home: const LoginPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            const CupertinoSliverNavigationBar(
              largeTitle: Text("Title"),
            ),
            // const SliverAppBar.medium(
            //   // backgroundColor: Colors.amber,
            //   title: Text(
            //     "Carlog",
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       // fontSize: 30,
            //     ),
            //   ),
            //   actions: [
            //     Text("  AADAD "),
            //   ],
            // ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.amberAccent,
                height: 800,
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          tooltip: 'Increment',
          elevation: 2.0,
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: const BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[],
          ),
          // notchedShape: CircularNotchedRectangle(),

          // color: Colors.blueGrey,
        ));
  }
}
