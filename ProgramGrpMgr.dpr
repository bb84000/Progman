program ProgramGrpMgr;



{$R 'Win7UAC.res' 'Win7UAC.rc'}

uses
  Forms,
  programmgr1 in 'programmgr1.pas' {FPrgMgr},
  files1 in 'files1.pas',
  save1 in 'save1.pas' {FSaveCfg},
  about in '..\..\BBComponents\about.pas' {AboutBox},
  ChkNewVer in '..\..\BBComponents\ChkNewVer.pas' {FChkNewVer},
  Alert in '..\..\BBComponents\Alert.pas' {AlertBox},
  prefs1 in 'prefs1.pas' {FPrefs},
  Property1 in 'Property1.pas' {FProperty},
  opengroup1 in 'opengroup1.pas' {FLoadGroup},
  LoadConf1 in 'LoadConf1.pas' {FLoadConf};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFPrgMgr, FPrgMgr);
  Application.CreateForm(TFSaveCfg, FSaveCfg);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TFChkNewVer, FChkNewVer);
  Application.CreateForm(TAlertBox, AlertBox);
  Application.CreateForm(TFPrefs, FPrefs);
  Application.CreateForm(TFProperty, FProperty);
  Application.CreateForm(TFLoadGroup, FLoadGroup);
  Application.CreateForm(TFLoadConf, FLoadConf);
  Application.Run;
end.
