import 'package:barbord/home/event_card.dart';
import 'package:flutter/material.dart';

import '../core/client.dart';
import '../core/models/event_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Velkommen til denne siden',
                  style: TextStyle(fontSize: 28),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Her skal vi hente inn data fra en API',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'API-et vi skal bruke er https://old.online.ntnu.no/api/v1/event/events/, og vi skal hente ut alle eventene som finnes der. Vi skal vise eventene i en liste, og for hvert event skal vi vise tittel, startdato og et bilde. Vi skal også legge til en knapp for å laste inn flere eventer.',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Dere kan style event kortene slik vist nedenfor eller dere kan style deres egne',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  child: ValueListenableBuilder<Set<EventModel>>(
                    valueListenable: Client.eventsCache,
                    builder: (context, Set<EventModel> eventSet, child) {
                      final today = DateTime.now();
                      final futureEvents = eventSet.where((event) {
                        final eventDate = DateTime.parse(event.endDate);
                        return eventDate.isAfter(today);
                      }).toList();

                      if (futureEvents.isEmpty) {
                        return CircularProgressIndicator();
                      }

                      return SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemCount: futureEvents.length,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => EventCard(
                            event: futureEvents[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
