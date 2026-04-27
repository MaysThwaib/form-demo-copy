import 'package:flutter/material.dart';

class OutputScreen extends StatelessWidget {
  final String? username;
  final String? password;
  final String? email;
  final bool? rememberMe;
  final String? gender;
  final String? country;
  final double? age;
  final DateTime? selectedDate;

  const OutputScreen({
    super.key,
    this.username,
    this.password,
    this.email,
    this.rememberMe,
    this.gender,
    this.country,
    this.age,
    this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String? finalUsername = args?['username'] ?? username;
    final String? finalPassword = args?['password'] ?? password;
    final String? finalEmail = args?['email'] ?? email;
    final bool? finalRememberMe = args?['rememberMe'] ?? rememberMe;
    final String? finalGender = args?['gender'] ?? gender;
    final String? finalCountry = args?['country'] ?? country;
    final double? finalAge = args?['age'] ?? age;
    final DateTime? finalSelectedDate = args?['selectedDate'] ?? selectedDate;

    return Scaffold(
      appBar: AppBar(title: const Text('Form Output')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Username: $finalUsername'),
            Text('Password: $finalPassword'),
            Text('Email: $finalEmail'),
            Text('Remember Me: $finalRememberMe'),
            Text('Gender: $finalGender'),
            Text('Country: $finalCountry'),
            Text('Age: ${finalAge?.round()}'),
            Text(
              'Selected Date: ${finalSelectedDate?.toLocal().toString().split(' ')[0] ?? 'Not selected'}',
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
