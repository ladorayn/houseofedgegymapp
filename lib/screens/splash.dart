import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:houseofedgegym/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Image(
            image: AssetImage("images/houseofedgelogo.jpeg"),
            width: 300,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) {
            return const Home();
          },
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
    );
  }
}
