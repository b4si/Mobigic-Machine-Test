// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobigic_test/view/add_alphabet_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
                controller: firstNumberController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: 'Enter a number',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal.shade500,
                    ),
                  ),
                  fillColor: Colors.white60,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: secondNumberController,
                decoration: InputDecoration(
                  hintText: 'Enter a number',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal.shade500,
                    ),
                  ),
                  fillColor: Colors.white60,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                height: size.height * 0.08,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddAlphabetScreen(
                            row: firstNumberController.text,
                            secondNumber: secondNumberController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
