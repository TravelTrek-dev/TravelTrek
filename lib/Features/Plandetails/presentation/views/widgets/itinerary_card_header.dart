import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/top_tap.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';

class ItineraryCardHeader extends StatelessWidget {
  const ItineraryCardHeader({super.key, required this.planModel});

  final PlanModel? planModel;

  @override
  Widget build(BuildContext context) {
    final value = planModel?.value;
    final durationText = value?.duration ?? 'N/A';
    final weatherText = value?.weather != null
        ? '${value!.weather!.avgTempCelsius?.round() ?? '-'}° ${value.weather!.condition ?? ''}'
        : 'N/A';
    final title = value?.country != null
        ? '${value?.city ?? ''}, ${value?.country}'
        : 'Your Travel Plan';

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.network(
              planModel!.value!.imageUrl!,
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
                  text: durationText,
                  decorationColor: const Color(0xFF5E5758).withOpacity(0.8),
                  textColor: Colors.white,
                ),
                const SizedBox(width: 8),
                TopTag(
                  text: weatherText,
                  decorationColor: const Color(0xFFF1F1E8).withOpacity(0.9),
                  textColor: const Color(0xFF2C2929),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Text(
              title,
              style: const TextStyle(
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
