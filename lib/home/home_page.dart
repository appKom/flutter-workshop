import 'package:flutter/material.dart';

import 'event_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Velkommen til denne siden',
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Her skal vi hente inn data fra en API',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'API-et vi skal bruke er https://old.online.ntnu.no/api/v1/event/events/, og vi skal hente ut alle eventene som finnes der. Vi skal vise eventene i en liste, og for hvert event skal vi vise tittel, startdato og et bilde. Vi skal også legge til en knapp for å laste inn flere eventer.',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Dere kan style event kortene slik vist nedenfor eller dere kan style deres egne',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 24,
                ),
                EventCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
