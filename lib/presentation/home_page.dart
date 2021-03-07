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
          if (snapshot.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.errorMessage != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(snapshot.errorMessage!),
              ),
            );
          }

          final result = snapshot.episodes;

          if (snapshot.episodes!.isEmpty) {
            return Center(child: Text('Vacio'));
          }

          return ListView.builder(
            itemCount: result!.length,
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
