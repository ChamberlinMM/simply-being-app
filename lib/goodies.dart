import 'dart:html';

import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'dart:math';

class GoodiesSlider extends StatefulWidget {
  @override
  _GoodiesSliderState createState() => _GoodiesSliderState();
}

class _GoodiesSliderState extends State<GoodiesSlider> {
  List<int> data = [];
  int _focusedIndex = 0;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 15; i++) {
      data.add(Random().nextInt(100) + 1);
    }
  }

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  Widget _buildItemDetail() {
    if (data.length > _focusedIndex) {
      return Container(
          height: 150,
          child: Text('index $_focusedIndex: ${data[_focusedIndex]}'));
    }
    return Container(
      height: 150,
      child: Text('No Data'),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Container(
      width: 35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: data[index].toDouble() * 2,
            width: 25,
            color: Colors.lightBlueAccent,
            child: Text('i:$index\n${data[index]}'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: ScrollSnapList(
                onItemFocus: _onItemFocus,
                itemSize: 35,
                itemBuilder: _buildListItem,
                itemCount: data.length,
                reverse: true,
              ),
            ),
            _buildItemDetail(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      data.add(Random().nextInt(100) + 1);
                    });
                  },
                  child: Text('Add Item'),
                ),
                ElevatedButton(
                  onPressed: () {
                    int index =
                        data.length > 1 ? Random().nextInt(data.length - 1) : 0;
                    setState(() {
                      data.removeAt(index);
                    });
                  },
                  child: Text('Remove Item'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
