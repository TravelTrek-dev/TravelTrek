import 'package:flutter/material.dart';
import 'package:travel_trek/core/utils/app_styles.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
    required this.iconData,
    required this.title,
    required this.description,
  });

  final IconData iconData;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 342,
        height: 128.5,
        decoration: BoxDecoration(
          color: const Color(0xffF4F4EA),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 55,
              decoration: BoxDecoration(
                color: const Color(0xffEBEBE0),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Icon(iconData, color: Color(0xff5C5850), size: 28),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyles.regluar18.copyWith(
                      color: const Color(0xff2D2926),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: AppStyles.meduim14.copyWith(
                      color: const Color(0xff7A776E),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
