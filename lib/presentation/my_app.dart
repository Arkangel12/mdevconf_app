import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mdevconf_app/presentation/home_page.dart';
import 'package:mdevconf_app/presentation/providers/data_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<DataProvider>()..getEpisodes(),
      child: MaterialApp(
        title: 'Flutter Is Awesome',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}