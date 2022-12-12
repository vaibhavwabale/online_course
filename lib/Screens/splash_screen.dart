import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:online_course/main.dart';

void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  bool animation = false;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    ).forward().then((value) => setState(() {
          if (kDebugMode) {
            print('ads');
          }
          animation = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    void endcallback() {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => const MyHomePage()));
    }

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/video-tutorials.png',
            width: 160,
            height: 160,
          ),
          AnimatedDefaultTextStyle(
            style: animation
                ? const TextStyle(fontSize: 40)
                : const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            duration: const Duration(milliseconds: 2000),
            onEnd: endcallback,
            child: const Align(
              alignment: Alignment.center,
              child: Text('Learn Code Overcome'),
            ),
          )
        ],
      ),
    );
  }
}
