import 'package:flutter/material.dart';

import '../cut_corners_border copy.dart';

class TextfieldBorderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            buildText('No Border'),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
            buildText('Underline'),
            TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
            ),
            buildText('Outline Square'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            buildText('Outline Rounded'),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black, width: 3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.green, width: 3),
                ),
              ),
            ),
            buildText('Beveled'),
            TextField(
              decoration: InputDecoration(
                enabledBorder: CutCornersBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3),
                ),
                focusedBorder: CutCornersBorder(
                  borderSide: BorderSide(color: Colors.green, width: 3),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildText(String text) => Container(
        margin: EdgeInsets.fromLTRB(0, 24, 0, 8),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      );
}
