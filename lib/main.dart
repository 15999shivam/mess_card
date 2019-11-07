import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'welcome_screen.dart';
import 'Card.dart' as Card;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Entry();
  }
}

class Entry extends StatefulWidget {
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => Scaffold(
            appBar: AppBar(
              title: Text('Mess Card'),
              centerTitle: true,
              actions: <Widget>[
                Switch(
                    value: isDark,
                    onChanged: (val) {
                      setState(() {
                        isDark = !isDark;
                      });
                    }),
              ],
            ),
            body: WelcomeScreen(
              isDark: isDark,
            )),
        LoginScreen.id: (context) => Scaffold(
            appBar: AppBar(
              title: Text('Mess Card'),
              centerTitle: true,
              actions: <Widget>[
                Switch(
                    value: isDark,
                    onChanged: (val) {
                      setState(() {
                        isDark = !isDark;
                      });
                    }),
              ],
            ),
            body: LoginScreen()),
        RegistrationScreen.id: (context) => Scaffold(
            appBar: AppBar(
              title: Text('Mess Card'),
              centerTitle: true,
              actions: <Widget>[
                Switch(
                    value: isDark,
                    onChanged: (val) {
                      setState(() {
                        isDark = !isDark;
                      });
                    }),
              ],
            ),
            body: RegistrationScreen()),
        Card.Card.id: (context) => Scaffold(
            appBar: AppBar(
              title: Text('Mess Card'),
              centerTitle: true,
              actions: <Widget>[
                Switch(
                    value: isDark,
                    onChanged: (val) {
                      setState(() {
                        isDark = !isDark;
                      });
                    }),
              ],
            ),
            body: Card.Card()),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: isDark ? Brightness.dark : Brightness.light,
          toggleableActiveColor: isDark ? Colors.red : Colors.blue),
//      darkTheme: ThemeData(
//          brightness: Brightness.dark,
//          accentColor: Colors.red,
//          toggleableActiveColor: Colors.red),
    );
  }
}
