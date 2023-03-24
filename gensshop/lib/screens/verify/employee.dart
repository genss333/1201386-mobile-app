import 'package:flutter/material.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: Container(
            width: 180,
            height: 60,
            decoration: BoxDecoration(color: Colors.blue),
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                'เรียกพนักงาน',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: 180,
            height: 60,
            decoration: BoxDecoration(color: Colors.blue),
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                'ออกจากระบบ',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
