import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menetrend_app/configuration/firebase_options.dart';
import 'package:menetrend_app/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MainApp()
      )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProv),
      theme: ThemeData(
          textTheme: GoogleFonts.manropeTextTheme(Theme.of(context).textTheme),
          useMaterial3: true
          ),
      debugShowCheckedModeBanner: false,
    );
  }
}
