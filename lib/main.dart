import 'package:flutter/material.dart';
import 'package:mess_card/loginsystem/login_screen.dart';
import 'package:mess_card/loginsystem/registration_screen.dart';
import 'package:mess_card/loginsystem/welcome_screen.dart';
import 'package:mess_card/messcard/Card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mess_card/SplashScreen.dart';

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
      String user = prefs.getString('user');
      print("i ran atleast once for user");
      print(user);
      String token = prefs.getString('token');
      print("i ran atleast once for token");
      print(token);
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
      initialRoute: SplashScreen.id, //WelcomeScreen.id
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
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
              body: MessCard(
                data: ModalRoute.of(context).settings.arguments,
                isDark: isDark,
              ),
            ),
      },
      title: 'Mess Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: isDark ? Brightness.dark : Brightness.light,
        toggleableActiveColor: isDark ? Colors.red : Colors.blue,
        disabledColor: isDark ? Colors.red : Colors.blue,
      ),
//      darkTheme: ThemeData(
//          brightness: Brightness.dark,
//          accentColor: Colors.red,
//          toggleableActiveColor: Colors.red),
    );
  }
}
