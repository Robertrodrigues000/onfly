import 'dart:io';

import 'package:equatable/equatable.dart';

class ExpenseEntity extends Equatable {
  final String description;
  final double value;
  final String? locale;
  final File? file;
  final DateTime day;
  final bool? syncronized;

  const ExpenseEntity({
    required this.description,
    this.locale,
    this.file,
    required this.day,
    this.syncronized,
    required this.value,
  });

  @override
  List<Object?> get props => [
        description,
        locale,
        file,
        day,
        syncronized,
        value,
      ];
}
