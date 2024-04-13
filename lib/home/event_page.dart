import 'package:barbord/core/models/event_model.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key, required this.model});
  final EventModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(model.images.first.md),
              const SizedBox(
                height: 12,
              ),
              Text(model.title),
              const SizedBox(
                height: 12,
              ),
              Text(model.location),
              const SizedBox(
                height: 12,
              ),
              Text(
                model.ingress,
                style: TextStyle(fontSize: 12),
              ),
              Text(
                model.description,
                style: TextStyle(fontSize: 12, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
