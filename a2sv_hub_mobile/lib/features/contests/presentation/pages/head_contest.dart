import 'package:a2sv_hub/core/presentation/routes/routes.dart';
import 'package:a2sv_hub/core/presentation/widgets/button.dart';
import 'package:a2sv_hub/core/presentation/widgets/common_app_bar.dart';
import 'package:a2sv_hub/core/presentation/widgets/dropdown.dart';
import 'package:a2sv_hub/core/presentation/widgets/head_input_field.dart';
import 'package:a2sv_hub/core/presentation/widgets/labeled_dropdown.dart';
import 'package:a2sv_hub/core/presentation/widgets/sidemenu.dart';
import 'package:a2sv_hub/features/presentation/widgets/profile_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeadContestPage extends StatefulWidget {
  const HeadContestPage({super.key});

  @override
  State<HeadContestPage> createState() => _HeadContestPageState();
}

class _HeadContestPageState extends State<HeadContestPage> {
  int _selectedTabIndex = 0;

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
          children: [
            ProfileTabBar(
              tabs: const ['Standard Contest', 'Super Contest'],
              selectedIndex: _selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            ),
            const SizedBox(height: 48),
            Expanded(
              child: _buildTabContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    if (_selectedTabIndex == 0) {
      return _standardContestForm();
    } else {
      return _superContestForm();
    }
  }

  Widget _standardContestForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add Contest',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 0.9,
            letterSpacing: 0.01,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 31),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (bool? value) {},
              activeColor: const Color(0xFF637381),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              'Unrated contest (This will add virtual\nparticipants but the contest will be unrated.)',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
                letterSpacing: 0.01,
                color: Color(0xFF637381),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        LabeledCustomDropdown(
          value: 'InPerson',
          items: const ['InPerson', 'Students', 'Teachers'],
          onChanged: (String? value) {},
        ),
        const SizedBox(height: 20),
        CustomDropdown(
          value: 'Paste contest link',
          items: const ['Paste contest link'],
          onChanged: (String? value) {},
        ),
        const SizedBox(height: 38),
        Button(
          text: 'Submit',
          onPressed: () {
            context.go(Routes.headTrack);
          },
          color: const Color(0x2E637381),
          text_color: const Color(0xFF637381),
        ),
        const SizedBox(height: 140),
        const Text(
          'Delete Contest',
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
                onPressed: () {},
                color: const Color(0x2E637381),
                text_color: const Color(0xFF637381),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _superContestForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add Standard Contest',
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
            hint: 'Contest name',
          ),
          const SizedBox(height: 20),
          const InputField(
            hint: 'Paste contest link for Div1',
          ),
          const SizedBox(height: 20),
          const InputField(
            hint: 'Paste contest link for Div2',
          ),
          const SizedBox(height: 20),
          LabeledCustomDropdown(
            label: 'Select Super Group',
            value: 'InPerson',
            items: const ['InPerson', 'Students', 'Teachers'],
            onChanged: (String? value) {},
          ),
          const SizedBox(height: 36),
          Button(
            text: 'Preprocess',
            onPressed: () {},
            color: const Color(0x2E637381),
            text_color: const Color(0xFF637381),
          ),
          const SizedBox(height: 14),
          Button(
            text: 'Submit',
            onPressed: () {},
            color: const Color(0x2E637381),
            text_color: const Color(0xFF637381),
          ),
          const SizedBox(height: 103),
          const Text(
            'Delete Contest',
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
                  onPressed: () {},
                  color: const Color(0x2E637381),
                  text_color: const Color(0xFF637381),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
