import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pvis/themes/theme_provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('SETTINGS', style: TextStyle(fontWeight:FontWeight.bold, ),),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark Mode',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CupertinoSwitch(
                      value: Provider.of<ThemeProvider>(context, listen: false)
                          .isDarkMode,
                      onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
