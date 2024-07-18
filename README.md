# Dropdown Box

Dropdown Box is a Flutter package that provides a customizable dropdown widget with an animated arrow and a configurable popup menu. It simplifies the implementation of dropdown functionalities in your Flutter applications.


https://github.com/user-attachments/assets/39e3aaf7-2a20-4827-bc38-c9c9d7c1e80f


## Features

- **Customizable Dropdown Box**: Configure text style, background color, border radius, and padding of the dropdown box.
- **Animated Arrow**: Animated arrow icon indicates the dropdown state.
- **Popup Menu Configuration**: Customize the appearance of the popup menu including shape, background color, elevation, and text styles.
- **Easy Integration**: Simple API for integrating dropdown functionality with customizable options.

## Getting started

To use this package, add `dropdown_box` as a dependency in your `pubspec.yaml` file.

```yaml  
dependencies:  
  dropdown_box: ^0.0.1
```  
## Usage
For detailed instructions on how to use the package, refer to the [example](example) provided.

```dart  
import 'package:flutter/material.dart';
import 'package:dropdown_box/dropdown_box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Dropdown Box Example')),
        body: Center(
          child: DropdownBox<int>(
            options: [
              DropdownBoxItem(label: 'Option 1', value: 1),
              DropdownBoxItem(label: 'Option 2', value: 2),
              DropdownBoxItem(
                  label: 'Option 3',
                  value: 3,
                  subtitle: 'Subtitle for Option 3'),
            ],
            placeholder: 'Select an option',
            onChanged: (value) {
              print('Selected value: $value');
            },
            boxConfig: BoxConfig(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxTextStyle: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            menuConfig: MenuConfig(
              color: Colors.white,
              elevation: 4,
              titleTextStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              subtitleTextStyle: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}

```  

## Additional information

* Documentation: TODO
* Issues: Please file any issues, bugs, or feature requests at GitHub issues.
* Contributing: Contributions are welcome! Fork the repository and submit pull requests.
* Authors: [m7mdra](https://github.com/m7mdra/)
* License: This project is licensed under the [Apache 2.0](LICENSE)
