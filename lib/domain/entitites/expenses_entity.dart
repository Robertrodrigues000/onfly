import 'dart:io';

import 'package:equatable/equatable.dart';

class ExpenseEntity extends Equatable {
  final String? id;
  final String description;
  final double amount;
  final String? latitude;
  final String? longitude;
  final File? file;
  final DateTime day;
  final bool? syncronized;

  const ExpenseEntity({
    this.id,
    required this.description,
    this.latitude,
    this.longitude,
    this.file,
    required this.day,
    this.syncronized,
    required this.amount,
  });

  ExpenseEntity copyWith({
    String? id,
    String? description,
    double? amount,
    String? latitude,
    String? longitude,
    File? file,
    DateTime? day,
    bool? syncronized,
  }) {
    return ExpenseEntity(
      description: description ?? this.description,
      day: day ?? this.day,
      amount: amount ?? this.amount,
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      file: file ?? this.file,
      syncronized: syncronized ?? this.syncronized,
    );
  }

  @override
  List<Object?> get props => [
        id,
        description,
        latitude,
        longitude,
        file,
        day,
        syncronized,
        amount,
      ];
}
