import 'package:equatable/equatable.dart';
import '../../modules/home/domain/entities/filial_entity.dart';

class User extends Equatable {

  final String matricula;
  final String usuario;
  final String version;
  final List<Filial> filiais;

  User({
    required this.matricula,
    required this.usuario,
    required this.version,
    required this.filiais,
  });

  @override
  List<Object?> get props => [
    this.matricula,
    this.usuario,
    this.version,
    this.filiais
  ];
}
