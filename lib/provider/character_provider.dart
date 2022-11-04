import 'package:flutter/cupertino.dart';

import '../entity/character_entity.dart';
import '../entity/list_character_entity.dart';

class CharacterProvider extends ChangeNotifier {
    ListCharacter _characters = ListCharacter.empty();
    ListCharacter get characters => _characters;

    void addCharacter({required Character character}) {
        _characters.characters.add(character);
        notifyListeners();
    }

    void addAllCharacters({required Set<Character> characters}) {
        _characters.characters.clear();
        _characters.characters.addAll(characters);
        notifyListeners();
    }
}