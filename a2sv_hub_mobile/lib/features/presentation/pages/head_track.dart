import 'package:a2sv_hub/core/presentation/routes/app_routes.dart';
import 'package:a2sv_hub/core/presentation/widgets/button.dart';
import 'package:a2sv_hub/core/presentation/widgets/common_app_bar.dart';
import 'package:a2sv_hub/core/presentation/widgets/dropdown.dart';
import 'package:a2sv_hub/core/presentation/widgets/head_input_field.dart';
import 'package:a2sv_hub/core/presentation/widgets/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeadTrackPage extends StatelessWidget {
  const HeadTrackPage({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Track',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 0.9,
                letterSpacing: 0.01,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const InputField(
              hint: 'Track name',
            ),
            const SizedBox(height: 20),
            CustomDropdown(
                value: 'Select Super Group',
                items: const ['Select Super Group', 'Students', 'Teachers'],
                onChanged: (String? value) {}),
            const SizedBox(height: 29),
            Button(
              text: 'Submit',
              onPressed: () {
                context.go(Routes.headExercise);
              },
              color: const Color(0x2E637381),
              text_color: const Color(0xFF637381),
            ),
            const SizedBox(height: 54),
            const Text(
              'Reassign Problem to Track',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 0.9,
                letterSpacing: 0.01,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            CustomDropdown(
              value: 'Select Difficulty',
              items: const ['Select Difficulty', 'Students', 'Teachers'],
              onChanged: (String? value) {},
            ),
            const SizedBox(height: 20),
            CustomDropdown(
              value: 'Select Contest',
              items: const ['Select Contest', 'Students', 'Teachers'],
              onChanged: (String? value) {},
            ),
            const SizedBox(height: 30),
            Button(
              text: 'Submit',
              onPressed: () {
                context.go(Routes.head_constest);
              },
              color: const Color(0x2E637381),
              text_color: const Color(0xFF637381),
            ),
            const SizedBox(height: 78),
            const Text(
              'Delete Track',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 0.9,
                letterSpacing: 0.01,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: CustomDropdown(
                    value: 'Select Track',
                    items: const ['Select Track', 'Students', 'Teachers'],
                    onChanged: (String? value) {},
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Button(
                    text: 'Delete',
                    onPressed: () {},
                    color: const Color(0x2E637381),
                    text_color: const Color(0xFF637381),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
