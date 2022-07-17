import 'package:flutter/material.dart';

List<List> GRID = [
  [1,2],
  [3,4]
];

class Dishes extends StatefulWidget {
  const Dishes({Key? key}): super(key: key);

  @override
  _DishesState createState() => _DishesState();
}

class _DishesState extends State<Dishes> {
  var _choice = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final rowWidth = (width - 60 - 40) / 2;
    return Scaffold(
      appBar: AppBar(title: const Text('选菜')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.white60)
                ),
                child: const Text('我的位置，选选吃什么菜吧'),
              )
            ],
          ),
          Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: GRID.map((column) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: column.map((row) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _choice = row;
                      });
                    },
                    child: Container(
                      width: rowWidth,
                      height: rowWidth,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: _choice == row ? Colors.amber : Colors.grey),
                          // color: Colors.white,
                          color: _choice == row ? Colors.amber : Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(8))
                      ),
                      child: const Text(''),
                    ),
                  )).toList(),
                )).toList(),
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.white60)
                ),
                child: const Text('掌勺人'),
              )
            ],
          )
        ],
      )
    );
  }
}