import 'dart:io';

import 'package:equatable/equatable.dart';

class ExpenseEntity extends Equatable {
  final String? id;
  final String description;
  final double amount;
  final String? locale;
  final File? file;
  final DateTime day;
  final bool? syncronized;

  const ExpenseEntity({
    this.id,
    required this.description,
    this.locale,
    this.file,
    required this.day,
    this.syncronized,
    required this.amount,
  });

  ExpenseEntity copyWith({
    String? id,
    String? description,
    double? amount,
    String? locale,
    File? file,
    DateTime? day,
    bool? syncronized,
  }) {
    return ExpenseEntity(
      description: description ?? this.description,
      day: day ?? this.day,
      amount: amount ?? this.amount,
      id: id ?? this.id,
      locale: locale ?? this.locale,
      file: file ?? this.file,
      syncronized: syncronized ?? this.syncronized,
    );
  }

  @override
  List<Object?> get props => [
        id,
        description,
        locale,
        file,
        day,
        syncronized,
        amount,
      ];
}
