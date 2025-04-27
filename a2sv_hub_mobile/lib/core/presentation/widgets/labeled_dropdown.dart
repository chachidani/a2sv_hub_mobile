import 'package:flutter/material.dart';

class LabeledCustomDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? label;

  const LabeledCustomDropdown({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: const Color(0xFFDADADA),
              width: 1,
            ),
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
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
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xFF637381),
            ),
          ),
        ),
        if (label != null)
          Positioned(
            left: 12,
            top: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                label!,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF637381),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
