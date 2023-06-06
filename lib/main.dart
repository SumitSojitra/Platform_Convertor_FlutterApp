import 'package:flutter/cupertino.dart';
import 'package:platform_convertor/providers/platform_providers.dart';
import 'package:platform_convertor/views/screens/android.dart';
import 'package:platform_convertor/views/screens/ios.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Platform_Provider(),
          )
        ],
        builder: (context, _) => (Provider.of<Platform_Provider>(context).switc)
            ? CupertinoApp(
                debugShowCheckedModeBanner: false,
                home: iphone(),
              )
            : MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  useMaterial3: true,
                  colorScheme: ColorScheme.light(
                      primary: Colors.blueAccent, secondary: Colors.grey),
                ),
                darkTheme: ThemeData(
                  useMaterial3: true,
                  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
                  colorScheme: const ColorScheme.dark(
                    brightness: Brightness.dark,
                  ),
                ),
                themeMode: (Provider.of<Platform_Provider>(context).theme)
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: android(),
              )),
  );
}
