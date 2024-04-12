import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      height: 150,
      width: 300,
      child: Stack(
        children: [
          const Positioned(
            top: 20,
            left: 20,
            child: Text('Tittel'),
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              height: 150,
              width: 150,
              child: Image.asset('assets/images/sessa.jpg'),
            ),
          ),
          const Positioned(
            top: 40,
            left: 20,
            child: Text('Dato'),
          ),
          const Positioned(
            top: 80,
            left: 20,
            child: Text('6/9'),
          ),
        ],
      ),
    );
  }
}
