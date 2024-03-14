import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Giải Phương Trình Bậc 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuadraticSolver(),
    );
  }
}

class QuadraticSolver extends StatefulWidget {
  const QuadraticSolver({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuadraticSolverState createState() => _QuadraticSolverState();
}

class _QuadraticSolverState extends State<QuadraticSolver> {
  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();
  TextEditingController cController = TextEditingController();
  String result = '';

  void solveQuadratic() {
    double a = double.tryParse(aController.text) ?? 0;
    double b = double.tryParse(bController.text) ?? 0;
    double c = double.tryParse(cController.text) ?? 0;

    double delta = b * b - 4 * a * c;
    double x1, x2;

    if (delta > 0) {
      x1 = (-b + math.sqrt(delta)) / (2 * a);
      x2 = (-b - math.sqrt(delta)) / (2 * a);
      setState(() {
        result = 'Nghiệm của phương trình là: x1 = $x1, x2 = $x2';
      });
    } else if (delta == 0) {
      x1 = x2 = -b / (2 * a);
      setState(() {
        result = 'Nghiệm kép của phương trình là: x1 = x2 = $x1';
      });
    } else {
      setState(() {
        result = 'Phương trình vô nghiệm';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Màu nền xanh dương
        title: const Text(
          'Giải Phương Trình Bậc 2',
          style: TextStyle(color: Colors.white), // Chữ màu trắng
        ),
        centerTitle: true, // Chữ nằm giữa
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: aController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nhập hệ số a',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0), // Border 1px màu gray
                ),
              ),
            ),
            const SizedBox(height: 10.0), // Khoảng cách giữa các ô nhập liệu
            TextField(
              controller: bController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nhập hệ số b',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0), // Border 1px màu gray
                ),
              ),
            ),
            const SizedBox(height: 10.0), // Khoảng cách giữa các ô nhập liệu
            TextField(
              controller: cController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nhập hệ số c',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0), // Border 1px màu gray
                ),
              ),
            ),
            const SizedBox(height: 20.0), // Khoảng cách giữa ô nhập liệu và nút "Giải"
            ElevatedButton(
              onPressed: solveQuadratic,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Chữ màu trắng
                minimumSize: const Size(double.infinity, 60),
              ),
              child: const Text('Giải'),
            ),
            const SizedBox(height: 20.0), // Khoảng cách giữa nút "Giải" và kết quả
            Text(
              result,
              style: const TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}