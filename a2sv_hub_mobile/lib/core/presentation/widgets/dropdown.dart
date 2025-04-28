import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.2),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: SizedBox(
        height: 56,
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            border: InputBorder.none,
          ),
          value: value,
          selectedItemBuilder: (context) {
            return items.map((e) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  e,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF637381),
                  ),
                ),
              );
            }).toList();
          },
          items: items.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF637381),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: value == e
                        ? const Icon(
                            Icons.check,
                            size: 16,
                            color: Color(0xFF637381),
                          )
                        : null,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    e,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF637381),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
