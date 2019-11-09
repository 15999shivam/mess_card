import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'welcome_screen.dart';
import 'Card.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  SharedPreferences prefs;

  void load() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      isDark = prefs.getString('isDark') == 'true';
    });
  }

  void change() async {
    await prefs.setString('isDark', isDark.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

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
                        change();
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
        MessCard.id: (context) => Scaffold(
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
            body: MessCard()),
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
