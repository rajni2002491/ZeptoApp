import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/%20theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/splash_screen.dart';
import 'auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/crypto_list_screen.dart';
//import 'providers/theme_provider.dart'; // 👈 Add this

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}
//working cheked
class MyApp extends ConsumerWidget {
  const MyApp({super.key}); // 👈 Change to ConsumerWidget

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider); // 👈 Watch theme mode

    return MaterialApp(
      title: 'ZyptoPulse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // 👈 Light theme
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1B232A),
      ),
      themeMode: themeMode, // 👈 Controlled by Riverpod
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(builder: (_) => const SplashScreen());
          case "/login":
            return MaterialPageRoute(builder: (_) => const AuthScreen());
          case "/home":
            return MaterialPageRoute(builder: (_) => const HomeScreen());
          case "/crypto":
            return MaterialPageRoute(builder: (_) => const CryptoListScreen());
          default:
            return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
      },
    );
  }
}
