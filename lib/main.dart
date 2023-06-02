import 'package:admin_fe/provider/index.dart';
import 'package:admin_fe/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp(sharedPreferences: sharedPreferences)));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.sharedPreferences});

  final SharedPreferences sharedPreferences;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RegisterationProvider>(
            create: (_) => RegisterationProvider()),
        ChangeNotifierProvider<AuthProvider>(
            create: (_) =>
                AuthProvider(sharedPreferences: widget.sharedPreferences)),
      ],
      child: const MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  State<MyMaterialApp> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  @override
  Widget build(BuildContext context) {
    final authConsumer = useAuthProvider(context);
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'fieldwork',
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Admin App',
        initialRoute: Routes.indexPage,
        routes: authConsumer.isAuthenticated()
            ? Routes.authenticatedRoutes()
            : Routes.unauthenticatedRoutes());
  }
}
