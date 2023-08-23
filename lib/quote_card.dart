import 'package:flutter/material.dart';
import 'package:quotes_app/all_quotes.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key, required this.deleteFunc, required this.index});

  final Function deleteFunc;
  final Quote index;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.error,
            borderRadius: BorderRadius.circular(22)),
        child: const Center(
          child: Text(
            "delete",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            content: const Text("Are you sure you want to delete the quote?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 64, 0, 161)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)))),
                  child: const Text('Yes')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 64, 0, 161)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)))),
                  child: const Text('No'))
            ],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(22))),
          ),
        );
      },
      onDismissed: (direction) {
        deleteFunc(index);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        color: const Color.fromARGB(255, 64, 0, 161),
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                index.quote,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(index.author,
                      style: const TextStyle(color: Colors.white))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
