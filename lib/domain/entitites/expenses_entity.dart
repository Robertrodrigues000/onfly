import 'package:equatable/equatable.dart';

class ExpensesEntity extends Equatable {
  final String description;
  final String value;
  final String? locale;
  final String? file;
  final String day;
  final bool? syncronized;

  const ExpensesEntity({
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
