import 'user_entity.dart';
import '../../modules/home/infra/dtos/filial_dto.dart';

class UserDTO extends User {
  UserDTO(
      {required String matricula,
      required String usuario,
      required String version,
      required List<FilialDTO> filiais})
      : super(
          matricula: matricula,
          usuario: usuario,
          version: version,
          filiais: filiais,
        );

  factory UserDTO.fromMap(Map<String, dynamic> json) {
    return UserDTO(
      matricula: json['matricula'],
      usuario: json['usuario'],
      version: json['version'],
      filiais: json['filiais'] is List
          ? (json['filiais'] as List)
              .map((filial) => FilialDTO.fromMap(filial))
              .toList()
          : [FilialDTO.fromMap(json['filiais'])],
    );
  }

  Map<String, dynamic> toMap() {
    var filiaisObj = this.filiais as List<FilialDTO>;
    return {
      'matricula': this.matricula,
      'usuario': this.usuario,
      'version': this.version,
      'filiais': filiaisObj.map((obj) => obj.toMap()).toList(),
    };
  }
}
