import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GenderPredictionView extends StatefulWidget {
  const GenderPredictionView({super.key});

  @override
  _GenderPredictionViewState createState() => _GenderPredictionViewState();
}

class _GenderPredictionViewState extends State<GenderPredictionView> {
  final TextEditingController nameController = TextEditingController();
  String gender = '';
  Color resultColor = Colors.transparent;
  String imagePath = '';

  void predictGender(String name) async {
    final response =
        await http.get(Uri.parse('https://api.genderize.io/?name=$name'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        gender = data['gender'] ?? 'unknown';
        if (gender == 'male') {
          resultColor = Colors.blue;
          imagePath = 'assets/images/male.png';
        } else if (gender == 'female') {
          resultColor = Colors.pink;
          imagePath = 'assets/images/female.png';
        } else {
          resultColor = Colors.grey;
          imagePath = 'assets/images/sex.png';
        }
      });
    } else {
      setState(() {
        gender = 'Error';
        resultColor = Colors.red;
        imagePath = 'assets/images/sex.png';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Predicción de género'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Introduzca un nombre: ',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                predictGender(name);
              },
              child: const Text('Predecir género'),
            ),
            const SizedBox(height: 20),
            if (imagePath.isNotEmpty)
              Image.asset(
                imagePath,
                height: 150,
              ),
            const SizedBox(height: 20),
            Text(
              'Género predicho: $gender',
              style: TextStyle(
                color: resultColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}