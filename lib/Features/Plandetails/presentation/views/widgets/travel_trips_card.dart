import 'package:flutter/material.dart';

class TravelTripsCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const TravelTripsCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<TravelTripsCard> createState() => _TravelTripsCardState();
}

class _TravelTripsCardState extends State<TravelTripsCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2EE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(widget.icon, color: const Color(0xFF66595B), size: 24),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF66595B),
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    turns: _isExpanded ? 0.5 : 0,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF66595B),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.only(left: 56, right: 16, bottom: 16),
              child: Text(
                widget.description,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: const Color(0xFF66595B).withValues(alpha: 0.8),
                ),
              ),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
