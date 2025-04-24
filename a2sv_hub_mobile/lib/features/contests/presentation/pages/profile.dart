// import 'package:a2sv_hub/features/contests/presentation/widgets/contest_card.dart';
// import 'package:a2sv_hub/features/contests/presentation/widgets/contest_progress_card.dart';
// import 'package:a2sv_hub/features/contests/presentation/widgets/header.dart';
// import 'package:a2sv_hub/features/contests/presentation/widgets/notification_modal.dart';
// import 'package:a2sv_hub/features/contests/presentation/widgets/profile_modal.dart';
// import 'package:a2sv_hub/features/contests/presentation/widgets/user_info_card.dart';
// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   bool showNotifications = false;
//   bool showProfileMenu = false;

//   void toggleNotifications() {
//     setState(() {
//       showNotifications = !showNotifications;
//       showProfileMenu = false;
//     });
//   }

//   void toggleProfileMenu() {
//     setState(() {
//       showProfileMenu = !showProfileMenu;
//       showNotifications = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ContestHeader(
//                       onNotificationTap: toggleNotifications,
//                       onProfileTap: toggleProfileMenu,
//                     ),
//                     const UserInfoCard(),
//                     const ContestProgressCard(),
//                     const SizedBox(height: 29),
//                     SizedBox(
//                       height: 500, // Constrain the height of the ListView
//                       child: ListView.separated(
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: 5,
//                         separatorBuilder: (context, index) =>
//                             const SizedBox(height: 30),
//                         itemBuilder: (context, index) {
//                           return SizedBox(
//                             height: 139,
//                             child: ContestCard(
//                               title: index % 2 == 0
//                                   ? '133. A2SV Ghana G6 - Round #5'
//                                   : '132. A2SV Remote Contest #8',
//                               subtitle: index % 2 == 0
//                                   ? '6 problems . 14h ago'
//                                   : '6 problems . 14h ago',
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 12.0),
//                 child: Image.asset(
//                   'assets/images/theme.jpg',
//                   width: 50,
//                   height: 50,
//                 ),
//               ),
//             ),
//             if (showNotifications) const NotificationModal(),
//             if (showProfileMenu) const ProfileModal(),
//           ],
//         ),
//       ),
//     );
//   }
// }
