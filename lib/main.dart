import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/controller/text_editor_controller.dart';
import 'package:text_editor/views/home_screen.dart';

void main() {
  runApp(const TextEditor());
}

class TextEditor extends StatelessWidget {
  const TextEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TextController())],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.green, elevation: 0),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
