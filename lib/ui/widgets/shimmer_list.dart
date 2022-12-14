import 'package:flutter/material.dart';
import 'package:skybase/ui/widgets/shimmer_item.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({Key? key, this.itemHeight = 60}) : super(key: key);

  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var i = 0; i < 10; i++) ShimmerItem(height: itemHeight),
        ],
      ),
    );
  }
}
