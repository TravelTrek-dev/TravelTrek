import 'package:flutter/material.dart';
import 'package:travel_trek/Features/note/presentation/views/widgets/tips_view_body.dart';

class TipsView extends StatelessWidget {
  const TipsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: TipsViewBody()));
  }
}
