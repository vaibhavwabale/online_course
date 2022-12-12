import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

enum Levels { Alllevels, Beginner, Intermediate, Confirmed }

class _FilterState extends State<Filter> {
  String dropdownValue = 'Marks';
  List<String> filters = [
    'Marks',
    'Most Recents',
    'By Prices, From Lowest To Highest',
    'By Prices From Highest To Lowest'
  ];
  Levels? character = Levels.Alllevels;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Ink(
                              child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Icon(
                                      Icons.arrow_back_ios_outlined,
                                      color: Colors.grey,
                                      size: 15))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          '10 000 Courses',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Filter By',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: filters
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Level',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: const Text('All Levels'),
                                leading: Radio<Levels>(
                                  value: Levels.Alllevels,
                                  groupValue: character,
                                  onChanged: (Levels? value) {
                                    setState(() {
                                      character = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Beginner'),
                                leading: Radio<Levels>(
                                  value: Levels.Beginner,
                                  groupValue: character,
                                  onChanged: (Levels? value) {
                                    setState(() {
                                      character = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Intermediate'),
                                leading: Radio<Levels>(
                                  value: Levels.Intermediate,
                                  groupValue: character,
                                  onChanged: (Levels? value) {
                                    setState(() {
                                      character = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Confirmed'),
                                leading: Radio<Levels>(
                                  value: Levels.Confirmed,
                                  groupValue: character,
                                  onChanged: (Levels? value) {
                                    setState(() {
                                      character = value;
                                    });
                                  },
                                ),
                              )
                            ]),
                      ],
                    ),
                  ))),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 70,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Reset',
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueAccent.shade700),
                  ),
                  buildDivider(),
                  Text(
                    'Apply',
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueAccent.shade700),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Container buildDivider() {
  return Container(
    height: 70,
    width: 1,
    color: Colors.grey.shade400,
  );
}
