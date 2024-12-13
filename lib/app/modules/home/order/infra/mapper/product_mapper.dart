import 'package:padaria/app/core/shared/mapper/mapper.dart';
import 'package:padaria/app/modules/home/domain/entities/product_entity.dart';
import 'package:padaria/app/modules/home/infra/dtos/product_dto.dart';

class ProductMapper implements Mapper<ProductDTO, Product> {
  @override
  Product from({required ProductDTO dto}) {
    return Product(
      cODPROD: dto.cODPROD,
      cODMARCA: dto.cODMARCA,
      cODFILIAL: dto.cODFILIAL,
      qTDSUGERIDA: dto.qTDSUGERIDA,
      dIASEXTRAS: dto.dIASEXTRAS,
      dIASOFERTAS: dto.dIASOFERTAS,
      qTRESERV: dto.qTRESERV,
      eSTMIN: dto.eSTMIN,
      eSTMAX: dto.eSTMAX,
      qTESTGER: dto.qTESTGER,
      cODEPTO: dto.cODEPTO,
      dESCRICAO: dto.dESCRICAO,
      eMBALAGEM: dto.eMBALAGEM,
      cODSEC: dto.cODSEC,
      cODCATEGORIA: dto.cODCATEGORIA,
      uNIDADE: dto.uNIDADE,
      pESOLIQ: dto.pESOLIQ,
      cUSTOFIN: dto.cUSTOFIN,
      cUSTOREAL: dto.cUSTOREAL,
      cUSTOCONT: dto.cUSTOCONT,
      cUSTOREP: dto.cUSTOREP,
      vALORULTENT: dto.vALORULTENT,
      qTUNITCX: dto.qTUNITCX,
      cODICMTAB: dto.cODICMTAB,
      tRIBUTACAO: dto.tRIBUTACAO,
      cODST: dto.cODST,
      qTDESTORIG: dto.qTDESTORIG,
      qTDESTDEST: dto.qTDESTDEST,
      qTGIRODIA: dto.qTGIRODIA,
      cODPRODEM: dto.cODPRODEM,
      cODAUXILIAR: dto.cODAUXILIAR,
      iNDUSTRIAORIGEM: dto.iNDUSTRIAORIGEM,
      mULTIPLOPADARIA: dto.mULTIPLOPADARIA,
    );
  }

  @override
  ProductDTO to({required Product entity}) {
    return ProductDTO(
        cODPROD: entity.cODPROD,
        cODMARCA: entity.cODMARCA,
        cODFILIAL: entity.cODFILIAL,
        qTDSUGERIDA: entity.qTDSUGERIDA,
        dIASEXTRAS: entity.dIASEXTRAS,
        dIASOFERTAS: entity.dIASOFERTAS,
        qTRESERV: entity.qTRESERV,
        eSTMIN: entity.eSTMIN,
        eSTMAX: entity.eSTMAX,
        qTESTGER: entity.qTESTGER,
        cODEPTO: entity.cODEPTO,
        cODSEC: entity.cODSEC,
        cODCATEGORIA: entity.cODCATEGORIA,
        dESCRICAO: entity.dESCRICAO,
        eMBALAGEM: entity.eMBALAGEM,
        uNIDADE: entity.uNIDADE,
        pESOLIQ: entity.pESOLIQ,
        cUSTOFIN: entity.cUSTOFIN,
        cUSTOREAL: entity.cUSTOREAL,
        cUSTOCONT: entity.cUSTOCONT,
        cUSTOREP: entity.cUSTOREP,
        vALORULTENT: entity.vALORULTENT,
        qTUNITCX: entity.qTUNITCX,
        cODICMTAB: entity.cODICMTAB,
        tRIBUTACAO: entity.tRIBUTACAO,
        cODST: entity.cODST,
        qTDESTORIG: entity.qTDESTORIG,
        qTDESTDEST: entity.qTDESTDEST,
        qTDCOMPRA: entity.qTDCOMPRA,
        qTGIRODIA: entity.qTGIRODIA,
        cODPRODEM: entity.cODPRODEM,
        cODAUXILIAR: entity.cODAUXILIAR,
        iNDUSTRIAORIGEM: entity.iNDUSTRIAORIGEM,
        mULTIPLOPADARIA: entity.mULTIPLOPADARIA,
        );
  }
}
