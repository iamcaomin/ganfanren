import 'package:flutter/material.dart';

class MENU {
  String label;
  String image;
  String path;

  MENU(this.label, this.image, this.path);
  @override
  String toString() {
    return '{${this.label}, ${this.image}';
  }
}
List<MENU> MENU_LIST = [
  MENU('分量', 'assets/images/icon_01.png', '/sizes'),
  MENU('选菜', 'assets/images/icon_02.png', '/dishes'),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("干饭人"),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
              children: MENU_LIST.map((menu) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, menu.path);
                },
                child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                    padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 16),
                            child: SizedBox(
                                child: Image.asset(menu.image),
                                width: 36,
                                height: 36
                            ),
                          ),
                          Text(menu.label)
                        ]
                    )
                ),
              )).toList()
          ),
        )
    );
  }
}
