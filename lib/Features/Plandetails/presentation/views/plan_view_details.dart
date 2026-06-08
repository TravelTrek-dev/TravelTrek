import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/custom_tap_bar.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/plan_view_details_body.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';

class PlanViewDetails extends StatefulWidget {
  const PlanViewDetails({super.key, required this.planModel});
  static const routeName = 'PlanViewDetails';

  final PlanModel? planModel;

  @override
  State<PlanViewDetails> createState() => _PlanViewDetailsState();
}

class _PlanViewDetailsState extends State<PlanViewDetails> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: CustomTabBar(
            onTap: (int value) {
              currentindex = value;
              setState(() {});
            },
          ),

          backgroundColor: Colors.transparent,
        ),
        body: PlanViewDetailsBody(
          currentindex: currentindex,
          planModel: widget.planModel,
        ),
      ),
    );
  }
}
