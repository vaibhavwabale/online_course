import 'package:flutter/material.dart';

import 'Screens/courses.dart';
import 'Screens/home_screen.dart';
import 'Screens/messages.dart';
import 'Screens/profile.dart';
import 'Screens/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  List<bool> stateB = [true, false, false, false, false];
  List<Widget> widgets = const [
    HomeScreen(),
    Courses(),
    Search(),
    Messages(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          widgets.elementAt(index),
          Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: size.width,
                height: 80,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomerPainter(),
                    ),
                    SizedBox(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          stateB[0]
                              ? IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.home,
                                      color: Colors.blue.shade700, size: 35))
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      for (int i = 0; i < stateB.length; i++) {
                                        stateB[i] = false;
                                      }
                                      stateB[0] = true;
                                      index = 0;
                                    });
                                  },
                                  icon: const Icon(Icons.home,
                                      color: Colors.grey, size: 35)),
                          stateB[1]
                              ? IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.album_rounded,
                                      color: Colors.blue, size: 35))
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      for (int i = 0; i < stateB.length; i++) {
                                        stateB[i] = false;
                                      }
                                      stateB[1] = true;
                                      index = 1;
                                    });
                                  },
                                  icon: const Icon(Icons.album_rounded,
                                      color: Colors.grey, size: 35)),
                          stateB[2]
                              ? IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.search,
                                      color: Colors.blue, size: 35))
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      for (int i = 0; i < stateB.length; i++) {
                                        stateB[i] = false;
                                      }
                                      stateB[2] = true;
                                      index = 2;
                                    });
                                  },
                                  icon: const Icon(Icons.search,
                                      color: Colors.grey, size: 35)),
                          stateB[3]
                              ? IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.message,
                                      color: Colors.blue, size: 35))
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      for (int i = 0; i < stateB.length; i++) {
                                        stateB[i] = false;
                                      }
                                      stateB[3] = true;
                                      index = 3;
                                    });
                                  },
                                  icon: const Icon(Icons.message,
                                      color: Colors.grey, size: 35)),
                          stateB[4]
                              ? IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.person,
                                      color: Colors.blue, size: 35))
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      for (int i = 0; i < stateB.length; i++) {
                                        stateB[i] = false;
                                      }
                                      stateB[4] = true;
                                      index = 4;
                                    });
                                  },
                                  icon: const Icon(Icons.person,
                                      color: Colors.grey, size: 35)),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class BNBCustomerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.65, 0, size.width * 0.40, 20);
    path.quadraticBezierTo(size.width * 0.1, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.8, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
