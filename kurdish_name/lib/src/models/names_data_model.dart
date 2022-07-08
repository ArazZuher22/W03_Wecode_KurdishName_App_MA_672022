import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'name.dart';

class KurdishNames {
  final List<Name> names;
  final int recordCount;
  KurdishNames({
    required this.names,
    required this.recordCount,
  });

  KurdishNames copyWith({
    List<Name>? names,
    int? recordCount,
  }) {
    return KurdishNames(
      names: names ?? this.names,
      recordCount: recordCount ?? this.recordCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'names': names.map((x) => x.toMap()).toList(),
      'recordCount': recordCount,
    };
  }

  factory KurdishNames.fromMap(Map<String, dynamic> map) {
    return KurdishNames(
      names: List<Name>.from((map['names'] as List<dynamic>).map<Name>((x) => Name.fromMap(x as Map<String,dynamic>),),),
      recordCount: map['recordCount'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory KurdishNames.fromJson(String source) => KurdishNames.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Kurdish(names: $names, recordCount: $recordCount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is KurdishNames &&
      listEquals(other.names, names) &&
      other.recordCount == recordCount;
  }

  @override
  int get hashCode => names.hashCode ^ recordCount.hashCode;
}