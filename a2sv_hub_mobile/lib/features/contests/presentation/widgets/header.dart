import 'package:flutter/material.dart';

class ContestHeader extends StatelessWidget {
  final VoidCallback onNotificationTap;
  final VoidCallback onProfileTap;

  const ContestHeader({
    super.key,
    required this.onNotificationTap,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Image(
                image: AssetImage('assets/images/menu.jpg'),
                height: 26,
              ),
              SizedBox(width: 13),
              Image(
                image: AssetImage('assets/images/search.jpg'),
                height: 26,
              ),
            ],
          ),
          Row(
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14159),
                child: const Icon(Icons.auto_awesome, color: Colors.amber),
              ),
              const SizedBox(width: 3),
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined,
                        color: Colors.black),
                    onPressed: onNotificationTap,
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('1',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 3),
              GestureDetector(
                onTap: onProfileTap,
                child: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/africa_a2sv.png'),
                    radius: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
