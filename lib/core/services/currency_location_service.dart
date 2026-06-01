import 'dart:ui' as ui;

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CurrencyLocationService {
  static const String _defaultCurrency = 'SAR';

  Future<String> getUserCurrency() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      print('[CurrencyLocationService] Location permission denied. Falling back to locale.');
      return _getCurrencyFromLocale();
    }

    try {
      Position? position;
      if (serviceEnabled) {
        position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.low,
          ),
        ).timeout(
          const Duration(seconds: 10),
          onTimeout: () => throw Exception('Location request timed out'),
        );
      }

      if (position == null) {
        position = await Geolocator.getLastKnownPosition();
      }

      if (position == null) {
        print('[CurrencyLocationService] No location available from GPS. Falling back to locale.');
        return _getCurrencyFromLocale();
      }

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw Exception('Geocoding timed out'),
      );

      if (placemarks.isNotEmpty) {
        String? countryCode = placemarks.first.isoCountryCode;
        if (countryCode != null && countryCode.isNotEmpty) {
          final currency = _getCurrencyFromCountryCode(countryCode);
          print('[CurrencyLocationService] Country code found: $countryCode -> $currency');
          return currency;
        }
      }

      print('[CurrencyLocationService] No placemark country code found. Falling back to locale.');
      return _getCurrencyFromLocale();
    } catch (e) {
      print('[CurrencyLocationService] Error fetching location/currency: $e');
      return _getCurrencyFromLocale();
    }
  }

  String _getCurrencyFromLocale() {
    final locale = ui.PlatformDispatcher.instance.locale;
    final countryCode = locale.countryCode;
    if (countryCode != null && countryCode.isNotEmpty) {
      final currency = _getCurrencyFromCountryCode(countryCode);
      print('[CurrencyLocationService] Locale country code: $countryCode -> $currency');
      return currency;
    }

    print('[CurrencyLocationService] Locale country code missing. Using default $_defaultCurrency.');
    return _defaultCurrency;
  }

  String _getCurrencyFromCountryCode(String? countryCode) {
    switch (countryCode?.toUpperCase()) {
      case 'US':
        return 'USD';
      case 'AE':
        return 'AED';
      case 'GB':
      case 'UK':
        return 'GBP';
      case 'EG':
        return 'EGP';
      case 'SA':
        return 'SAR';
      case 'IN':
        return 'INR';
      case 'CA':
        return 'CAD';
      case 'AU':
        return 'AUD';
      case 'DE':
      case 'FR':
      case 'ES':
      case 'IT':
        return 'EUR';
      case 'JP':
        return 'JPY';
      case 'CN':
        return 'CNY';
      case 'TR':
        return 'TRY';
      case 'KW':
        return 'KWD';
      case 'QA':
        return 'QAR';
      case 'BH':
        return 'BHD';
      case 'OM':
        return 'OMR';
      case 'JO':
        return 'JOD';
      default:
        return _defaultCurrency;
    }
  }
}
