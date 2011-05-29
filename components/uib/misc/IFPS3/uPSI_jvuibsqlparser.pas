unit uPSI_jvuibsqlparser;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis. 
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface
 
uses
   SysUtils
  ,Classes
  ,uPSComponent
  ,uPSRuntime
  ,uPSCompiler
  ;
 
type 
(*----------------------------------------------------------------------------*)
  TPSImport_jvuibsqlparser = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TJVUIBSQLParser(CL: TPSPascalCompiler);
procedure SIRegister_EUIBSQLParseError(CL: TPSPascalCompiler);
procedure SIRegister_jvuibsqlparser(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TJVUIBSQLParser(CL: TPSRuntimeClassImporter);
procedure RIRegister_EUIBSQLParseError(CL: TPSRuntimeClassImporter);
procedure RIRegister_jvuibsqlparser(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   jvuibsqlparser
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_jvuibsqlparser]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TJVUIBSQLParser(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TOBJECT', 'TJVUIBSQLParser') do
  with CL.AddClassN(CL.FindClass('TOBJECT'),'TJVUIBSQLParser') do
  begin
    RegisterMethod('Constructor Create( AStrings : TStrings)');
    RegisterMethod('Function NextToken : TSQLToken');
    RegisterMethod('Function NextStatement : TSQLStatement');
    RegisterProperty('Params', 'TStringList', iptr);
    RegisterProperty('Statement', 'string', iptr);
    RegisterProperty('Value', 'string', iptr);
    RegisterProperty('OnComment', 'TOnComment', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_EUIBSQLParseError(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'Exception', 'EUIBSQLParseError') do
  with CL.AddClassN(CL.FindClass('Exception'),'EUIBSQLParseError') do
  begin
    RegisterProperty('Line', 'integer', iptr);
    RegisterProperty('Pos', 'Integer', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_jvuibsqlparser(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TSQLToken', '( toValString, toSymbol, toValNumber, toValFloat, t'
   +'oNotLSS, toNEQ, toNotGTR, toLEQ, toLSS, toEQL, toGEQ, toGTR, toConcatenate'
   +', toScolon, toLParen, toRParen, toComma, toLArray, toRArray, toColon, toPl'
   +'us, toStar, toDot, toVParam, toSlash, toMinus, toACTION, toACTIVE, toADD, '
   +'toADMIN, toAFTER, toALL, toALTER, toAND, toANY, toAS, toASC, toAT, toAUTO,'
   +' toAUTODDL, toAVG, toBACKUP, toBASE_NAME, toBEFORE, toBEGIN, toBETWEEN, to'
   +'BIGINT, toBLOB, toBREAK, toBY, toCACHE, toCASCADE, toCASE, toCAST, toCHAR,'
   +' toCHARACTER, toCHECK, toCHECK_POINT_LENGTH, toCOALESCE, toCOLLATE, toCOLU'
   +'MN, toCOMMIT, toCOMMITTED, toCOMPUTED, toCONDITIONAL, toCONNECT, toCONSTRA'
   +'INT, toCONTAINING, toCOUNT, toCREATE, toCSTRING, toCURRENT, toCURRENT_CONN'
   +'ECTION, toCURRENT_DATE, toCURRENT_ROLE, toCURRENT_TIME, toCURRENT_TIMESTAM'
   +'P, toCURRENT_TRANSACTION, toCURRENT_USER, toCURSOR, toDATABASE, toDATE, to'
   +'DAY, toDEBUG, toDEC, toDECIMAL, toDECLARE, toDEFAULT, toDELETE, toDELETING'
   +', toDESC, toDESCRIPTOR, toDIALECT, toDIFFERENCE, toDISTINCT, toDO, toDOMAI'
   +'N, toDOUBLE, toDROP, toELSE, toEND, toENTRY_POINT, toESCAPE, toEXCEPTION, '
   +'toEXECUTE, toEXISTS, toEXIT, toEXTERNAL, toEXTRACT, toFILE, toFILTER, toFI'
   +'RST, toFLOAT, toFOR, toFOREIGN, toFREE_IT, toFROM, toFULL, toFUNCTION, toG'
   +'DSCODE, toGEN_ID, toGENERATOR, toGRANT, toGROUP, toGROUP_COMMIT_WAIT_TIME,'
   +' toHAVING, toHOUR, toIF, toIN, toINACTIVE, toINDEX, toINNER, toINPUT_TYPE,'
   +' toINSERT, toINSERTING, toINT, toINTEGER, toINTO, toIS, toISOLATION, toJOI'
   +'N, toKEY, toLAST, toLEAVE, toLEFT, toLENGTH, toLEVEL, toLIKE, toLOCK, toLO'
   +'G_BUFFER_SIZE, toLOGFILE, toLONG, toMANUAL, toMAX, toMAXIMUM_SEGMENT, toME'
   +'RGE, toMESSAGE, toMIN, toMINUTE, toMODULE_NAME, toMONTH, toNAMES, toNATION'
   +'AL, toNATURAL, toNCHAR, toNO, toNOT, toNULL, toNULLIF, toNULLS, toNUM_LOG_'
   +'BUFFERS, toNUMERIC, toOF, toOFF, toON, toONLY, toOPTION, toOR, toORDER, to'
   +'OUTER, toOUTPUT_TYPE, toOVERFLOW, toPAGE, toPAGE_SIZE, toPAGES, toPARAMETE'
   +'R, toPASSWORD, toPLAN, toPOSITION, toPOST_EVENT, toPRECISION, toPRIMARY, t'
   +'oPRIVILEGES, toPROCEDURE, toPROTECTED, toRAW_PARTITIONS, toRDBDBKEY, toREA'
   +'D, toREAL, toRECORD_VERSION, toRECREATE, toREFERENCES, toRELEASE, toRESERV'
   +'ING, toRESTRICT, toRETAIN, toRETURNING_VALUES, toRETURNS, toREVOKE, toRIGH'
   +'T, toROLE, toROLLBACK, toROW_COUNT, toSAVEPOINT, toSECOND, toSEGMENT, toSE'
   +'LECT, toSET, toSHADOW, toSHARED, toSINGULAR, toSIZE, toSKIP, toSMALLINT, t'
   +'oSNAPSHOT, toSOME, toSORT, toSQL, toSQLCODE, toSTABILITY, toSTARTING, toST'
   +'ATEMENT, toSTATISTICS, toSUB_TYPE, toSUBSTRING, toSUM, toSUSPEND, toTABLE,'
   +' toTHEN, toTIME, toTIMESTAMP, toTO, toTRANSACTION, toTRIGGER, toTYPE, toUN'
   +'COMMITTED, toUNION, toUNIQUE, toUPDATE, toUPDATING, toUPPER, toUSER, toUSI'
   +'NG, toVALUE, toVALUES, toVARCHAR, toVARIABLE, toVARYING, toVIEW, toWAIT, t'
   +'oWEEKDAY, toWHEN, toWHERE, toWHILE, toWITH, toWORK, toWRITE, toYEAR, toYEA'
   +'RDAY, toBIT_LENGTH, toBLOCK, toBOTH, toCHAR_LENGTH, toCHARACTER_LENGTH, to'
   +'CLOSE, toCOLLATION, toCOMMENT, toCROSS, toFETCH, toIIF, toLEADING, toLOWER'
   +', toNEXT, toOCTET_LENGTH, toOPEN, toRESERV, toRESTART, toRETURNING, toROWS'
   +', toSCALAR_ARRAY, toSCHEMA, toSEQUENCE, toSTARTS, toTRAILING, toTRIM, toEO'
   +'F )');
  CL.AddTypeS('TSQLStatement', '( ssUnknow, ssAlterException, ssAlterTable, ssA'
   +'lterTrigger, ssAlterProcedure, ssAlterDatabase, ssAlterDomain, ssAlterInde'
   +'x, ssAlterSequence, ssAlterFunction, ssReadBlob, ssInsertBlob, ssCommit, s'
   +'sDeclareFilter, ssDeclareFunction, ssDelete, ssDropException, ssDropIndex,'
   +' ssDropProcedure, ssDropTable, ssDropTrigger, ssDropView, ssDropFilter, ss'
   +'DropDomain, ssDropFunction, ssDropShadow, ssDropRole, ssDropGenerator, ssD'
   +'ropSequence, ssGrant, ssInsertInto, ssExecuteProcedure, ssExecuteBlock, ss'
   +'RecreateProcedure, ssRecreateTable, ssRecreateView, ssRecreateException, s'
   +'sSetSqlDialect, ssSetTransaction, ssSetGenerator, ssSetStatistics, ssSetNa'
   +'mes, ssCreateException, ssCreateIndex, ssCreateProcedure, ssCreateTable, s'
   +'sCreateTrigger, ssCreateView, ssCreateGenerator, ssCreateSequence, ssCreat'
   +'eDatabase, ssCreateDomain, ssCreateShadow, ssCreateRole, ssReplaceProcedur'
   +'e, ssReplaceTrigger, ssReplaceException, ssRevoke, ssRollback, ssSetSavepo'
   +'int, ssReleaseSavepoint, ssUndoSavepoint, ssSelect, ssUpdate, ssDebug, ssA'
   +'utoDDL, ssConnect, ssCommentDatabase, ssCommentDomain, ssCommentTable, ssC'
   +'ommentView, ssCommentProcedure, ssCommentTrigger, ssCommentFunction, ssCom'
   +'mentFilter, ssCommentException, ssCommentGenerator, ssCommentSequence, ssC'
   +'ommentIndex, ssCommentRole, ssCommentCharacterSet, ssCommentCollation, ssC'
   +'ommentColumn, ssCommentParameter, ssEOF )');
  SIRegister_EUIBSQLParseError(CL);
  CL.AddTypeS('TCommentStyle', '( csMultiLine, csSingleLine )');
  CL.AddTypeS('TOnComment', 'Procedure ( sender : TObject; const comment : stri'
   +'ng; style : TCommentStyle)');
  SIRegister_TJVUIBSQLParser(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TJVUIBSQLParserOnComment_W(Self: TJVUIBSQLParser; const T: TOnComment);
begin Self.OnComment := T; end;

(*----------------------------------------------------------------------------*)
procedure TJVUIBSQLParserOnComment_R(Self: TJVUIBSQLParser; var T: TOnComment);
begin T := Self.OnComment; end;

(*----------------------------------------------------------------------------*)
procedure TJVUIBSQLParserValue_R(Self: TJVUIBSQLParser; var T: string);
begin T := Self.Value; end;

(*----------------------------------------------------------------------------*)
procedure TJVUIBSQLParserStatement_R(Self: TJVUIBSQLParser; var T: string);
begin T := Self.Statement; end;

(*----------------------------------------------------------------------------*)
procedure TJVUIBSQLParserParams_R(Self: TJVUIBSQLParser; var T: TStringList);
begin T := Self.Params; end;

(*----------------------------------------------------------------------------*)
procedure EUIBSQLParseErrorPos_R(Self: EUIBSQLParseError; var T: Integer);
begin T := Self.Pos; end;

(*----------------------------------------------------------------------------*)
procedure EUIBSQLParseErrorLine_R(Self: EUIBSQLParseError; var T: integer);
begin T := Self.Line; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJVUIBSQLParser(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJVUIBSQLParser) do
  begin
    RegisterVirtualConstructor(@TJVUIBSQLParser.Create, 'Create');
    RegisterMethod(@TJVUIBSQLParser.NextToken, 'NextToken');
    RegisterMethod(@TJVUIBSQLParser.NextStatement, 'NextStatement');
    RegisterPropertyHelper(@TJVUIBSQLParserParams_R,nil,'Params');
    RegisterPropertyHelper(@TJVUIBSQLParserStatement_R,nil,'Statement');
    RegisterPropertyHelper(@TJVUIBSQLParserValue_R,nil,'Value');
    RegisterPropertyHelper(@TJVUIBSQLParserOnComment_R,@TJVUIBSQLParserOnComment_W,'OnComment');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_EUIBSQLParseError(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(EUIBSQLParseError) do
  begin
    RegisterPropertyHelper(@EUIBSQLParseErrorLine_R,nil,'Line');
    RegisterPropertyHelper(@EUIBSQLParseErrorPos_R,nil,'Pos');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_jvuibsqlparser(CL: TPSRuntimeClassImporter);
begin
  RIRegister_EUIBSQLParseError(CL);
  RIRegister_TJVUIBSQLParser(CL);
end;

 
 
{ TPSImport_jvuibsqlparser }
(*----------------------------------------------------------------------------*)
procedure TPSImport_jvuibsqlparser.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_jvuibsqlparser(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_jvuibsqlparser.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_jvuibsqlparser(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.