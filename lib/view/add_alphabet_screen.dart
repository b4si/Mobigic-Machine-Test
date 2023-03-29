// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mobigic_test/view/grid_screen.dart';

class AddAlphabetScreen extends StatelessWidget {
  final String row;
  final String secondNumber;
  AddAlphabetScreen({
    super.key,
    required this.row,
    required this.secondNumber,
  });

  TextEditingController wordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List convertToList(String word) {
    final List<dynamic> alphabetList = word.split('');
    return alphabetList;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter ${int.parse(row) * int.parse(secondNumber)} alphabets';
                  }
                  return null;
                },
                controller: wordController,
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
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: double.infinity,
              height: size.height * 0.08,
              child: ElevatedButton(
                onPressed: () {
                  int temp = int.parse(row) * int.parse(secondNumber);
                  if (_formKey.currentState!.validate()) {
                    // ignore: unrelated_type_equality_checks
                    if (wordController.text.length == temp) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GridScreen(
                          row: row,
                          secondNumber: secondNumber,
                          wordList: convertToList(wordController.text),
                        ),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.red.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(15.0),
                          elevation: 6.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          content: Text('Enter $temp alphabets'),
                        ),
                      );
                    }
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
    );
  }
}
