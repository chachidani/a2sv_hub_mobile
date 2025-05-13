import 'package:flutter/material.dart';

class ProfileTabBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const ProfileTabBar({
    Key? key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2.0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: List.generate(
            tabs.length,
            (index) => Expanded(
              child: InkWell(
                onTap: () => onTabSelected(index),
                child: Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: selectedIndex == index
                            ? Colors.blue
                            : Colors.transparent,
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _getIconForTab(tabs[index]),
                        color: selectedIndex == index
                            ? Colors.black
                            : Colors.grey.shade500,
                        size: 20.0,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        tabs[index],
                        style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.grey.shade500,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData? _getIconForTab(String tab) {
    switch (tab.toLowerCase()) {
      case 'profile':
        return Icons.person;
      case 'problems':
        return Icons.code;
      case 'contests':
        return Icons.bar_chart;
      case 'groups':
        return null;
      case 'users':
        return null;
      case 'standard contest':
        return null;
      case 'super contest':
        return null;
      default:
        return Icons.circle;
    }
  }
}
