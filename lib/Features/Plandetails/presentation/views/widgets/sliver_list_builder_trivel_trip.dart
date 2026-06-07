import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/travel_trips_card.dart';

class SliverListBuilderTrivelTrip extends StatelessWidget {
  const SliverListBuilderTrivelTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: localInfoItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TravelTripsCard(
            title: localInfoItems[index]['title'],
            description: localInfoItems[index]['description'],
            icon: localInfoItems[index]['icon'],
          ),
        );
      },
    );
  }
}

final List<Map<String, dynamic>> localInfoItems = [
  {
    'title': 'Dress Code & Etiquette',
    'icon': Icons.checkroom,
    'description':
        'Respect local customs by wearing modest clothing. Cover shoulders and knees in religious sites.',
  },
  {
    'title': 'Local Transport (Uber/Careem)',
    'icon': Icons.directions_car_filled_outlined,
    'description':
        'Uber and Careem are widely available in major cities. They are generally safer and have fixed pricing.',
  },
  {
    'title': 'Baksheesh Culture',
    'icon': Icons.lightbulb_outline,
    'description':
        'Tipping (Baksheesh) is common in Egypt for most services. Carrying small change is always helpful.',
  },
];
