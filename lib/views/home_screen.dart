import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/constants/color_pallet.dart';
import 'package:text_editor/constants/lists.dart';
import 'package:text_editor/controller/text_editor_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<TextController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Text Editor",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child:
                    Consumer<TextController>(builder: (context, provider, _) {
                  return Text(
                    provider.inputText == ""
                        ? "Hello Everyone"
                        : provider.inputText,
                    style: TextStyle(
                      fontSize: provider.fontsize.toDouble(),
                      fontFamily: provider.fontfamily,
                      color: provider.selectColor,
                    ),
                  );
                }),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      changeableFonts.length,
                      (index) => GestureDetector(
                        onTap: () {
                          controller.fontfamily = changeableFonts[index];
                          controller.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            changeableFonts[index],
                            style: TextStyle(
                              fontFamily: changeableFonts[index],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      changeableColor.length,
                      (index) => GestureDetector(
                        onTap: () {
                          controller.selectColor = changeableColor[index];
                          controller.notifyListeners();
                        },
                        child: Container(
                          child: CircleAvatar(
                            backgroundColor: changeableColor[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Consumer<TextController>(builder: (context, provider, _) {
                    return Slider(
                      min: 15,
                      max: 50,
                      value: provider.fontsize.toDouble(),
                      onChanged: (value) {
                        controller.fontsize = value.toInt();
                        controller.notifyListeners();
                      },
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Type Here",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      controller.inputText = value.toString();
                      controller.notifyListeners();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
