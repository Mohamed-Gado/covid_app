import 'package:covid_app/screens/add_medical_report_screen.dart';
import 'package:covid_app/screens/symptoms_analysis_screen.dart';
import 'package:covid_app/widgets/grid_item_widget.dart';
import 'package:flutter/material.dart';

class DoctorHomeWidget extends StatelessWidget {
  const DoctorHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GridItemWidget(
            context: context,
            iconData: Icons.medication_outlined,
            primaryColor: Colors.green,
            secondaryColor: Colors.green[900]!,
            text: "Medical Report",
            onPressed: () {
              Navigator.of(context).pushNamed(AddMedicalReportScreen.routeName);
            },
          ),
          GridItemWidget(
            context: context,
            iconData: Icons.health_and_safety_outlined,
            primaryColor: Colors.yellow,
            secondaryColor: Colors.yellow[900]!,
            text: "Symptom Analysis",
            onPressed: () {
              Navigator.of(context).pushNamed(SymptomsAnalysisScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
