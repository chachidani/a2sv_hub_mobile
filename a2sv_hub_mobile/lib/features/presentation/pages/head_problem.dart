import 'package:a2sv_hub/core/presentation/routes/app_routes.dart';
import 'package:a2sv_hub/core/presentation/widgets/button.dart';
import 'package:a2sv_hub/core/presentation/widgets/common_app_bar.dart';
import 'package:a2sv_hub/core/presentation/widgets/dropdown.dart';
import 'package:a2sv_hub/core/presentation/widgets/head_input_field.dart';
import 'package:a2sv_hub/core/presentation/widgets/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeadProblemPage extends StatelessWidget {
  const HeadProblemPage({super.key});

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
              'Add Problems',
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
              hint: 'Problem name',
            ),
            const SizedBox(height: 20),
            CustomDropdown(
                value: 'Select Platform',
                items: const ['Select Platform', 'Students', 'Teachers'],
                onChanged: (String? value) {}),
            const SizedBox(height: 20),
            const InputField(
              hint: 'Tags',
            ),
            const SizedBox(height: 20),
            CustomDropdown(
              value: 'Select Track',
              items: const ['Select Track', 'Students', 'Teachers'],
              onChanged: (String? value) {},
            ),
            const SizedBox(height: 20),
            CustomDropdown(
              value: 'Select Contest',
              items: const ['Select Contest', 'Students', 'Teachers'],
              onChanged: (String? value) {},
            ),
            const SizedBox(height: 20),
            const InputField(
              hint: 'Link',
            ),
            const SizedBox(height: 36),
            Button(
              text: 'Submit',
              onPressed: () {
                context.go(Routes.head_constest);
              },
              color: const Color(0x2E637381),
              text_color: const Color(0xFF637381),
            ),
            const SizedBox(height: 54),
            const Text(
              'Delete Problems',
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
                    value: 'Select Problem',
                    items: const ['Select Problem', 'Students', 'Teachers'],
                    onChanged: (String? value) {},
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Button(
                    text: 'Delete',
                    onPressed: () {
                      context.go(Routes.headAttendence);
                    },
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
