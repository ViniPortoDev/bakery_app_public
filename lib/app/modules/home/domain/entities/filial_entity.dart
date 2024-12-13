import 'package:equatable/equatable.dart';

class Filial extends Equatable {
  
  final String filial;

  Filial({
    required this.filial,
  });

  @override
  List<Object?> get props => [
    this.filial
  ];

}
