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
