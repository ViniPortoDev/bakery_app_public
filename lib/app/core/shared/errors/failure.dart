import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  final String errorMessage;

  Failure({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [
    this.errorMessage,
  ];
}
