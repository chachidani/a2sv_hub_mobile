import 'package:a2sv_hub/core/presentation/widgets/button.dart';
import 'package:a2sv_hub/core/presentation/widgets/common_app_bar.dart';
import 'package:a2sv_hub/core/presentation/widgets/dropdown.dart';
import 'package:a2sv_hub/core/presentation/widgets/labeled_dropdown.dart';
import 'package:a2sv_hub/core/presentation/widgets/sidemenu.dart';
import 'package:flutter/material.dart';

class HeadExercisPage extends StatefulWidget {
  HeadExercisPage({super.key});

  @override
  State<HeadExercisPage> createState() => _HeadExercisPageState();
}

class _HeadExercisPageState extends State<HeadExercisPage> {
  final List<String> items = [
    'value',
    'Hehy',
    'jkbckja',
    'lkbcka',
  ];
  final String value = 'value';
  final String label = 'Select a Track';

  void onChanged(String? value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: SideMenu(),
      ),
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(title: 'Add Problems'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Exercise',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 0.9,
                letterSpacing: 0.01,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 46),
            LabeledCustomDropdown(
                label: 'Select a Track',
                value: 'Progress',
                items: const ['Progress', 'Students', 'Teachers'],
                onChanged: (String? value) {}),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: CustomDropdown(
                    value: 'Select Problem(s)',
                    items: const ['Select Problem(s)', 'Students', 'Teachers'],
                    onChanged: (String? value) {},
                  ),
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                      fillColor: MaterialStateProperty.all(Colors.white),
                      checkColor: const Color.fromARGB(255, 156, 156, 156),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'All',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        letterSpacing: 0.01,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 47),
            Button(
              text: 'Submit',
              onPressed: () {},
              color: const Color(0x2E637381),
              text_color: const Color(0xFF637381),
            ),
          ],
        ),
      ),
    );
  }
}
