import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  final String cODPROD; //PCODPROD
  final String cODFILIAL;
  final String cODMARCA;
  final String qTDSUGERIDA; //PQT
  final String dIASEXTRAS;
  final String dIASOFERTAS;
  final String qTRESERV;
  final String eSTMIN;
  final String eSTMAX;
  final String qTESTGER;
  final String cODEPTO;
  final String cODSEC;
  final String cODCATEGORIA;
  final String dESCRICAO;
  final String eMBALAGEM;
  final String uNIDADE;
  final String pESOLIQ;
  final String cUSTOFIN; //PVLCUSTOFIN //PCUSTOFINEST
  final String cUSTOREAL; //PVLCUSTOREAL
  final String cUSTOCONT; //VLCUSTOCONT
  final String cUSTOREP;
  final String vALORULTENT; //PPVENDA //PPTABELA //PPVENDABASE
  final String qTUNITCX;
  final String cODICMTAB; //PCODICMTAB
  final String tRIBUTACAO;
  final String cODST; //PCODST
  final String qTDESTORIG;
  final String qTDESTDEST;
  late double? qTDCOMPRA;
  final String qTGIRODIA;
  final String cODPRODEM;
  final String cODAUXILIAR;
  final String iNDUSTRIAORIGEM; //PCCODFILIALRETIRA
  final String mULTIPLOPADARIA;

  /*Gerado na Procedure
   - PNUMSEQ - gerar e enviar durante o envio
  */

  Product({
    required this.cODPROD,
    required this.cODMARCA,
    required this.cODFILIAL,
    required this.qTDSUGERIDA,
    required this.dIASEXTRAS,
    required this.dIASOFERTAS,
    required this.qTRESERV,
    required this.eSTMIN,
    required this.eSTMAX,
    required this.qTESTGER,
    required this.cODEPTO,
    required this.cODSEC,
    required this.cODCATEGORIA,
    required this.dESCRICAO,
    required this.eMBALAGEM,
    required this.uNIDADE,
    required this.pESOLIQ,
    required this.cUSTOFIN,
    required this.cUSTOREAL,
    required this.cUSTOCONT,
    required this.cUSTOREP,
    required this.vALORULTENT,
    required this.qTUNITCX,
    required this.cODICMTAB,
    required this.tRIBUTACAO,
    required this.cODST,
    required this.qTDESTORIG,
    required this.qTDESTDEST,
    this.qTDCOMPRA,
    required this.qTGIRODIA,
    required this.cODPRODEM,
    required this.cODAUXILIAR,
    required this.iNDUSTRIAORIGEM,
   required this.mULTIPLOPADARIA,
  });

  @override
  List<Object?> get props => [
        this.cODPROD,
        this.cODFILIAL,
        this.qTDSUGERIDA,
        this.dIASEXTRAS,
        this.dIASOFERTAS,
        this.qTRESERV,
        this.eSTMIN,
        this.eSTMAX,
        this.qTESTGER,
        this.cODEPTO,
        this.cODSEC,
        this.cODCATEGORIA,
        this.dESCRICAO,
        this.eMBALAGEM,
        this.uNIDADE,
        this.pESOLIQ,
        this.cUSTOFIN,
        this.cUSTOREAL,
        this.cUSTOCONT,
        this.cUSTOREP,
        this.vALORULTENT,
        this.qTUNITCX,
        this.cODICMTAB,
        this.tRIBUTACAO,
        this.cODST,
        this.qTDESTORIG,
        this.qTDESTDEST,
        this.qTDCOMPRA,
        this.qTGIRODIA,
        this.cODPRODEM,
        this.cODMARCA,
        this.cODAUXILIAR,
        this.iNDUSTRIAORIGEM,
        this.mULTIPLOPADARIA,
      ];
}
