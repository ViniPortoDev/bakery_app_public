import '../../domain/entities/filial_entity.dart';

class FilialDTO extends Filial {
  FilialDTO({required String filial}) : super(filial: filial);

  factory FilialDTO.fromMap(Map<String, dynamic> json) {
    return FilialDTO(filial: json['FILIAL'],);
  }

   Map<String, dynamic> toMap() {
    
    return {
      'FILIAL': this.filial,
    };
  }

}