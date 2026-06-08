import 'package:travel_trek/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage;
  final String inActiveImage;
  final String text;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.text,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: Assets.imagesHomeIconActive,
    inActiveImage: Assets.imagesHomeIconInactive,
    text: 'Home',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesPlanIconActive,
    inActiveImage: Assets.imagesPlanIconInactive,
    text: 'My Plans',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesProfileIconActive,
    inActiveImage: Assets.imagesProfileIconInactive,
    text: 'Profile',
  ),
];
