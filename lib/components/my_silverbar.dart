

import 'package:flutter/material.dart';

class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final double expanded;
  final bool pinned;
  final Widget title;
  const MySilverAppBar(
      {super.key,
      required this.expanded,
      required this.title,
      required this.child,
      required this.pinned,
      required List<DropdownButton<String>> actions});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      expandedHeight: expanded,

      title: title,

      flexibleSpace: FlexibleSpaceBar(
        background: child,
      ),

      // title: title,
      floating: true,
      snap: true,
      pinned: pinned,
    );
  }
}
