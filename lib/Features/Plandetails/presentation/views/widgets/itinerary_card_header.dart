import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/top_tap.dart';

class ItineraryCardHeader extends StatelessWidget {
  const ItineraryCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.network(
              'https://ichef.bbci.co.uk/news/raw/cpsprodpb/2d65/live/8af4b6c0-144f-11ef-9b12-1ba8f95c4917.jpg',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: .3),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),

          Positioned(
            top: 16,
            left: 16,
            child: Row(
              children: [
                TopTag(
                  text: '4 DAYS',
                  decorationColor: const Color(0xFF5E5758).withOpacity(0.8),
                  textColor: Colors.white,
                ),
                const SizedBox(width: 8),
                TopTag(
                  text: '32°C ☀️',
                  decorationColor: const Color(0xFFF1F1E8).withOpacity(0.9),
                  textColor: const Color(0xFF2C2929),
                ),
              ],
            ),
          ),

          const Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Text(
              'Family Adventure in Cairo ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
