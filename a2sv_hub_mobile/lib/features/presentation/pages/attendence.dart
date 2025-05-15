import 'package:a2sv_hub/core/presentation/widgets/button.dart';
import 'package:a2sv_hub/core/presentation/widgets/common_app_bar.dart';
import 'package:a2sv_hub/core/presentation/widgets/dropdown.dart';
import 'package:a2sv_hub/core/presentation/widgets/sidemenu.dart';
import 'package:flutter/material.dart';

class Student {
  final String name;
  final String id;
  late String status;
  final String? imageUrl;
  final String? email;

  Student({
    required this.name,
    required this.id,
    required this.status,
    this.imageUrl,
    this.email,
  });
}

class TakeAttendence extends StatefulWidget {
  const TakeAttendence({super.key});

  @override
  State<TakeAttendence> createState() => _TakeAttendenceState();
}

class _TakeAttendenceState extends State<TakeAttendence> {
  final List<Student> _students = [
    Student(
      name: 'Yohannes Tesfaye Daniel',
      id: '12345',
      status: 'Present',
      imageUrl: 'assets/images/profille.png',
      email: '',
    ),
    Student(
      name: 'Jane Smith Abebe',
      id: '67890',
      status: 'Absent',
      imageUrl: 'assets/images/profille.png',
      email: '',
    ),
    Student(
      name: 'Alice Johnson Nega',
      id: '54321',
      status: 'Present',
      imageUrl: 'assets/images/profille.png',
      email: '',
    ),
    Student(
      name: 'Bob Brown Tadesse',
      id: '98765',
      status: 'Absent',
      imageUrl: 'assets/images/profille.png',
      email: '',
    ),
    Student(
      name: 'Yohannes Tesfaye Daniel',
      id: '12345',
      status: 'Present',
      imageUrl: 'assets/images/profille.png',
      email: '',
    ),
    Student(
      name: 'Yohannes Tesfaye Daniel',
      id: '12345',
      status: 'Present',
      imageUrl: 'assets/images/profille.png',
      email: '',
    ),
    Student(
      name: 'Yohannes Tesfaye Daniel',
      id: '12345',
      status: 'Present',
      imageUrl: 'assets/images/profille.png',
      email: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: SideMenu(),
      ),
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(title: 'Take Attendence'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Take Attendence',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 0.9,
                letterSpacing: 0.01,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: CustomDropdown(
                    value: "Session",
                    items: const ['Session', 'Students', 'Teachers'],
                    onChanged: (String? value) {},
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: CustomDropdown(
                    value: "Type",
                    items: const ['Type', 'Students', 'Teachers'],
                    onChanged: (String? value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Button(
              text: "Everyone Present",
              onPressed: () {},
              color: const Color.fromARGB(31, 57, 120, 202),
              text_color: const Color(0xFF2065D1),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: _students.length,
                itemBuilder: (context, index) {
                  final student = _students[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(student.imageUrl!),
                          radius: 25,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                student.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  'Late',
                                  'Absent',
                                  'Excused',
                                  'Present',
                                ]
                                    .map((status) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              student.status = status;
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 4),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            decoration: BoxDecoration(
                                              color: student.status == status
                                                  ? const Color(0xFF2065D1)
                                                  : const Color.fromARGB(
                                                      96, 189, 214, 231),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              status,
                                              style: TextStyle(
                                                color: student.status == status
                                                    ? Colors.white
                                                    : status == 'Late'
                                                        ? Colors.blue
                                                        : status == 'Absent'
                                                            ? Colors.red
                                                            : status ==
                                                                    'Excused'
                                                                ? Colors.amber
                                                                : status ==
                                                                        'Present'
                                                                    ? Colors
                                                                        .green
                                                                    : Colors
                                                                        .white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            Button(
              text: 'Submit',
              onPressed: () {
                // Handle submit action
              },
              color: const Color(0xFF2065D1),
              text_color: Colors.white,
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
