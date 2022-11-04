import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/api_service.dart';
import '../di/di.dart';
import '../provider/character_provider.dart';

class CharacterListWidget extends StatefulWidget {
  const CharacterListWidget({Key? key}) : super(key: key);

  @override
  State<CharacterListWidget> createState() => _CharacterListWidgetState();
}

class _CharacterListWidgetState extends State<CharacterListWidget> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final characters = (await getIt.get<ApiService>().getCharacters()).getOrElse(() => {});
      if (mounted) {
        context.read<CharacterProvider>().addAllCharacters(characters: characters);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character list'),
      ),
      body: Consumer<CharacterProvider>(
        builder: (context, value, child) {
          final data = value.characters.characters;
          debugPrint('Fetched data: ${data.length}');
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index].name ?? 'No name'),
                    subtitle: Text(data[index].url ?? 'No url'),
                  );
                },
                itemCount: data.length),
          );
        },
      ),
    );
  }
}
