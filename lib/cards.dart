import 'package:flutter/material.dart';

class CardsForFood extends StatelessWidget {
  //const CardsForFood({ Key? key }) : super(key: key);
  final String imagepic;
  final String imagetext;

  CardsForFood({required this.imagepic, required this.imagetext});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        //mainAxisSize: MainAxisSize.values(400),
        children: [
          ListTile(
            title: Text(imagepic),
            subtitle: Text(imagetext),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('LISTEN'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
