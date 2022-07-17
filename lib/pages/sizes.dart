import 'package:flutter/material.dart';

class Cateroy {
  String label;
  String value;

  Cateroy(this.label, this.value);
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

List<Cateroy> PORTION = [
  Cateroy('小份', 'small'),
  Cateroy('大份', 'big')
];

List<Cateroy> SOUP = [
  Cateroy('清汤', 'light'),
  Cateroy('红汤', 'spicy')
];

class Sizes extends StatefulWidget {
  const Sizes({Key? key}) : super(key: key);

  @override
  _SizesState createState() => _SizesState();
}

class _SizesState extends State<Sizes> {
  var _portion = 'small';
  var _soup = 'light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('份量')),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('份量', textAlign: TextAlign.left,),
            Row(
              children: PORTION.map((portion) => GestureDetector(
                onTap: () {
                  setState(() {
                    _portion = portion.value;
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: _portion == portion.value ? Colors.amber : Colors.white
                  ),
                  child: Center(
                    child: Text(portion.label),
                  ),
                ),
              )).toList(),
            ),
            const Text('口味'),
            Row(
              children: SOUP.map((soup) => GestureDetector(
                onTap: () {
                  setState(() {
                    _soup = soup.value;
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      color: _soup == soup.value ? Colors.amber : Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(8))
                  ),
                  child: Center(
                    child: Text(soup.label),
                  ),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}