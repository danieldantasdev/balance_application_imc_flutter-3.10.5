import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _informationText = '';

  void _resetFields() {
    setState(() {
      _weightController.clear();
      _heightController.clear();
      _informationText = "Informe seus dados";
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text) / 100;
      double imc = (weight / (height * height));
      if (imc < 18.6) {
        _informationText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _informationText = "Peso ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _informationText =
            "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _informationText = "Obesidade grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _informationText = "Obesidade grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 39.9 && imc < 40) {
        _informationText = "Obesidade grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imc'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(onPressed: _resetFields, icon: const Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.person_outline,
                  size: 120,
                  color: Colors.green,
                ),
                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Peso (Kg)',
                      labelStyle: TextStyle(
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.green,
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.green,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey,
                      ))),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Altura (cm)',
                      labelStyle: TextStyle(
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.green,
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.green,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey,
                      ))),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(10.0),
                  ),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _informationText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.green, fontSize: 20),
                ),
              ]),
        ),
      ),
    );
  }
}
