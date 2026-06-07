import 'package:flutter/material.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/main_view_body.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/core/widgets/custom_app_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'MainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var currentindex = 0;

  @override
  Widget build(BuildContext context) {
    final userEntity = Prefs.getUserEntity();
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (int value) {
          setState(() {
            currentindex = value;
          });
        },
      ),
      appBar: customAppBar(name: userEntity?.name ?? 'NNNNN'),
      body: MainViewBody(currentindex: currentindex),
    );
  }
}
