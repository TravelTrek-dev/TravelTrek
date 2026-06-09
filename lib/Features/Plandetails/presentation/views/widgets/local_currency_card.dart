import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/services/prefs.dart';

class LocalCurrencyCard extends StatelessWidget {
  const LocalCurrencyCard({super.key, required this.userCurrency, required this.currency, required this.conversionRate});
  final String userCurrency;
  final String currency;
  final double conversionRate;
  @override
  Widget build(BuildContext context) {
    final savedCurrency = Prefs.getString(kSavedCurrency);
    String localCurrency = savedCurrency.isEmpty ? 'SAR' : savedCurrency;
    log('Local Currency: $localCurrency');
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2EE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0DA),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.currency_exchange,
              color: Color(0xFF66595B),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Currency',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFF66595B).withValues(alpha: 0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '1 $userCurrency = ${conversionRate.toStringAsFixed(4)} $currency',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF66595B),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
