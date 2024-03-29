import 'dart:convert';

class Name {
  final int nameId;
  final String name;
  final String desc;
  final String gender;
  final int positive_votes;
  final int negative_votes;
  Name({
    required this.nameId,
    required this.name,
    required this.desc,
    required this.gender,
    required this.positive_votes,
    required this.negative_votes,
  });

  Name copyWith({
    int? nameId,
    String? name,
    String? desc,
    String? gender,
    int? positive_votes,
    int? negative_votes,
  }) {
    return Name(
      nameId: nameId ?? this.nameId,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      gender: gender ?? this.gender,
      positive_votes: positive_votes ?? this.positive_votes,
      negative_votes: negative_votes ?? this.negative_votes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameId': nameId,
      'name': name,
      'desc': desc,
      'gender': gender,
      'positive_votes': positive_votes,
      'negative_votes': negative_votes,
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      nameId: map['nameId'].toInt() as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      gender: map['gender'] as String,
      positive_votes: map['positive_votes'].toInt() as int,
      negative_votes: map['negative_votes'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Name.fromJson(String source) => Name.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Name(nameId: $nameId, name: $name, desc: $desc, gender: $gender, positive_votes: $positive_votes, negative_votes: $negative_votes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Name &&
      other.nameId == nameId &&
      other.name == name &&
      other.desc == desc &&
      other.gender == gender &&
      other.positive_votes == positive_votes &&
      other.negative_votes == negative_votes;
  }

  @override
  int get hashCode {
    return nameId.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      gender.hashCode ^
      positive_votes.hashCode ^
      negative_votes.hashCode;
  }
}