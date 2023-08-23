import 'package:flutter/material.dart';
import 'package:quotes_app/all_quotes.dart';
import 'package:quotes_app/quote_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  deleteFunc(Quote index) {
    setState(() {
      allQuotes.remove(index);
    });
  }

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  addFunc() {
    setState(() {
      allQuotes
          .add(Quote(quote: myController1.text, author: myController2.text));
      myController1.clear();
      myController2.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text(
                      "add quote",
                      style: TextStyle(color: Color.fromARGB(255, 64, 0, 161)),
                    ),
                    scrollable: true,
                    content: Column(
                      children: [
                        TextField(
                          controller: myController1,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "quote",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(75, 64, 0, 161))),
                          maxLength: 150,
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: myController2,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "author",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(75, 64, 0, 161))),
                          maxLength: 25,
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            addFunc();

                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 64, 0, 161)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(22)))),
                          child: const Text('add')),
                      ElevatedButton(
                          onPressed: () {
                            myController1.clear();
                            myController2.clear();
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 64, 0, 161)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(22)))),
                          child: const Text('cancel'))
                    ],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(22))),
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 64, 0, 161),
          title: const Text(
            "Quotes App",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            ...allQuotes
                .map((e) => QuoteCard(
                      deleteFunc: deleteFunc,
                      index: e,
                    ))
                .toList()
          ],
        )),
      ),
    );
  }
}
