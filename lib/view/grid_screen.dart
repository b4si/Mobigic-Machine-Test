import 'package:flutter/material.dart';

class GridScreen extends StatelessWidget {
  final String row;
  final String secondNumber;
  final List wordList;
  const GridScreen(
      {super.key,
      required this.row,
      required this.secondNumber,
      required this.wordList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.builder(
          itemCount: int.parse(row) *
              int.parse(
                secondNumber,
              ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: int.parse(row),
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: Card(
                child: Center(
                  child: Text(
                    wordList[index],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            width: double.infinity,
            height: 60,
            child: TextFormField(),
          );
        },
      ),
    );
  }
}
