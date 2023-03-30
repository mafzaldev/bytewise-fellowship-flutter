import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChangerProvider = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dark Theme Screen'),
        ),
        body: Column(
          children: [
            RadioListTile(
                title: const Text("Light Theme"),
                value: ThemeMode.light,
                groupValue: themeChangerProvider.themeMode,
                onChanged: themeChangerProvider.toggleTheme),
            RadioListTile(
                title: const Text("Dark Theme"),
                value: ThemeMode.dark,
                groupValue: themeChangerProvider.themeMode,
                onChanged: themeChangerProvider.toggleTheme),
            RadioListTile(
                title: const Text("System Theme"),
                value: ThemeMode.system,
                groupValue: themeChangerProvider.themeMode,
                onChanged: themeChangerProvider.toggleTheme)
          ],
        ));
  }
}
