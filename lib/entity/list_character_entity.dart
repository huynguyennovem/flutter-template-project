import 'package:equatable/equatable.dart';
import 'package:flutter_template_project/entity/character_entity.dart';

class ListCharacter extends Equatable {
  final List<Character> characters;

  const ListCharacter({
    required this.characters,
  });

  ListCharacter.empty() : this(characters: []);

  factory ListCharacter.fromJson(List<dynamic> json) {
    return ListCharacter(
      characters: json.map((e) => Character.fromJson(e)).toList(),
    );
  }

  List<dynamic> toJson() {
    return characters.map((e) => e.toJson()).toList();
  }

  @override
  List<Object> get props => [characters];
}
