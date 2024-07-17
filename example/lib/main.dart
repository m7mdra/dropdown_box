import 'package:dropdown_box/dropdown_box.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown box',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('Dropdown box example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your preferred drink of choice: ',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Size: Max extent',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            DropdownBox<String>(
              key: ValueKey('widget101'),
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                });
              },
              maxExtent: true,
              placeholder: 'Select a drink',
              options: [
                DropdownBoxItem(
                    label: 'Orange', subtitle: '10 Kcal', value: 'Orange'),
                DropdownBoxItem(
                    label: 'Apple', subtitle: '15 Kcal', value: 'Apple'),
                DropdownBoxItem(
                    label: 'Lime & mint',
                    subtitle: '28 Kcal',
                    value: 'Lime & mint'),
                DropdownBoxItem(
                    label: 'Avocado & Honey',
                    subtitle: '120 Kcal',
                    value: 'Avocado & Honey'),
                DropdownBoxItem(
                    label: 'Grape & Pomegranate',
                    subtitle: '75 Kcal',
                    value: 'Grape & Pomegranate'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
