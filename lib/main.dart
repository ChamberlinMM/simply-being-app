// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Material(
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: MySliverAppBar(expandedHeight: 200),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) => ListTile(
                    title: Text("Index: $index"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.asset(
          'assets/backgroundcard.jpg',
          fit: BoxFit.cover,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "Simply Being Meg",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              shape: CircleBorder(),
              elevation: 10,
              child: SizedBox(
                height: expandedHeight,
                width: MediaQuery.of(context).size.width / 2,
                child: Container(
                  //width: 100,
                  child: Image.asset(
                    'assets/simplybeinglogo.png',
                    scale: 2.3,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
