import 'package:barbord/core/models/event_model.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      height: 150,
      width: 300,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Text(event.title),
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              height: 150,
              width: 150,
              child: Image.network(event.images.first.thumb),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Text('${event.startDate}'),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text("${event.numberOfSeatsTaken} / ${event.maxCapacity.toString()}"),
          ),
          Container(
            height: 5,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
