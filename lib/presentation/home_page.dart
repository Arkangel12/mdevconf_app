import 'package:flutter/material.dart';
import 'package:mdevconf_app/presentation/providers/data_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('mDevConf')),
      body: Consumer<DataProvider>(
        builder: (_, snapshot, __) {
          if (snapshot.episodesPage == null) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.errorMessage != null) {
            return Center(child: Text(snapshot.errorMessage));
          }

          if (snapshot.episodes.isEmpty) {
            return Center(child: Text('Vacio'));
          }

          final result = snapshot.episodes;

          return ListView.builder(
            itemCount: result.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(result[index].name),
                subtitle: Text(result[index].airDate),
                trailing: Text('Characters ${result[index].characters.length}'),
              );
            },
          );
        },
      ),
    );
  }
}
