import 'package:equatable/equatable.dart';

class TravelTipEntity extends Equatable {
  final String title;
  final String content;
  final String iconName;

  const TravelTipEntity({
    required this.title,
    required this.content,
    required this.iconName,
  });

  @override
  List<Object?> get props => [title, content, iconName];
}
