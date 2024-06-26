import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/env.dart';
import 'package:pdax_flutter_exam/config/themes.dart';
import 'package:pdax_flutter_exam/router/router.dart';

Future<void> main() async {
  //
  // ========================= ENV ========================= //
  await dotenv.load(fileName: Environment.fileName);

  // =============== Run App =============== //
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    // ==================== Variables ==================== //
    final goRouter = ref.watch(goRouteProvider);

    // ==================== Screen ==================== //
    return MaterialApp.router(
      title: "PDAX Flutter Exam",
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(context: context).themeData,
    );
  }
}
