import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../routes/app_routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 149,
                        height: 47,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(
                            Icons.keyboard_double_arrow_left_outlined,
                            size: 30,
                            color: Color(0xFF8C8787)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 270,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(33, 43, 54, 0.07),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          "https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jack Santiago",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "Student",
                            style: TextStyle(
                                color: Color(0xFF8C8787), fontSize: 13),
                          )
                        ])
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 30.0),
            leading: const Icon(
              Icons.home_outlined,
              color: Color(0xFF8C8787),
            ),
            title: const Text(
              "Home",
              style: TextStyle(color: Color(0xFF8C8787), fontSize: 13),
            ),
            onTap: () {
              context.go(Routes.home);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 28.0),
            leading: SvgPicture.asset(
              'assets/icons/track.svg',
              width: 24,
              height: 24,
              color: const Color(0xFF8C8787),
            ),
            title: const Text(
              "Tracks",
              style: TextStyle(color: Color(0xFF8C8787), fontSize: 13),
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 28.0),
            leading: SvgPicture.asset(
              'assets/icons/problems.svg',
              width: 18,
              height: 20,
              color: const Color(0xFF8C8787),
            ),
            title: const Text(
              "Problems",
              style: TextStyle(color: Color(0xFF8C8787), fontSize: 13),
            ),
            onTap: () {
              context.go(Routes.problem);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 28.0),
            leading: SvgPicture.asset(
              'assets/icons/contest.svg',
              width: 21,
              height: 21,
              color: const Color(0xFF8C8787),
            ),
            title: const Text(
              "Contests",
              style: TextStyle(color: Color(0xFF8C8787), fontSize: 13),
            ),
            onTap: () {
              context.go(Routes.contests);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 28.0),
            leading: SvgPicture.asset(
              'assets/icons/roadmap.svg',
              width: 18,
              height: 18,
              color: const Color(0xFF8C8787),
            ),
            title: const Text(
              "Roadmap",
              style: TextStyle(color: Color(0xFF8C8787), fontSize: 13),
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 28.0),
            leading: const Icon(
              Icons.group_outlined,
              color: Color(0xFF8C8787),
            ),
            title: const Text(
              "Groups",
              style: TextStyle(color: Color(0xFF8C8787), fontSize: 13),
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 28.0),
            leading: const Icon(
              Icons.person_outline,
              color: Color(0xFF8C8787),
            ),
            title: const Text(
              "Users",
              style: TextStyle(color: Color(0xFF8C8787), fontSize: 13),
            ),
            onTap: () {
              context.go(Routes.profile);
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Divider(),
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 28.0),
            leading: const Icon(
              Icons.logout_outlined,
              color: Color(0xFF8C8787),
            ),
            title: const Text(
              "Log Out",
              style: TextStyle(color: Color(0xFF8C8787), fontSize: 13),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
