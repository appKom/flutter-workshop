import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/event_model.dart';

abstract class Client {
  static const endpoint = 'https://old.online.ntnu.no';

  static final ValueNotifier<Set<EventModel>> eventsCache = ValueNotifier({});

  static Future<Set<EventModel>?> getEvents({List<int> pages = const [1, 2, 3, 4]}) async {
    Set<EventModel> allEvents = {};

    for (int page in pages) {
      String url = '$endpoint/api/v1/event/events/?page=$page';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes, allowMalformed: true);
        final jsonResponse = jsonDecode(responseBody);
        final events = jsonResponse['results'].map<EventModel>((eventJson) => EventModel.fromJson(eventJson)).toList();

        allEvents.addAll(events);
      }
    }

    // Add any new events fetched
    if (allEvents.isNotEmpty) {
      eventsCache.value = Set.from(eventsCache.value)..addAll(allEvents);
    }

    return allEvents;
  }
}
