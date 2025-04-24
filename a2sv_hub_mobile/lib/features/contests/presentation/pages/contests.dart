import 'package:a2sv_hub/features/contests/presentation/widgets/contest_card.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/header.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/notification_modal.dart';
import 'package:a2sv_hub/features/contests/presentation/widgets/profile_modal.dart';
import 'package:flutter/material.dart';

class ContestPage extends StatefulWidget {
  const ContestPage({super.key});

  @override
  State<ContestPage> createState() => _ContestPageState();
}

class _ContestPageState extends State<ContestPage> {
  bool showNotifications = false;
  bool showProfileMenu = false;

  void toggleNotifications() {
    setState(() {
      showNotifications = !showNotifications;
      showProfileMenu = false;
    });
  }

  void toggleProfileMenu() {
    setState(() {
      showProfileMenu = !showProfileMenu;
      showNotifications = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContestHeader(
                    onNotificationTap: toggleNotifications,
                    onProfileTap: toggleProfileMenu,
                  ),
                  const Text(
                    'Contest',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 0.9,
                      letterSpacing: 0.01,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 13),
                  const Text(
                    'Ratings & contests',
                    style: TextStyle(
                      color: Color(0xFF8C8787),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 29),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF000000).withOpacity(0.2),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 14),
                          border: InputBorder.none,
                        ),
                        value: 'Groups',
                        items: const [
                          DropdownMenuItem(
                            value: 'Groups',
                            child: Text(
                              'Groups',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF8C8787),
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 29),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 30),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 139,
                          child: ContestCard(
                            title: index % 2 == 0
                                ? '133. A2SV Ghana G6 - Round #5'
                                : '132. A2SV Remote Contest #8',
                            subtitle: index % 2 == 0
                                ? '6 problems . 14h ago'
                                : '6 problems . 14h ago',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (showNotifications) const NotificationModal(),
            if (showProfileMenu) const ProfileModal(),
          ],
        ),
      ),
    );
  }
}
