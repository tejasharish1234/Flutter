import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
      title: 'BMI Calculator',
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  Color? color1;
  double? bmi;
  void _computeBmi() {
    if (_weightController.text.isEmpty || _heightController.text.isEmpty) {
      setState(() {
        bmi = null;
      });
      return;
    }

    final weight = double.tryParse(_weightController.text);
    final height = double.tryParse(_heightController.text);

    if (weight == null || height == null) {
      setState(() {
        bmi = null;
      });
      return;
    }

    final bmiValue = weight / ((height / 100) * (height / 100));
    String text = '';
    setState(() {
      bmi = double.parse(bmiValue.toStringAsPrecision(4));
      if (bmiValue <= 18.5) {
        color1 = const Color.fromARGB(255, 255, 17, 0);
        text = "Underweight";
      } else if (bmiValue >= 18.5 && bmiValue < 25) {
        color1 = const Color.fromARGB(255, 0, 0, 0);
        text = 'Normal BMI';
      } else if (bmiValue >= 25 && bmiValue < 30) {
        color1 = const Color.fromARGB(255, 255, 85, 0);
        text = 'Moderately Overweight';
      } else if (bmiValue >= 30) {
        color1 = const Color.fromARGB(255, 251, 17, 0);
        text = 'Obese';
      }
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DetailScreen(bmi: bmi, color1: color1, text1: text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 152, 23),
      appBar: AppBar(
          title: const Text("BMI"),
          backgroundColor: const Color.fromARGB(255, 200, 152, 23)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 130,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 137, 99, 12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter Weight (in kg)',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 180,
                    color: const Color.fromARGB(60, 255, 255, 255),
                    child: TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration:
                            const InputDecoration(hintText: "Enter Weight")),
                  ),
                ],
              ), // Add your content for the first container here
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 130,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 137, 99, 12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter Height (in cm)',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 180,
                    color: const Color.fromARGB(60, 255, 255, 255),
                    child: TextField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration:
                            const InputDecoration(hintText: "Enter Height")),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => {_computeBmi()},
              child: Text(
                "Compute",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 81, 45, 6))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final double? bmi;
  final Color? color1;
  final String text1;
  const DetailScreen(
      {super.key,
      required this.bmi,
      required this.color1,
      required this.text1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 152, 23),
      appBar: AppBar(
          title: const Text('BMI Value'),
          backgroundColor: const Color.fromARGB(255, 200, 152, 23)),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Your BMI is \n$bmi",
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, color: color1)),
        Text(text1,
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, color: color1))
      ])),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {Navigator.pop(context)},
          child: const Icon(Icons.arrow_back)),
    );
  }
}
