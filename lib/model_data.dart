import 'package:equatable/equatable.dart';

// class Crypto {
//   final String name;
//   final double price;

//   Crypto({required this.name, required this.price});

//   factory Crypto.fromJson(Map<String, dynamic> json) {
//     return Crypto(
//       name: json['name'],
//       price: json['price'],
//     );
//   }
// }

class Data extends Equatable {
  final String name;
  final String namedata;

  const Data({
    required this.name,
    required this.namedata,
  });
  Data copyWith({
    String? name,
    String? namedata,
  }) {
    return Data(
      name: name ?? this.name,
      namedata: namedata ?? this.namedata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'namedata': namedata,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      name: map['name'] ?? '',
      namedata: map['namedata'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        name,
        namedata,
      ];
}
