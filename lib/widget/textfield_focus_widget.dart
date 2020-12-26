import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:textfield_example/widget/button_widget.dart';

class TextfieldFocusWidget extends StatefulWidget {
  @override
  _TextfieldFocusWidgetState createState() => _TextfieldFocusWidgetState();
}

class _TextfieldFocusWidgetState extends State<TextfieldFocusWidget> {
  bool isEnabled = true;
  final node1 = FocusNode();
  final node2 = FocusNode();

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        gestures: [
          GestureType.onVerticalDragDown,
          GestureType.onTap,
        ],
        child: GestureDetector(
          //onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(32),
              children: [
                TextField(
                  focusNode: node1,
                  decoration: InputDecoration(
                    labelText: 'TextField 1',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {},
                    ),
                  ),
                  enabled: isEnabled,
                  readOnly: !isEnabled,
                ),
                const SizedBox(height: 24),
                TextField(
                  focusNode: node2,
                  decoration: InputDecoration(
                    labelText: 'TextField 2',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 48),
                ButtonWidget(
                    text: 'Unfocus TextFields',
                    onClicked: () =>
                        FocusScope.of(context).requestFocus(FocusNode())),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Focus TextField1',
                  onClicked: () => FocusScope.of(context).requestFocus(node1),
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Focus TextField2',
                  onClicked: () => FocusScope.of(context).requestFocus(node2),
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Toggle TextField1',
                  onClicked: () => setState(() => isEnabled = !isEnabled),
                ),
              ],
            ),
          ),
        ),
      );
}
