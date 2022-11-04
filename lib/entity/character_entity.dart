import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String? name;
  final String? url;

  const Character({
    this.name,
    this.url,
  });

  factory Character.fromJson(dynamic json) => Character(name: json['name'], url: json['url']);

  Character copyWith({
    String? name,
    String? url,
  }) =>
      Character(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }

  @override
  List<Object?> get props => [name, url];
}
