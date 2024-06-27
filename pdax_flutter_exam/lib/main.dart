import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdax_flutter_exam/config/env.dart';
import 'package:pdax_flutter_exam/config/providers/dimension_provider/dimension_provider.dart';
import 'package:pdax_flutter_exam/config/themes.dart';
import 'package:pdax_flutter_exam/router/router.dart';
import 'package:pdax_flutter_exam/config/dimensions.dart' as dimensions;

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

    final screenSize = MediaQuery.of(context).size;

    // To determine the device screen size and set the state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (screenSize.width < dimensions.dimensionMobile) {
        ref.read(dimensionControllerProvider.notifier).isMobile();
      } else {
        ref.read(dimensionControllerProvider.notifier).isDesktop();
      }
    });

    // ==================== Screen ==================== //
    return MaterialApp.router(
      title: "PDAX Flutter Exam",
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(context: context).themeData,
    );
  }
}
