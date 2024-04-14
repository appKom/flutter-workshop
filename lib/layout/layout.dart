import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  double sessaSize = 400.0;
  bool isSessaBig = true;

  ValueNotifier<MainAxisAlignment> mainAxisAlignment = ValueNotifier(MainAxisAlignment.start);

  Widget dropdown() {
    return ValueListenableBuilder(
        valueListenable: mainAxisAlignment,
        builder: (context, value, child) {
          return DropdownButton<MainAxisAlignment>(
            value: value,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            onChanged: (MainAxisAlignment? newValue) {
              if (newValue == null) return;

              mainAxisAlignment.value = newValue;
            },
            items: MainAxisAlignment.values.map<DropdownMenuItem<MainAxisAlignment>>((MainAxisAlignment value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          dropdown(),
          const SizedBox(height: 250),
          Container(color: Colors.black, height: 1),
          const Text('Row'),
          ValueListenableBuilder(
            valueListenable: mainAxisAlignment,
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: value,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.black,
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.black,
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.black,
                    width: 50,
                    height: 50,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 50),
          Container(color: Colors.black, height: 1),
          const Text('Column'),
          SizedBox(
            height: 300,
            child: ValueListenableBuilder(
              valueListenable: mainAxisAlignment,
              builder: (context, value, child) {
                return Column(
                  mainAxisAlignment: value,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      color: Colors.black,
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      color: Colors.black,
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      color: Colors.black,
                      width: 50,
                      height: 50,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
