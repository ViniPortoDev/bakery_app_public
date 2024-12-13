import '../../domain/entities/product_entity.dart';

// ignore: must_be_immutable
class ProductDTO extends Product {
  String? numSeq;

  ProductDTO({
    required String cODPROD,
    required String cODMARCA,
    required String cODFILIAL,
    required String qTDSUGERIDA,
    required String dIASEXTRAS,
    required String dIASOFERTAS,
    required String qTRESERV,
    required String eSTMIN,
    required String eSTMAX,
    required String qTESTGER,
    required String cODEPTO,
    required String cODSEC,
    required String cODCATEGORIA,
    required String dESCRICAO,
    required String eMBALAGEM,
    required String uNIDADE,
    required String pESOLIQ,
    required String cUSTOFIN,
    required String cUSTOREAL,
    required String cUSTOCONT,
    required String cUSTOREP,
    required String vALORULTENT,
    required String qTUNITCX,
    required String cODICMTAB,
    required String tRIBUTACAO,
    required String cODST,
    required String qTDESTORIG,
    required String qTDESTDEST,
    double? qTDCOMPRA,
    required String qTGIRODIA,
    required String cODPRODEM,
    required String cODAUXILIAR,
    required String iNDUSTRIAORIGEM,
    required String mULTIPLOPADARIA,
    this.numSeq,
  }) : super(
          cODPROD: cODPROD,
          cODMARCA: cODMARCA,
          cODFILIAL: cODFILIAL,
          qTDSUGERIDA: qTDSUGERIDA,
          dIASEXTRAS: dIASEXTRAS,
          dIASOFERTAS: dIASOFERTAS,
          qTRESERV: qTRESERV,
          eSTMIN: eSTMIN,
          eSTMAX: eSTMAX,
          qTESTGER: qTESTGER,
          cODEPTO: cODEPTO,
          cODSEC: cODSEC,
          cODCATEGORIA: cODCATEGORIA,
          dESCRICAO: dESCRICAO,
          eMBALAGEM: eMBALAGEM,
          uNIDADE: uNIDADE,
          pESOLIQ: pESOLIQ,
          cUSTOFIN: cUSTOFIN,
          cUSTOREAL: cUSTOREAL,
          cUSTOCONT: cUSTOCONT,
          cUSTOREP: cUSTOREP,
          vALORULTENT: vALORULTENT,
          qTUNITCX: qTUNITCX,
          cODICMTAB: cODICMTAB,
          tRIBUTACAO: tRIBUTACAO,
          cODST: cODST,
          qTDESTORIG: qTDESTORIG,
          qTDESTDEST: qTDESTDEST,
          qTDCOMPRA: qTDCOMPRA,
          qTGIRODIA: qTGIRODIA,
          cODPRODEM: cODPRODEM,
          cODAUXILIAR: cODAUXILIAR,
          iNDUSTRIAORIGEM: iNDUSTRIAORIGEM,
          mULTIPLOPADARIA: mULTIPLOPADARIA,
        );

  factory ProductDTO.fromMap(Map<String?, dynamic> json) {
    return ProductDTO(
      cODPROD: json['CODPROD'] != null ? json['CODPROD'] : "",
      cODMARCA: json['CODMARCA'] != null ? json['CODMARCA'] : "",
      cODFILIAL: json['CODFILIAL'] != null ? json['CODFILIAL'] : "",
      qTDSUGERIDA: json['QTD_SUGERIDA'] != null ? json['QTD_SUGERIDA'] : "",
      dIASEXTRAS: json['DIASEXTRAS'] != null ? json['DIASEXTRAS'] : "",
      dIASOFERTAS: json['DIASOFERTAS'] != null ? json['DIASOFERTAS'] : "",
      qTRESERV: json['QTRESERV'] != null ? json['QTRESERV'] : "",
      eSTMIN: json['ESTMIN'] != null ? json['ESTMIN'] : "",
      eSTMAX: json['ESTMAX'] != null ? json['ESTMAX'] : "",
      cODSEC: json['CODSEC'] != null ? json['CODSEC'] : "",
      cODCATEGORIA: json['CODCATEGORIA'] != null ? json['CODCATEGORIA'] : "",
      qTESTGER: json['QTESTGER'] != null ? json['QTESTGER'] : "",
      cODEPTO: json['CODEPTO'] != null ? json['CODEPTO'] : "",
      dESCRICAO: json['DESCRICAO'] != null ? json['DESCRICAO'] : "",
      eMBALAGEM: json['EMBALAGEM'] != null ? json['EMBALAGEM'] : "",
      uNIDADE: json['UNIDADE'] != null ? json['UNIDADE'] : "",
      pESOLIQ: json['PESOLIQ'] != null ? json['PESOLIQ'] : "",
      cUSTOFIN: json['CUSTOFIN'] != null ? json['CUSTOFIN'] : "",
      cUSTOREAL: json['CUSTOREAL'] != null ? json['CUSTOREAL'] : "",
      cUSTOCONT: json['CUSTOCONT'] != null ? json['CUSTOCONT'] : "",
      cUSTOREP: json['CUSTOREP'] != null ? json['CUSTOREP'] : "",
      vALORULTENT: json['VALORULTENT'] != null ? json['VALORULTENT'] : "",
      qTUNITCX: json['QTUNITCX'] != null ? json['QTUNITCX'] : "",
      cODICMTAB: json['CODICMTAB'] != null ? json['CODICMTAB'] : "",
      tRIBUTACAO: json['TRIBUTACAO'] != null ? json['TRIBUTACAO'] : "",
      cODST: json['CODST'] != null ? json['CODST'] : "",
      qTDESTORIG: json['QTD_EST_ORIG'] != null ? json['QTD_EST_ORIG'] : "",
      qTDESTDEST: json['QTD_EST_DEST'] != null ? json['QTD_EST_DEST'] : "",
      qTDCOMPRA: json['QTD_SUGERIDA'] != null && json['QTD_SUGERIDA'] != ''
          ? double.parse(json['QTD_SUGERIDA'])
          : 1,
      qTGIRODIA: json['QTGIRODIA'] != null ? json['QTGIRODIA'] : "",
      cODPRODEM: json['CODPRODEM'] != null ? json['CODPRODEM'] : "",
      cODAUXILIAR: json['CODAUXILIAR'] != null ? json['CODAUXILIAR'] : "",
      iNDUSTRIAORIGEM:
          json['INDUSTRIAORIGEM'] != null ? json['INDUSTRIAORIGEM'] : "",
                mULTIPLOPADARIA:
          json['MULTIPLOPADARIA'] != null ? json['MULTIPLOPADARIA'] : "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'numped': "",
      //'codprod': this.cODPROD,
      'codprod': this.cODPRODEM,
      'qt': this.qTDCOMPRA.toString(), // qtd de compra
      'pvenda': this.vALORULTENT,
      'codfilial': this.cODFILIAL,
      'vlcustoreal': this.cUSTOREAL,
      //'DIASEXTRAS': this.dIASEXTRAS,
      //'DIASOFERTAS': this.dIASOFERTAS,
      //'QTRESERV': this.qTRESERV,
      //'ESTMIN': this.eSTMIN,
      //'ESTMAX': this.eSTMAX,
      //'QTESTGER': this.qTESTGER,
      // 'CODEPTO': this.cODEPTO,
      'descricao': this.dESCRICAO,
      'codsec': this.cODSEC,
      'codcategoria': this.cODCATEGORIA,
      'codmarca': this.cODMARCA,
      // 'EMBALAGEM': this.eMBALAGEM,
      // 'UNIDADE': this.uNIDADE,
      // 'PESOLIQ': this.pESOLIQ,
      'vlcustofin': this.cUSTOFIN,
      'numseq': this.numSeq,
      'vlcustocont': this.cUSTOCONT,
      'vlcustorep': this.cUSTOREP,
      'codst': this.cODST,
      //'QTUNITCX': this.qTUNITCX,
      'codicmtab': this.cODICMTAB,
      //'TRIBUTACAO': this.tRIBUTACAO,
      'codprodem': this.cODPRODEM,
      'codauxiliar': this.cODAUXILIAR,
      'industriaorigem': this.iNDUSTRIAORIGEM,
      // 'QTD_EST_ORIG': this.qTDESTORIG,
      // 'QTD_EST_DEST': this.qTDESTDEST,
    };
  }
}