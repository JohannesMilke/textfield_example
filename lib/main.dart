import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textfield_example/widget/textfield_border_widget.dart';
import 'package:textfield_example/widget/textfield_focus_widget.dart';
import 'package:textfield_example/widget/textfield_general_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'TextField';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primaryColor: Colors.red),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: buildPages(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Text('TextField'),
              title: Text('General'),
            ),
            BottomNavigationBarItem(
              icon: Text('TextField'),
              title: Text('Borders'),
            ),
            BottomNavigationBarItem(
              icon: Text('TextField'),
              title: Text('Focus'),
            ),
          ],
          onTap: (int index) => setState(() => this.index = index),
        ),
      );

  Widget buildPages() {
    switch (index) {
      case 0:
        return TextfieldGeneralWidget();
      case 1:
        return TextfieldBorderWidget();
      case 2:
        return TextfieldFocusWidget();
      default:
        return Container();
    }
  }
}
