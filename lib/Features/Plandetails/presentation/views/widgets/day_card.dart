import 'package:flutter/material.dart';

class DayCard extends StatelessWidget {
  const DayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                height: 30,
                alignment: Alignment.center,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: const BoxDecoration(
                    color: Color(0xFF66595B),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Expanded(
                child: VerticalDivider(
                  thickness: 2,
                  width: 2,
                  color: const Color(0xFF66595B).withValues(alpha: 0.2),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    'Day 1: Arrival & Nile Views',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF66595B),
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2EE),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transfer to your hotel with a view of the Nile. Afternoon felucca ride at sunset followed by a welcome dinner.',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xFF66595B).withValues(alpha: 0.8),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(
                            Icons.restaurant,
                            size: 20,
                            color: Color(0xFF66595B),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Dinner at Naguib Mahfouz Cafe',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF66595B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}