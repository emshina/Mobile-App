import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pvis/components/autoscroll.dart';

import 'package:pvis/pages/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text('HOME',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // color: Theme.of(context).colorScheme.inversePrimary,
              )),
          // backgroundColor: Theme.of(context).colorScheme.background,
        ),
        drawer: const MyDrawer(),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Wrap(children: [
                  Container(
                      padding: EdgeInsets.all(0),
                      child: const Text(
                          'Remember to handle this modification carefully, as it involves changingt harder to update them in the future.'))
                ]),
                const SizedBox(
                  height: 10,
                ),
                const ScrollCont(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  color: Theme.of(context).colorScheme.primary,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
