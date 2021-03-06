// ***************************************************************************//
// Program Manager main form                                                  //
// Bernard Barrier - March 2019                                               //
// ***************************************************************************//

unit programmgr1;

interface

uses                                                                             
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, {Grids, }ShellAPI, shfolder, ImgList, ComCtrls, CommCtrl,  BButils,
  ExtCtrls, ShellCtrls, Menus, ShelBrow, Buttons, files1, JanXMLParser2, ShlObj,
  WinVer, IniFiles, Registry, OneInst32, VerResU, AppEvnts, Contnrs, CommDlg,
  Consts, JvTrayIconN;

type

  // TrayIcon properties record used to update or restore tray icon when explorer crashes
  TrayIconProps = record
     PrActive: Boolean;
     PrAnimated: Boolean;
     PrDelay: Integer;
     PrDropDownMenu: TPopupMenu;
     PrHint: String;
     PrIcon: TIcon;
     PrIconIndex: Integer;
     PrIcons: TCustomImageList;
     PrName: String;
     PrPopupMenu: TPopupMenu;
     PrSnap: Boolean;
     PrTag: Integer;
     PrVisibility: TTrayVisibilities;
     EvOnAnimate: TAnimateEvent;
     EvOnBalloonClick: TNotifyEvent;
     EvOnBalloonHide: TNotifyEvent;
     EvOnBalloonShow: TNotifyEvent;
     EvOnClick: TMouseEvent;
     EvOnContextPopup: TContextPopupEvent;
     EvOnDblClick: TMouseEvent;
     EvOnMinimizeToTray: TNotifyEvent;
     EvOnMouseMove: TMouseMoveEvent;
     EvOnMouseDown: TMouseEvent;
     EvOnMouseUp: TMouseEvent;
  end;

    SaveType = (None, State, All);

    TFPrgMgr = class(TForm)
    PnlTools: TPanel;
    CBDisplay: TComboBox;
    CBSort: TComboBox;
    LVPMnu: TPopupMenu;
    PMnuRun: TMenuItem;
    PMnuProps: TMenuItem;
    PMnuRunAs: TMenuItem;
    SBFolder: TSpeedButton;
    SBrow1: TShellBrowser;
    N1: TMenuItem;
    PMnuDelete: TMenuItem;
    SBAddFile: TSpeedButton;
    ListView1: TListView;
    PnlStatus: TPanel;
    PPnlImg: TPanel;
    ImgPrgSel: TImage;
    PnlPrgSel: TPanel;
    LPrgSel: TLabel;
    SBAbout: TSpeedButton;
    SBSave: TSpeedButton;
    SBPrefs: TSpeedButton;
    SBRefresh: TSpeedButton;
    SBGroup: TSpeedButton;
    Timer1: TTimer;
    ODlg1: TOpenDialog;
    SBLoadConf: TSpeedButton;
    WinVersion1: TWinVersion;
    SBQuit: TSpeedButton;
    TrayProgman: TJvTrayIconN;
    TrayMenu: TPopupMenu;
    PTrayMnuRestore: TMenuItem;
    PTrayMnuMinimize: TMenuItem;
    PTrayMnuMaximize: TMenuItem;
    N2: TMenuItem;
    PTrayMnuQuit: TMenuItem;
    PTrayMnuAbout: TMenuItem;
    N3: TMenuItem;
    ImgWinXP: TImage;
    PMnuHideBars: TMenuItem;
    PMnuGroup: TMenuItem;
    N4: TMenuItem;
    PMnuFolder: TMenuItem;
    PMnuAddFile: TMenuItem;
    PMnuSave: TMenuItem;
    N5: TMenuItem;
    PMnuPrefs: TMenuItem;
    PMnuRefresh: TMenuItem;
    PMnuLoadConf: TMenuItem;
    N6: TMenuItem;
    PMnuAbout: TMenuItem;
    N7: TMenuItem;
    PMnuQuit: TMenuItem;
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure ListView1DblClick(Sender: TObject);
    procedure CBDisplayChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1InfoTip(Sender: TObject; Item: TListItem;
      var InfoTip: String);
    procedure LVPMnuPopup(Sender: TObject);
    procedure PMnuRunClick(Sender: TObject);
    procedure PMnuPropsClick(Sender: TObject);
    procedure SBFolderClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PMnuDeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBAddFileClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure PnlToolsResize(Sender: TObject);
    procedure SBAboutClick(Sender: TObject);
    procedure SBrow1SelChange(Sender: TObject; NewFolder: String;
      IsDisplayName: Boolean);
    procedure ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SBSaveClick(Sender: TObject);
    procedure SBPrefsClick(Sender: TObject);

    procedure DROPFILES (var Msg: TMessage); message WM_DROPFILES;
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure SBRefreshClick(Sender: TObject);
    procedure ListView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure SBGroupClick(Sender: TObject);
    procedure ODlg1Show(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SBLoadConfClick(Sender: TObject);
    procedure SBQuitClick(Sender: TObject);
    procedure FormConstrainedResize(Sender: TObject; var MinWidth,
      MinHeight, MaxWidth, MaxHeight: Integer);
    procedure PTrayMnuQuitClick(Sender: TObject);
    procedure PTrayMnuMinimizeClick(Sender: TObject);
    procedure PTrayMnuMaximizeClick(Sender: TObject);
    procedure PTrayMnuRestoreClick(Sender: TObject);
    procedure PTrayMnuAboutClick(Sender: TObject);
    function HidInTaskBar (enable: Boolean): boolean;
    procedure TrayProgmanMinimizeToTray(Sender: TObject);
    procedure PMnuHideBarsClick(Sender: TObject);
    procedure PMnuGroupClick(Sender: TObject);
    procedure PMnuFolderClick(Sender: TObject);
    procedure PMnuSaveClick(Sender: TObject);
    procedure PMnuPrefsClick(Sender: TObject);
    procedure PMnuRefreshClick(Sender: TObject);
    procedure PMnuLoadConfClick(Sender: TObject);
    procedure PMnuAboutClick(Sender: TObject);
    procedure PMnuQuitClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PMnuAddFileClick(Sender: TObject);
    procedure TrayProgmanCreateTaskBar(Sender: TObject);
    
  private
    { D�clarations priv�es }
    FMinWidth, FminHeight : Integer;
    FOrgListViewWndProc: TWndMethod;
    TrayProps: TrayIconProps;
    procedure CreateTrayIcon(properties: TrayIconProps);
    procedure LoadTrayIconProps(properties: TrayIconProps);
    procedure ReadTrayIconProps(var properties: TrayIconProps);
    procedure ListViewWndProc(var Msg: TMessage);

  public
    { D�clarations publiques }
    YesBtn, NoBtn, CancelBtn: String;
    First: Boolean;
    oldw: array [0..50] of Integer;
    curdir: String;
    ImageList: TImageList;
    ListeFichiers: TFichierList;
    ProgName: String;
    PrgMgrAppsData: string;
    ConfigFile: string;
    GroupName: string;
    SavSizePos: Boolean;
    WState, PrevWState: string;
    ListeChange: Bool;
    SystemRoot: String;
    StartMenu: String;
    UserProfile: String;
    Desktop: String;
    langue: Integer;
    LangStr, PrevLangStr: string;
    LangFile: TiniFile;
    LangNums: TStringList;
    CurLang: Integer;
    DeleteOKMsg: String;
    GrpIconFile, PrevGrpIconFile: String;
    GrpIconIndex, PrevGrpIconIndex: Integer;
    Version: String;
    ShortCutName: String;
    LUpdateCaption, UpdateURL, ChkVerURL: String;
    UpdateAvailable, NoLongerChkUpdates: String;
    LastUpdateSearch, LastChkCaption, NextChkCaption: String;
    LastUpdChk, PrevLastUpdChk: TDateTime;
    NoChkNewVer, PrevNoChkNewVer: Boolean;
    StartWin, PrevStartWin, StartMini, PrevStartMini: boolean;
    MiniInTray, PrevMiniInTray: Boolean;
    PrevHideInTaskBar, HideInTaskBar: Bool;
    PrevHideBars, HideBars: Bool;
    IconDisplay, IconSort: Integer;
    IconDefFile: String;
    FPropertyCaption: string;
    NoDeleteGroup: String;
    DeleteGrpMsg: String;
    dlgTitle : String;
    SMnuMaskBars, SMnuShowBars : String;
    HideBarsHeight, ShowBarsheight: Integer;
    PrevWindowState: TWindowState;
    AppState, PrevAppState : Integer;
    BarsHeight: Integer;
    WM_TASKBAR_CREATED: DWORD;
    function ReadFolder(strPath: string; Directory: Bool): Integer;
    function GetFile(FileName: string):TFichier;
    procedure LVDisplayFiles;
    procedure LoadGroup(GrpName: String);
    procedure LoadCfgFile(FileName: String);
    procedure LoadConfig(GroupName: String);
    function SaveConfig(GroupName: String; Typ: SaveType): Bool;
    procedure ListeFichiersOnChange(sender: TObject);
    function GetGrpParam: string;
    procedure ModLangue;
    procedure WndProc(var Msg: TMessage); override;
    function ShowAlert(Title, AlertStr, StReplace, NoShow: String; var Alert: Boolean): Boolean;
    procedure ChkVersion;
    function StateChanged: SaveType;
    function PMnuSaveEnable (Enabled: Boolean):Boolean;
    procedure CropBitmap(InBitmap, OutBitMap : TBitmap; Enabled: Boolean); //X, Y, W, H :Integer);
    function NoRedirect(FilName: String):String;
  end;

const
    SHGFP_TYPE_CURRENT = 0;
    SHGFP_TYPE_DEFAULT = 1;
    CSIDL_PROFILE = $0028;
    CSIDL_PROGRAM_FILESX86 = $002A;
    
var
  FPrgMgr: TFPrgMgr;
  hUserDll    : THandle;


implementation

uses Types, save1, about, ChkNewVer, Alert, prefs1, Property1, opengroup1,
  LoadConf1 ;

{$R *.dfm}

// Needed to localise system dialogs resources

procedure HookResourceString(aResStringRec: PResStringRec; aNewStr: PChar);
var
OldProtect: DWORD;
begin
VirtualProtect(aResStringRec, SizeOf(aResStringRec^), PAGE_EXECUTE_READWRITE, @OldProtect);
aResStringRec^.Identifier := Integer(aNewStr);
VirtualProtect(aResStringRec, SizeOf(aResStringRec^), OldProtect, @OldProtect);
end;

// Catch the WM_DROPFILES message, and call the original ListView WindowProc
// for all other messages.

procedure TFPrgMgr.ListViewWndProc(var Msg: TMessage);
begin

  case Msg.Msg of
    WM_DROPFILES:
      DropFiles(Msg);
  else
    if Assigned(FOrgListViewWndProc) then
      FOrgListViewWndProc(Msg);
  end;
end;

// Traitement du drag and drop

procedure TFPrgMgr.DROPFILES(var Msg:TMessage);
var
  i, count  : integer;
  dropFileName : array [0..511] of Char;
  MAXFILENAME: integer;
begin
  MAXFILENAME := 511;
  count := DragQueryFile(msg.WParam, $FFFFFFFF, dropFileName, MAXFILENAME);
  for i := 0 to count - 1 do
  begin
    DragQueryFile(msg.WParam, i, dropFileName, MAXFILENAME);
    // V�rifier si c'est un r�pertoire
    ListeFichiers.AddFile(GetFile(dropFileName));
    LVDisplayFiles;
  end;
  DragFinish(msg.WParam);
end;

// Traitement des messages Windows (menu syst�me, fin de session, forme de recherche de mise � jour)

procedure TFPrgMgr.WndProc(var Msg: TMessage);
var
  reg: TRegistry;
  CurVer, NewVer: Int64;
  s: String;
begin
  // Explorer restarted, need to reload tray
  if Msg.Msg = WM_TASKBAR_CREATED then
  begin
     ReadTrayIconProps(TrayProps);
     Application.ProcessMessages;
     CreateTrayIcon(TrayProps);
     Msg.Result:= 1;
  end;
  // Message de demande de fermeture de session
  // si n�cessaire, on le met dans RunOnce
  if Msg.Msg = WM_QUERYENDSESSION then
  begin
    if not StartWin then
    begin
      reg := TRegistry.Create;
      reg.RootKey := HKEY_CURRENT_USER;
      reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\RunOnce', True) ;
      reg.WriteString(TrimFileExt(ProgName)+'_'+GroupName, '"'+Application.ExeName+'" Grp='+GroupName) ;
      reg.CloseKey;
      reg.free;
    end;
    SaveConfig (GroupName, StateChanged);

    Application.ProcessMessages;
    Msg.Result := 1 ;
  end;
  // la forme de recherche de mise � jour a envoy� un message
  if Msg.Msg = WM_INFO_UPDATE then
    case msg.WParam of
      WP_NewVersion:
        begin
          s:= string(msg.lParam);
          if length(s) > 0 then
          begin
            //version:= '0.5.0.0';    //Pour tester
           //ShowMessage(s);
            CurVer:= VersionToInt(version);
            NewVer:= VersionToInt(s);
            if NewVer > CurVer then
            begin
              AboutBox.LUpdate.Caption:= StringReplace(UpdateAvailable, '%s', s, [rfIgnoreCase]);
              if ShowAlert(Caption, UpdateAvailable, s, NoLongerChkUpdates, NoChkNewVer) then
              SBAboutClick(self);
            end;
          end;
        end;
    end;
  inherited;
end;

procedure TFPrgMgr.CreateTrayIcon(properties: TrayIconProps);
begin
  if Assigned(TrayProgman) then
  begin
    TrayProgman.Free;
    Application.ProcessMessages;
  end;
  TrayProgman:= TJvTrayIconN.Create(self);
  LoadTrayIconProps(TrayProps);
end;

// Sauvegarde des propri�t�s du trayicon

procedure TFPrgMgr.ReadTrayIconProps(var properties: TrayIconProps);
begin
  With properties do
  begin
    PrActive:= TrayProgman.Active;
    PrAnimated:= TrayProgman.Animated;
    PrDelay:= TrayProgman.Delay;
    // As Icon property is created from external file at design time, it will be lost
    // if we free the component, so we need to duplicate it before.
    If not Assigned (TrayProps.PrIcon) then TrayProps.PrIcon:= TIcon.Create;
    PrIcon.Handle:= DuplicateIcon(0, TrayProgman.Icon.Handle);
    PrIconIndex:= TrayProgman.IconIndex;
    PrIcons:= TrayProgman.Icons;
    PrHint:= TrayProgman.Hint;
    PrPopupMenu:= TrayProgman.PopupMenu;
    PrVisibility:= TrayProgman.Visibility;
    EvOnDblClick:= TrayProgman.OnDblClick;
    EvOnMinimizeToTray:=  TrayProgman.OnMinimizeToTray;
  end;
end;

procedure TFPrgMgr.LoadTrayIconProps(properties: TrayIconProps);
begin
  With properties do
  begin
    TrayProgman.Active:= PrActive;
    TrayProgman.Animated:= PrAnimated;
    TrayProgman.Delay:= PrDelay;
    TrayProgman.Icon:= PrIcon;
    TrayProgman.IconIndex:= PrIconIndex;
    TrayProgman.Icons:= PrIcons;
    TrayProgman.Hint:= PrHint;
    TrayProgman.PopupMenu:= PrPopupMenu;
    TrayProgman.Visibility:= PrVisibility;
    TrayProgman.OnDblClick:= EvOnDblClick;
    TrayProgman.OnMinimizeToTray:= EvOnMinimizeToTray;
  end;
end;


procedure TFPrgMgr.FormCreate(Sender: TObject);
const
  ChangeWMFProcName='ChangeWindowMessageFilter';
  MSGFLT_ADD = 1;
var
  lf: LOGFONT;
  AppData: string;
  FBuffer: array[0..MAX_PATH] of Char;
  ChangeWindowMessageFilter: function (msg : Cardinal; dwFlag : Word) : BOOL; stdcall;
begin
  Inherited;
  First:= True;
  //Obtain message value when task bar created 
   WM_TASKBAR_CREATED:= RegisterWindowMessage('TaskBarCreated');
   // Largeur minimum � la cr�ation
  FMinWidth := SBQuit.Left+SBQuit.Width+10+CBDisplay.Width+10+CBSort.Width+10+6;                 //Self.Width;
  // Redirect the ListView's WindowProc to ListViewWndProc
  FOrgListViewWndProc := ListView1.WindowProc;
  ListView1.WindowProc := ListViewWndProc;
  if (hUserDll<4) then
  begin
    hUserDll := LoadLibrary('user32.dll');
    if hUserDll > 3 then
    begin
      ChangeWindowMessageFilter := GetProcAddress(hUserDll, ChangeWMFProcName);
      If assigned(ChangeWindowMessageFilter) then
      begin
        ChangeWindowMessageFilter (WM_DROPFILES, MSGFLT_ADD);
        ChangeWindowMessageFilter (WM_COPYDATA, MSGFLT_ADD);
        ChangeWindowMessageFilter ($49, MSGFLT_ADD);
      end;
      DragAcceptFiles( ListView1.Handle , true);
    end;;
  end;
  ProgName:= ExtractFileName(Application.ExeName);
    // Dossiers sp�ciaux
  SHGetFolderPath(0,CSIDL_WINDOWS,0,SHGFP_TYPE_CURRENT,FBuffer) ;
  SystemRoot:= string(FBuffer);
  // Start Menu
  SHGetFolderPath(0,CSIDL_STARTMENU,0,SHGFP_TYPE_CURRENT,FBuffer) ;
  StartMenu:= string(FBuffer);
  SHGetFolderPath(0,CSIDL_DESKTOP,0,SHGFP_TYPE_CURRENT,FBuffer) ;
  Desktop:= String(FBuffer);
  // User Profile
  SHGetFolderPath(0,CSIDL_PROFILE,0,SHGFP_TYPE_CURRENT,FBuffer) ;
  UserProfile:= String(FBuffer);
  // application utilisateur
  SHGetFolderPath(0,CSIDL_APPDATA,0,SHGFP_TYPE_CURRENT,FBuffer) ;
  AppData:= string(FBuffer);
  // Dossier data de programmgr
  PrgMgrAppsData:= AppData+'\'+TrimFileExt(ProgName)+'\';
  if not DirectoryExists (PrgMgrAppsData) then
  begin
    CreateDir(PrgMgrAppsData);
  end;
  ListeFichiers:= TFichierList.Create;
  ImageList:= TImageList.Create(self);
  langue:= Lo(GetUserDefaultLangID);
  //langue:=  LANG_ITALIAN;
  If length(LangStr)= 0 then LangStr:= IntToStr(langue);
  // Chargement des cha�nes de langue...
  LangFile:= TIniFile.create(ExtractFilePath(Application.ExeName)+TrimFileExt(ProgName)+'.lng');
  LangNums:= TStringList.Create;

  // On r�cup�re la police des icones du bureau
  ZeroMemory(@lf, SizeOf(lf));
  if SystemParametersInfo(SPI_GETICONTITLELOGFONT, SizeOf(lf), @lf, 0) then
  begin
    ListView1.Font.Name:= PChar(Addr(lf.lfFaceName[0]));
    ListView1.Font.Height:= lf.lfHeight;
  end;
  if WinVersion1.VerMaj > 5 then   // Vista et apr�s
  IconDefFile:= SystemRoot+'\system32\imageres.dll' else
  IconDefFile:= SystemRoot+'\system32\shell32.dll'
end;

// Crop speedbutton images to popup menu images
procedure TFPrgMgr.CropBitmap(InBitmap, OutBitMap : TBitmap; Enabled: Boolean);//X, Y, W, H :Integer);
begin
  OutBitMap.PixelFormat := InBitmap.PixelFormat;
  OutBitmap.Width:= InBitMap.Height;  // as we can have double width or not in sbuttons
  OutBitmap.Height:= InBitMap.Height;
  // First or second image
  if Enabled then BitBlt(OutBitMap.Canvas.Handle, 0, 0, OutBitmap.Width, OutBitmap.Height, InBitmap.Canvas.Handle, 0, 0, SRCCOPY)
  else BitBlt(OutBitMap.Canvas.Handle, 0, 0, OutBitmap.Width, OutBitmap.Height, InBitmap.Canvas.Handle, OutBitmap.Height, 0, SRCCOPY);
end;

procedure TFPrgMgr.FormActivate(Sender: TObject);
var
  VersionInfo : TVerInfoObj;
begin
  inherited ;
  If not First then exit;
  PTrayMnuMaximize.Enabled:= True;
  PTrayMnuMinimize.Enabled:= True;
  PTrayMnuRestore.Enabled:= False;
  SBSave.Enabled:= False;
  // For popup menu, retrieve bitmap from buttons
  CropBitmap(SBGroup.Glyph, PmnuGroup.Bitmap, SBGroup.Enabled);
  CropBitmap(SBFolder.Glyph, PMnuFolder.Bitmap, SBFolder.Enabled);
  CropBitmap(SBAddFile.Glyph, PMnuAddFile.Bitmap, SBAddFile.Enabled);
  PmnuSaveEnable (False);
  CropBitmap(SBPrefs.Glyph, PMnuPrefs.Bitmap, SBPrefs.Enabled);
  CropBitmap(SBRefresh.Glyph, PMnuRefresh.Bitmap, SBRefresh.Enabled);
  CropBitmap(SBLoadConf.Glyph, PMnuLoadConf.Bitmap, SBLoadConf.Enabled);
  CropBitmap(SBAbout.Glyph, PMnuAbout.Bitmap, SBAbout.Enabled);
  CropBitmap(SBQuit.Glyph, PMnuQuit.Bitmap, SBQuit.Enabled);
  CropBitmap(SBAbout.Glyph, PTrayMnuAbout.Bitmap, SBAbout.Enabled);
  CropBitmap(SBQuit.Glyph, PTrayMnuQuit.Bitmap, SBQuit.Enabled);
  BarsHeight:= ClientHeight-ListView1.Height;
 
  First:= False;
  VersionInfo:= TVerInfoObj.Create (hInstance);
  Version:= VersionInfo.Values ['FileVersion'];
  //Version:= '0.5.0.0';
  VersionInfo.Free;
  UpdateUrl:= 'http://www.sdtp.com/versions/version.php?program=programgrpmgr&version=';
  ChkVerURL:= 'http://www.sdtp.com/versions/versions.csv';
  GroupName:= GetGrpParam;
  LoadGroup (GroupName);
end;

function TFPrgMgr.PMnuSaveEnable (Enabled: Boolean):Boolean;
begin
  PMnuSave.Enabled:= Enabled;
  If Enabled then CropBitmap(SBSave.Glyph, PMnuSave.Bitmap, Enabled)
  else CropBitmap(SBSave.Glyph, PMnuSave.Bitmap, Enabled);
  result:= Enabled;
end;

function TFPrgMgr.HidinTaskBar (enable: Boolean): boolean;
begin
  ShowWindow(Application.Handle, SW_HIDE) ;
  if enable then
  begin
    SetWindowLong(Application.Handle, GWL_EXSTYLE, getWindowLong(Application.Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW) ;
  end else
  begin
    SetWindowLong(Application.Handle, GWL_EXSTYLE, GetWindowLong(Application.Handle, GWL_EXSTYLE) and (not WS_EX_TOOLWINDOW));
  end;
  ShowWindow(Application.Handle, SW_SHOW) ;
  Result:= enable;
end;

procedure TFPrgMgr.LoadGroup(GrpName: String);
var
  i: Integer;
  LangFound: Bool;
  hWind: HWND;
begin
// D�termination de la langue
  GrpIconFile:= '';
  GrpIconIndex:= 0;
  GroupName:= GrpName;
  LangFound:= False;
  ListeFichiers.Clear;
  ListeFichiers.OnChange:= nil;
  LangFile.ReadSections(LangNums);
  LoadConfig(GroupName);
    if LangNums.Count > 1 then
    For i:= 0 to LangNums.Count-1 do
    begin
      FPrefs.CBLangue.Items.Add (LangFile.ReadString(LangNums.Strings[i],'Language', 'Aucune'));
      If LangNums.Strings[i] = LangStr then LangFound:= True;
    end;
  // Si la langue n'est pas traduite, alors on passe en Anglais
  If not LangFound then
  begin
    langue:= LANG_ENGLISH;
    LangStr:= IntToStr(langue);
  end;
  CurLang:= LangNums.IndexOf(LangStr);
  PrevLangStr:= LangStr;
  Modlangue;
  // Taille et position pr�c�dentes
  Try
    AppState:= StrToInt('$'+Copy(WState,1,4));
    Top:= StrToInt('$'+Copy(WState,5,4));
    Left:= StrToInt('$'+Copy(WState,9,4));
    Height:= StrToInt('$'+Copy(WState,13,4));
    Width:= StrToInt('$'+Copy(WState,17,4)) ;
  except
  end;
  // Restaure taille et position pr�c�dentes si demand�
  if SavSizePos then
  begin
    TrayProgman.Active:= MiniInTray;
    if Appstate = SW_SHOWMINIMIZED then
    begin
      If TrayProgman.Active then
      begin
        PTrayMnuMinimizeClick(self);
      end else
      begin
        ShowWindow(Application.Handle, AppState) ; //  Minimize in task bar is done on application, not on main form
      end;
    end else
    begin
      ShowWindow(Handle, AppState);  // Maximize is done on main form, not on application
    end;
    HidInTaskBar(HideInTaskBar and MiniInTray);     // ON ne cache que si l'icone est dans la zone de notification !!!
    PnlTools.Visible:= not HideBars;
    PnlStatus.Visible:= not HideBars;
    if HideBars then begin
      PMnuHideBars.Caption:= SMnuShowBars;
    end else
    begin
      PMnuHideBars.Caption:= SMnuMaskBars;
    end;
  end;
  // Si le m�me groupe est d�j� actif, on r�cup�re le handle de l'application qui est propri�taire de la fiche
  hWind:= GetWindow(FindWindow (Pchar('TFPrgMgr'), Pchar(GroupName)), GW_OWNER) ;
  If hWind > 0 then
  begin
     ShowWindow(hWind, SW_SHOWNORMAL);
     SetForeGroundWindow(hWind);
     Close;
  end;
  LVDisplayFiles;
  ListeFichiers.OnChange:=  ListeFichiersOnChange;
  Caption:= GroupName;
  Application.Title:= GroupName;
  If FileExists(GrpIconFile) then
  Application.Icon.Handle:= ExtractIcon(handle, PChar(GrpIconFile), GrpIconIndex) else GrpIconFile:= Application.ExeName;
  ImgPrgSel.Picture.Icon:= Application.Icon;
  TrayProgman.Icon:= Application.Icon;
  TrayProgman.Hint:= GrpName;
  LPrgSel.Caption:= Caption;
  ListView1.SetFocus;      // Eviter le focus sur une liste d�roulante ou autre chose
  //Version:= '0.5.0.0';
  ChkVersion;
  PnlToolsResize(Self);
end;

procedure TFPrgMgr.LoadCfgFile(FileName: String);
var
  CfgXML: TjanXMLParser2;
  iNode: TjanXMLNode2;
  NewFile: TFichier;
  Reg: TRegistry;
  LinkInfo: TShellLinkInfoStruct;
  s: String;
begin
  CfgXML:= TjanXMLParser2.create;
  CfgXML.LoadXML(FileName);
  try
    GroupName:= CfgXML.attribute['GroupName'];
    SavSizePos:= Bool(StrToInt(CfgXML.attribute['SavSizePos']));
    WState:= '';
    WState:= CfgXML.attribute['WState'];
    PrevWState:= WState;
   // PnlWinVer.Width:= StrToInt(CfgXML.attribute ['paneldescw']);
    GrpIconFile:= CfgXML.attribute ['grpiconfile'];
    PrevGrpIconFile:= GrpIconFile;
    GrpIconIndex:= StrToInt(CfgXML.attribute ['grpiconindex']);
    PrevGrpIconIndex:= GrpIconIndex;
    IconDisplay:= StrToInt(CfgXML.attribute ['icondisplay']);
    IconSort:= StrToInt(CfgXML.attribute ['iconsort']);
    LastUpdChk:= StrToDate(CfgXML.attribute ['LastUpdChk']);
    PrevLastUpdChk:= LastUpdChk;
    NoChkNewVer:= Bool(StrToInt(CfgXML.attribute ['NoChkNewVer']));
    PrevNoChkNewVer:= NoChkNewVer;
    StartWin:= Bool(StrToInt(CfgXML.attribute ['StartWin']));
    PrevStartWin:= StartWin;
    MiniInTray:= Bool(StrToInt(CfgXML.attribute ['MiniInTray']));
    PrevMiniInTray:= MiniInTray;
    HideInTaskBar:= Bool(StrToInt(CfgXML.attribute ['HideInTaskBar']));
    PrevHideInTaskBar:= HideInTaskBar;
    HideBars:= Bool(StrToInt(CfgXML.attribute ['HideBars']));
    PrevHideBars:= HideBars;
    LangStr:= CfgXML.attribute ['LangStr'];
  except
  end;
  ListeFichiers.Reset;
  try
    iNode := CfgXML.FirstChild;
    //i:= 0;
    while iNode <> nil do
    begin
      NewFile.Name:= iNode.Attribute['name'];
      NewFile.Path:= iNode.Attribute['path'];
      NewFile.DisplayName:= iNode.Attribute['displayname'];
      NewFile.Size:= StrToInt(iNode.Attribute['size']);
      NewFile.TypeName:= iNode.Attribute ['typename'];
      NewFile.Description:= iNode.Attribute ['description'];
      NewFile.Params:= iNode.Attribute ['params'];
      NewFile.StartPath:= iNode.attribute ['startpath'];
      if length(NewFile.Description) = 0 then
      begin
         ListeChange:= True;
         NewFile.Description:= NewFile.DisplayName;
         s:= NewFile.Path+NewFile.Name;
         StrPCopy(LinkInfo.FullPathAndNameOfLinkFile, s);
         GetLinkInfo(@LinkInfo);
         If StrLen (LinkInfo.Description) > 0 then NewFile.Description:= LinkInfo.Description;
      end;
      NewFile.Date:= StrToDateTime(iNode.Attribute['date']);
      NewFile.IconFile:= iNode.Attribute ['iconfile'];
      NewFile.IconIndex:= StrToInt(iNode.Attribute['iconindex']);
      ListeFichiers.AddFile(NewFile);
      //Inc(i) ;
      iNode := iNode.NextSibling;
    end;
   except
   end;
  FreeAndNil(CfgXML);
    //On v�rifie que ces valeurs sont bien dans le registre
  Reg:= TRegistry.Create;
  Reg.RootKey:= HKEY_CURRENT_USER;
  Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', True);
  if StartWin  then  // D�marrage avec Windows coch�
  begin
    if not Reg.ValueExists(TrimFileExt(ProgName)+'_'+GroupName) then
    reg.WriteString(TrimFileExt(ProgName)+'_'+GroupName, '"'+Application.ExeName+'" Grp='+GroupName) ;
    Reg.CloseKey;
  end else if Reg.ValueExists(TrimFileExt(ProgName)+'_'+GroupName) then
  begin
    Reg.DeleteValue(TrimFileExt(ProgName)+'_'+GroupName);
    Reg.CloseKey;
  end;
  Reg.Free;
end;

procedure TFPrgMgr.LoadConfig(GroupName: String);
var
  i: Integer;
begin
  ConfigFile:= PrgMgrAppsData+GroupName+'.xml';
  If not FileExists(ConfigFile) then
  begin
    If FileExists (PrgMgrAppsData+GroupName+'.bk0') then
    begin
      RenameFile(PrgMgrAppsData+GroupName+'.bk0', ConfigFile);
      For i:= 1 to 5
      do if FileExists (PrgMgrAppsData+GroupName+'.bk'+IntToStr(i))     // Renomme les pr�c�dentes si elles existent
       then  RenameFile(PrgMgrAppsData+GroupName+'.bk'+IntToStr(i), PrgMgrAppsData+GroupName+'.bk'+IntToStr(i-1));
    end else
    begin
      SaveConfig(GroupName, StateChanged)
    end;
  end;
  LoadCfgFile(ConfigFile);
end;

//

function TFPrgMgr.SaveConfig(GroupName: String; Typ: SaveType): Bool;
var
  CfgXML: TjanXMLParser2;
  iNode : TjanXMLNode2;
  WinPos : array [0..10] of Integer;
  i: integer;
  s, FilNamWoExt: String;
  Reg: TRegistry;
  WindowPlacement: TWindowPlacement;
begin
  If Typ = None then
  begin
    result:= True;
    exit;
  end;
  CfgXML:= TjanXMLParser2.create;
  ConfigFile:= PrgMgrAppsData+GroupName+'.xml';
  if FileExists(ConfigFile) then CfgXML.LoadXML(ConfigFile);
  // on le vide si Reset � True
  if Typ= All Then CfgXML.xml:='';
  CfgXML.name:= 'config';
  CfgXML.attribute ['GroupName']:= GroupName;
  CfgXML.attribute ['SavSizePos']:= IntToStr(Integer(SavSizePos));
  If CBDisplay.ItemIndex < 0 then CBDisplay.ItemIndex:= 3;
  CfgXML.attribute ['icondisplay']:= IntToStr(CBDisplay.ItemIndex);
  If CBSort.ItemIndex < 0 then CBSort.ItemIndex:= 0;
  CfgXML.attribute ['iconsort']:= IntToStr(CBSort.ItemIndex);
  CfgXML.attribute ['MiniInTray']:=  IntToStr(Integer(MiniInTray));
  CfgXML.attribute ['HideInTaskBar']:=  IntToStr(Integer(HideInTaskBar));
  CfgXML.attribute ['HideBars']:=  IntToStr(Integer(HideBars));
  // Position fen�tre
  WState:= '';
  If WindowState = wsMaximized then
  begin
    AppState :=  SW_SHOWMAXIMIZED;                   // Application is never maximized, only the main form
  end else
  begin
    GetWindowPlacement(Application.Handle, @WindowPlacement);
    AppState := WindowPlacement.showCmd;             // Elsewhere, we use the app placement
  end;
  WinPos[0]:= AppState;
  if Top < 0 then WinPos[1]:= 0 else WinPos[1]:= Top;
  if Left < 0 then WinPos[2]:= 0 else WinPos[2]:= Left;
  WinPos[3]:= Height;
  WinPos[4]:= Width;
  For i:= 0 to 4 do WState:=WState+IntToHex(WinPos[i], 4);
  CfgXML.attribute ['WState']:=  WState;
  CfgXML.attribute ['grpiconfile']:= GrpIconFile;
  CfgXML.attribute ['grpiconindex']:= IntToStr(GrpIconIndex);
  CfgXML.Attribute ['NoChkNewVer']:= IntToStr(Integer(NoChkNewVer));
  CfgXML.Attribute ['LastUpdChk']:= DateToStr (LastUpdChk);
  CfgXML.Attribute ['StartWin']:=IntToStr(Integer(StartWin));
  CfgXML.Attribute ['MiniInTray']:=IntToStr(Integer(MiniInTray));
  CfgXML.Attribute ['LangStr']:= LangStr;
  If Typ = All Then
    if ListeFichiers.Count > 0 then
    For i:= 0 to ListeFichiers.Count-1 do
    begin
      iNode:= TjanXMLNode2.create;
      iNode.name:= 'file';
      iNode.Attribute ['name']:= ListeFichiers.GetItem(i).Name;
      iNode.Attribute ['path']:= ListeFichiers.GetItem(i).Path;
      iNode.Attribute ['displayname']:= ListeFichiers.GetItem(i).DisplayName;
      iNode.Attribute ['params']:= ListeFichiers.GetItem(i).Params;
      iNode.Attribute ['startpath']:= ListeFichiers.GetItem(i).StartPath;
      iNode.Attribute ['size']:= IntToStr(ListeFichiers.GetItem(i).Size);
      iNode.Attribute ['typename']:= ListeFichiers.GetItem(i).TypeName;
      iNode.Attribute ['description']:= ListeFichiers.GetItem(i).Description;
      iNode.Attribute ['date']:= DateTimeToStr(ListeFichiers.GetItem(i).Date);
      iNode.attribute ['iconfile']:= ListeFichiers.GetItem(i).IconFile;
      iNode.attribute ['iconindex']:= IntToStr(ListeFichiers.GetItem(i).IconIndex);
      CfgXML.addNode (iNode);
    end;
    // Si n�cessaire on fait des sauvegardes
    s:= ExtractFileExt(ConfigFile);
    FilNamWoExt:= Copy (ConfigFile, 1, length(ConfigFile)-length(s));
    if FileExists (FilNamWoExt+'.bk5')                   // Efface la plus ancienne
    then  DeleteFile(FilNamWoExt+'.bk5');                // si elle existe
    For i:= 4 downto 0
    do if FileExists (FilNamWoExt+'.bk'+IntToStr(i))     // Renomme les pr�c�dentes si elles existent
       then  RenameFile(FilNamWoExt+'.bk'+IntToStr(i), FilNamWoExt+'.bk'+IntToStr(i+1));
    if FileExists (ConfigFile)
    then  RenameFile(ConfigFile, FilNamWoExt+'.bk0');
    // Et on sauvegarde la nouvelle config
    CfgXML.SaveXML (ConfigFile);
  //On v�rifie que ces valeurs sont bien dans le registre
  Reg:= TRegistry.Create;
  Reg.RootKey:= HKEY_CURRENT_USER;
  Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', True);
  if StartWin  then  // D�marrage avec Windows coch�
  begin
    if not Reg.ValueExists(TrimFileExt(ProgName)+'_'+GroupName) then
    reg.WriteString(TrimFileExt(ProgName)+'_'+GroupName, '"'+Application.ExeName+'" Grp='+GroupName) ;
     Reg.CloseKey;
  end else if Reg.ValueExists(TrimFileExt(ProgName)+'_'+GroupName) then
  begin
    Reg.DeleteValue(TrimFileExt(ProgName)+'_'+GroupName);
    Reg.CloseKey;
  end;
  Reg.Free;
  FreeAndNil(CfgXML);
  PrevAppState:= AppState;
  PrevWState:= WState;
  PrevLangStr:= LangStr;
  PrevGrpIconIndex:= GrpIconIndex;
  PrevLastUpdChk:= LastUpdChk;
  PrevNoChkNewVer:= NoChkNewVer;
  PrevStartWin:= StartWin;
  PrevStartMini:= StartMini;
  PrevMiniInTray:= MiniInTray;
  PrevWindowState:= WindowState;
  

  Result:= True;

end;

function TFPrgMgr.StateChanged : SaveType;
var
  WinPos : array [0..10] of Integer;
  i: Integer;
  WindowPlacement: TWindowPlacement;
begin
 If (WindowState = wsMinimized) then
  begin
    AppState := SW_SHOWMINIMIZED
  end else
  begin
    GetWindowPlacement(Handle, @WindowPlacement);
    AppState := WindowPlacement.showCmd;
  end;
 WState:= '';
  WinPos[0]:= AppState;
  if Top < 0 then WinPos[1]:= 0 else WinPos[1]:= Top;
  if Left < 0 then WinPos[2]:= 0 else WinPos[2]:= Left;
  WinPos[3]:= Height;
  WinPos[4]:= Width;
  For i:= 0 to 4 do WState:=WState+IntToHex(WinPos[i], 4);
  If ((WState<>PrevWState) or
           (GrpIconFile<>PrevGrpIconFile) or
           (GrpIconIndex <> PrevGrpIconIndex) or
           (LastUpdChk<>PrevLastUpdChk) or
           (NoChkNewVer<>PrevNoChkNewVer) or
           (StartWin<>PrevStartWin) or
           (LangStr<>PrevLangStr) or
           (FPrefs.ImgChanged) or
           (MiniInTray <> PrevMiniInTray) or
           (HideInTaskBar <> PrevHideInTaskBar) or
           (HideBars <> PrevHideBars)) then
  begin
    result:= State ;
  end else
  If ListeChange then begin
    result:= all;
  end else
  begin
    result:= none;
  end;
end;


procedure TFPrgMgr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If ListeChange then
  begin
    if WinVersion1.VerMaj > 5 then   // Vista et apr�s
    FSaveCfg.IconDefFile:= SystemRoot+'\system32\imageres.dll' else
    FSaveCfg.IconDefFile:= SystemRoot+'\system32\shell32.dll';
    FSaveCfg.EGrpName.Text:= GroupName;
    FSaveCfg.Image1.Picture.Icon:= Application.Icon;
    If FSaveCfg.Showmodal = mrOK then
    begin
      if FSaveCfg.RBtnSaveAs.Checked then
      begin
        if length(FSaveCfg.EGrpName.Text) > 0 then GroupName:= FSaveCfg.EGrpName.Text;
      end;

      if FSaveCfg.CBXShortCut.Checked then
      begin
        if length(FSaveCfg.IconFile) > 0 then GrpIconFile:= FSaveCfg.IconFile;
        if FSaveCfg.IconIndex >=0 then GrpIconIndex:= FSaveCfg.IconIndex;
        CreateShortcut(Application.ExeName, Desktop, GroupName, '','', 'Grp='+GroupName,
                       ShortCutName, GrpIconFile, GrpIconIndex);

      end;
      SaveConfig(GroupName, StateChanged);
    end;
  end else
  begin
    SaveConfig(GroupName, StateChanged);
    ListeChange:= False;
  end;
  ImageList.Free;
  ListeFichiers.Free;
  FreeAndNil(TrayProgman);
  FreeAndNil(langnums);
  FreeAndNil(langfile);
end;

procedure TFPrgMgr.ListeFichiersOnChange(sender: TObject);
begin
  ListeChange:= True;
  SBSave.Enabled:= True;
  PMnuSave.Enabled:= True;
  PMnuSaveEnable(True);
end;

function TFPrgMgr.NoRedirect(FilName: String):String;
var
  s: String;
begin
  result:= FilName;
  if not FileExists(FilName) then
  begin
    // in case of x64
    If WinVersion1.Ver64bit then
    begin
      s:= StringReplace(FilName, 'Program Files (x86)', 'Program Files', [rfIgnoreCase]);
      s:= StringReplace(s, '%SystemRoot%', SystemRoot,[rfIgnoreCase]);
      s:= StringReplace(s, 'System32', 'Sysnative',[rfIgnoreCase]);
      result:= StringReplace(s, '%UserProfile%', UserProfile,[rfIgnoreCase]);
    end;
  end;
end;

function TFPrgMgr.GetFile(FileName: string):TFichier;
var
  SearchRec: TSearchRec;
  FileInfo: SHFILEINFO;
  LinkInfo: TShellLinkInfoStruct;
  s, s1: string;
begin
  // Initialize file info structure
  ZeroMemory(@SearchRec, SizeOf(TSearchRec));
  FindFirst(FileName, faAnyFile, SearchRec);
  SHGetFileInfo(PChar(FileName), 0, FileInfo, SizeOf(FileInfo), SHGFI_DISPLAYNAME);
  Result.Name:= ExtractFileName(Filename);
  Result.Path:= ExtractFilePath(FileName);
  Result.DisplayName:= FileInfo.szDisplayName;
  Result.Description:= FileInfo.szDisplayName;
  Result.Size:= SearchRec.size;
  SHGetFileInfo(PChar(FileName), 0, FileInfo, SizeOf(FileInfo), SHGFI_TYPENAME);
  Result.TypeName:= 'Application' ;//FileInfo.szTypeName;
  try
    Result.Date:= FileDateToDateTime(FileAge(FileName));
  except
  end;
  Result.IconIndex:= 0;
  s:= FileName;
  //Initialize shortcut structure
  ZeroMemory(@LinkInfo, SizeOf(LinkInfo));
  StrPCopy (LinkInfo.FullPathAndNameOfLinkFile, s);
  GetLinkInfo(@LinkInfo);

  // Is it a shortcut
  // We replace shortcut link by real program location
  if Uppercase(ExtractFileExt(FileName))='.LNK' then
  begin
   If StrLen (LinkInfo.Description) > 0 then Result.Description:= LinkInfo.Description ;
   Result.Name:= ExtractFileName(LinkInfo.FullPathAndNameOfFileToExecute);
   Result.Path:= ExtractFilepath(NoRedirect(LinkInfo.FullPathAndNameOfFileToExecute));
   Result.StartPath:= LinkInfo.FullPathAndNameOfWorkingDirectroy;
   if StrLen(LinkInfo.FullPathAndNameOfFileContiningIcon) > 0
   then s1:= LinkInfo.FullPathAndNameOfFileContiningIcon else s1:= LinkInfo.FullPathAndNameOfFileToExecute;
   if length(s1) > 0 then
   begin
      Result.IconIndex:= LinkInfo.IconIndex;
      s:= NoRedirect(s1);
      Result.Params:= LinkInfo.ParamStringsOfFileToExecute;
      
    end;
  end;
  Result.IconFile:= s;
  if ExtractIcon(Handle, PChar(s), Result.IconIndex) = 0 then
  begin
    GetExtIconFile(Result.IconFile, Result.IconIndex, IconDefFile);
  end;

end;


function TFPrgMgr.ReadFolder(strPath: string; Directory: Bool): Integer;
var
  i: Integer;
  SearchRec: TSearchRec;
  FileAttr: Bool;
begin
  ListeFichiers.Reset;
  ZeroMemory(@SearchRec, SizeOf(TSearchRec));
  i := FindFirst(strPath + '*.*', faAnyFile, SearchRec);
  while i = 0 do
  begin
    FileAttr:= ((SearchRec.Attr and FaDirectory)<> FaDirectory) ;
    if FileAttr then ListeFichiers.AddFile(GetFile(strPath + SearchRec.Name));
    i := FindNext(SearchRec);
  end;
  Result:= ListeFichiers.Count;
end;



procedure TFPrgMgr.LVDisplayFiles;
const
 ExtractProcName='PrivateExtractIconsA';
type
  TExtractFunc = function(lpszFile: PChar; nIconIndex, cxIcon, cyIcon: integer; phicon: PHANDLE; piconid: PDWORD; nicon, flags: DWORD): DWORD; stdcall;
var
  PrivateExtractIcons:TExtractFunc;
  nIconId : DWORD;
  Flag: Integer;
  CurIcon: TIcon;
  hIcon: Thandle;
  i: Integer;
  w: Integer;
  ListItem: TListItem;
  FileInfo: SHFILEINFO;
  IcoSize: Integer;
  s: string;
begin
  if (hUserDll<4) then begin
    hUserDll := LoadLibrary('user32.dll');
    if (hUserDll<4) then exit;
  end;

  { PrivateExtractIcons:
    MSDN documentation says that this function could go away in a future windows
    version, so we must try to load it, and if it fails, return false, rather than
    doing a static DLL import.
  }
  PrivateExtractIcons := GetProcAddress(hUserDll, ExtractProcName);
  if ListeFichiers.Count = 0 then
  begin
    ListView1.Clear;
    exit;
  end;
  
  Case CBDisplay.ItemIndex of
    0: begin
         IcoSize:= 256;
         Flag:= SHIL_JUMBO;
       end;
    1: begin
         IcoSize:= 128;
         Flag:= SHIL_EXTRALARGE;
       end;
    2: begin
         IcoSize:= 48;
         Flag:= SHIL_EXTRALARGE;
       end;
    3: begin
         IcoSize:= 32;
         Flag:= SHIL_LARGE;
       end;
    4: begin
         IcoSize:= 16;
         Flag:= SHIL_SMALL;
       end;
    else begin
           IcoSize:= 32; // Default value
           Flag:= SHIL_SMALL;
         end;
  end;
  Case CBSort.ItemIndex of
    0: ListeFichiers.SortType:= cdcNone;
    1: begin
         ListeFichiers.SortDirection:= ascend;
         ListeFichiers.SortType:= cdcDisplayName;
       end;
    2: begin
         ListeFichiers.SortDirection:= descend;
         ListeFichiers.SortType:= cdcDisplayName;
       end;
    3: begin
         ListeFichiers.SortDirection:= ascend;
         ListeFichiers.SortType:= cdcDate;
       end;
    4: begin
         ListeFichiers.SortDirection:= descend;
         ListeFichiers.SortType:= cdcDate;
       end;
  end;
  ListeFichiers.DoSort;
  ListView1.Clear;
  ImageList.Clear;
  ImageList.Handle := ImageList_Create(IcoSize, IcoSize, ILC_COLOR32 or ILC_MASK, 0, ImageList.AllocBy);
  ListView1.LargeImages:= ImageList;
  // Create a temporary TIcon
  CurIcon := TIcon.Create;
  ListView1.Items.BeginUpdate;
  for i:= 0 to ListeFichiers.Count-1 do
  begin
    ListItem := ListView1.Items.Add;
    Listitem.Caption := ListeFichiers.GetItem(i).DisplayName;
    W:= LPrgSel.Canvas.TextWidth(ListItem.Caption);
    if W > oldw[0] then oldw[0]:= w;
    ListItem.SubItems.Add(IntToStr(ListeFichiers.GetItem(i).Size div 1024)+' Ko');
    W:= LPrgSel.Canvas.TextWidth(ListItem.SubItems[0]);
    if W > oldw[1] then oldw[1]:= w;
    ListItem.SubItems.Add(ListeFichiers.GetItem(i).TypeName);
    W:= LPrgSel.Canvas.TextWidth(ListItem.SubItems[1]);
    if W > oldw[2] then oldw[2]:= w;
    ListItem.SubItems.Add(DateTimeToStr(ListeFichiers.GetItem(i).Date));
    //Get The Icon That Represents The File
                    ListView1.ViewStyle:= vsIcon;
                    Case ListView1.ViewStyle of
      vsSmallIcon: begin
                     SHGetFileInfo(PChar(ListeFichiers.GetItem(i).Path + ListeFichiers.GetItem(i).Name), 0, FileInfo,
                                   SizeOf(FileInfo), SHGFI_ICON or SHGFI_SMALLICON);
                     curicon.Handle := FileInfo.hIcon;
                     ListItem.ImageIndex := ImageList.AddIcon(Icon);
                   end;
      vsReport:   begin
                    SHGetFileInfo(PChar(ListeFichiers.GetItem(i).Path + ListeFichiers.GetItem(i).Name), 0, FileInfo,
                                  SizeOf(FileInfo), SHGFI_ICON or SHGFI_SMALLICON);
                    curicon.Handle := FileInfo.hIcon;
                    ListItem.ImageIndex := ImageList.AddIcon(Icon);
                  end;
     vsIcon     : begin
                    If Assigned(PrivateExtractIcons) then
                    begin
                      If PrivateExtractIcons ( PChar(ListeFichiers.GetItem(i).IconFile), ListeFichiers.GetItem(i).IconIndex,
                                            icoSize, icoSize, @hIcon, @nIconId, 1, LR_LOADFROMFILE) <>0 then
                      ListItem.ImageIndex := ImageList_AddIcon(ImageList.Handle, hIcon);
                    end else
                    begin
                       s:= ListeFichiers.GetItem(i).IconFile;
                       //if (not FileExists (s)) or (ListeFichiers.GetItem(i).IconIndex > 0) then s:= ListeFichiers.GetItem(i).Path+ListeFichiers.GetItem(i).Name;
                       GetIconFromFile(s ,CurIcon, Flag, w);
                       ListItem.ImageIndex := ImageList_AddIcon(ImageList.Handle, CurIcon.Handle);
                    end;
                  end;
    end;
    // Destroy the Icon
    DestroyIcon(hIcon);
  end;
  if (hUserDll>4) then
  FreeLibrary(hUserDll);
  CurIcon.Free;
  ListView1.Items.EndUpdate;
end;

procedure TFPrgMgr.ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
  var
   intItem1,
   intItem2: TDateTime;
begin
   intItem1 := StrToDateTime(Item1.SubItems[2]) ;
   intItem2 := StrToDateTime(Item2.SubItems[2]);

   if intItem1 < intItem2 then
     Compare := -1
   else
   if intItem1 > intItem2 then
     Compare := 1
   else // intItem1 = intItem2
     Compare := 0;        
end;

procedure TFPrgMgr.ListView1DblClick(Sender: TObject);
begin
  PMnuRunClick(Sender);
end;





procedure TFPrgMgr.CBDisplayChange(Sender: TObject);
begin
  LVDisplayFiles;
  ListeChange:= True;
  SBSave.Enabled:= True;
  PMnuSave.Enabled:= PMnuSaveEnable(True);
end;


procedure TFPrgMgr.ListView1InfoTip(Sender: TObject; Item: TListItem;
  var InfoTip: String);
begin
  InfoTip := ListeFichiers.GetItem(Item.Index).Description ;
end;

procedure TFPrgMgr.LVPMnuPopup(Sender: TObject);
var
  selectedItem : TListItem;
begin
  selectedItem := ListView1.Selected;
  If selectedItem <> nil then
  begin
    PMnuRun.Visible:= True;
    if WinVersion1.VerMaj > 5 then PMnuRunAs.Visible:= True;  // Vista et apr�s
    PMnuProps.Visible:= True;
    PMnuDelete.Visible:= True;
    PMnuHideBars.Visible:= False;
    PMnuGroup.Visible:= False;
    PMnuFolder.Visible:= False;
    PMnuAddFile.Visible:= False;
    PMnuSave.Visible := False;
    PMnuPrefs.Visible:= False;
    PMnuRefresh.Visible:= False;
    PMnuLoadConf.Visible:= False;
    PMnuAbout.Visible:= False;
    PMnuQuit.Visible:= False;
  end else
  begin
    PMnuRun.Visible:= False;
    PMnuRunAs.Visible:= False;
    PMnuProps.Visible:= False;
    PMnuDelete.Visible:= False;
    PMnuHideBars.Visible:= True;
    PMnuGroup.Visible:= True;
    PMnuFolder.Visible:= True;
    PMnuAddFile.Visible:= True;
    PMnuSave.Visible:= True;
    PMnuPrefs.Visible:= True;
    PMnuRefresh.Visible:= True;
    PMnuLoadConf.Visible:= True;
    PMnuAbout.Visible:= True;
    PmnuQuit.Visible:= True;
  end;
end;

procedure TFPrgMgr.PMnuDeleteClick(Sender: TObject);
var
 i: Integer;
 s: string;
begin
  With ListView1 do
  begin
    if SelCount = 0 then exit
    else
    begin
      If Selcount > 1 then s:= 's' else s:= '';
      If MsgDlg (Caption, Format(DeleteOKMsg, [SelCount, s]),
                   mtWarning,[mbYes, mbNo],0) = mrYes then
        for i :=Items.Count-1 downto 0 do
        begin
          if Items[i].Selected then
          ListeFichiers.Delete(i);
        end;
      end;
  end;
  LVDisplayFiles;
end;

procedure TFPrgMgr.PMnuRunClick(Sender: TObject);
var
 Item : TListItem;
 LinkInfo: TShellLinkInfoStruct;
 s, sparam, sstartpath: string;
begin
  Item := ListView1.Selected;
  If Item <> nil then
  begin
    s:= ListeFichiers.GetItem(Item.Index).Path + ListeFichiers.GetItem(Item.index).Name;
    sparam:= ListeFichiers.GetItem(Item.Index).Params;
    sstartpath:= ListeFichiers.GetItem(Item.Index).StartPath;
    //if WinVersion1.Ver64bit then
    begin
      // if it is a link
      ZeroMemory(@LinkInfo, SizeOf(LinkInfo));
      StrPCopy (LinkInfo.FullPathAndNameOfLinkFile, s);
      GetLinkInfo(@LinkInfo);
      if StrLen(LinkInfo.FullPathAndNameOfFileToExecute) > 0 then
      begin
        if WinVersion1.Ver64bit then
        begin
          if not FileExists(LinkInfo.FullPathAndNameOfFileToExecute) then
          begin
            s:= StringReplace(LinkInfo.FullPathAndNameOfFileToExecute, 'Program Files (x86)', 'Program Files', [rfIgnoreCase]);
            s:= StringReplace(s, 'System32', 'Sysnative', [rfIgnoreCase]);
          end;
        end;
        if length(sparam) = 0 then sparam:= LinkInfo.ParamStringsOfFileToExecute;
        if length(sstartpath) = 0 then sstartpath:= LinkInfo.FullPathAndNameOfWorkingDirectroy;
      end;
    end;
    // ShowMessage(s);
    If UpperCase(Tcomponent(Sender).Name) = 'PMNURUN' then Exec(0, s , 'open', sparam, sstartpath);    // Run menu
    If UpperCase(Tcomponent(Sender).Name) = 'LISTVIEW1' then Exec(0, s ,'open', sparam, sstartpath);  // Double click Listview item
    If UpperCase(Tcomponent(Sender).Name) = 'PMNURUNAS' then Exec(0, s ,'runas', sparam, sstartpath); // Run As admin menu
  end;
end;

procedure TFPrgMgr.PMnuPropsClick(Sender: TObject);
var
 Item : TListItem;
 MyFichier: TFichier;
 OldTarget: String;
 Oldpath: String;
begin
  Item := ListView1.Selected;
  If Item <> nil then
begin
    Fproperty.IconDefFile:= IconDefFile;
    MyFichier:=  ListeFichiers.GetItem(Item.Index);
    Fproperty.IconFile:= MyFichier.IconFile;
    Fproperty.IconIndex:= MyFichier.IconIndex;
    Fproperty.Image1.Picture.Icon.Handle:= ExtractIcon(Handle, PChar(MyFichier.IconFile), MyFichier.IconIndex);
    Fproperty.Caption:= Format(FpropertyCaption, [MyFichier.DisplayName]);
    //'Propri�t�s de '+MyFichier.DisplayName;
    FProperty.EDisplayName.Text:= MyFichier.DisplayName;
    FProperty.LTypeName.Caption:= MyFichier.TypeName;
    FProperty.ECible.Text:= MyFichier.Path+ MyFichier.Name;
    FProperty.EParams.Text:= MyFichier.Params;
    OldTarget:= FProperty.ECible.Text;
    Fproperty.EPath.Text:= MyFichier.StartPath;
    Oldpath:= Fproperty.EPath.Text;
    FProperty.Memo1.Text:= MyFichier.Description;
    if FProperty.Showmodal = mrOK then
    begin
      if FProperty.ECible.Text <> OldTarget then
      begin
         ZeroMemory(@MyFichier, sizeOf(MyFichier));
         MyFichier:= GetFile(FProperty.ECible.Text);
      end else
      begin
        MyFichier.StartPath:= Fproperty.EPath.Text;
        MyFichier.IconFile:= Fproperty.IconFile;
        MyFichier.IconIndex:= Fproperty.IconIndex;
        MyFichier.DisplayName:= FProperty.EDisplayName.Text;
        MyFichier.Description:= FProperty.Memo1.Text;
        MyFichier.Params:= FProperty.EParams.Text;

      end;
      ListeFichiers.ModifyFile(Item.Index, MyFichier );
      LVDisplayFiles;
    end;

  end;
end;



function TFPrgMgr.GetGrpParam: String;

var
  s: string;
  s1: string;
  p: Integer;
  param: String;
begin
  Result:= 'Default';


  s:= GetCommandLine;
  p:= Pos(Application.ExeName, s);
  if p > 0 then
  begin
    s1:= Copy(s, p+length(Application.ExeName), length(s));
    if (s1[1]= #34) or (s1[1]= #39) then
    s1:= Copy(s1, 3, length(s1)) else
    s1:= Copy(s1, 2, length(s1));
    if length(s1) > 0 then
    begin
      s1:= StringReplace(s1, #34, '', [rfReplaceAll]);
      param:= StringReplace(s1, #39, '', [rfReplaceAll]);
      p:= Pos('Grp=', param);
      if p > 0 then GroupName:= Copy(param, p+4, length(param));

     Result := GroupName;
    end;
  end;
end;

procedure TFPrgMgr.SBFolderClick(Sender: TObject);
begin
  
  dlgTitle:= SBrow1.Caption;
  SBrow1.InitialPath:= StartMenu;
  Timer1.Enabled:= True;
  if SBrow1.Execute then
  begin
    CBDisplay.ItemIndex:= 2;
    CBSort.ItemIndex:= 1;
    curdir:= SBrow1.PathName+'\';
    ReadFolder(curdir, False);
    LVDisplayFiles;

  end;
  Timer1.Enabled:= False;

end;

procedure TFPrgMgr.SBAddFileClick(Sender: TObject);
begin
  Invalidate;                   // Update coordinates
  dlgTitle:= ODlg1.Title;
  Timer1.Enabled:= True;
  If ODlg1.Execute then
  begin
    ListeFichiers.AddFile(GetFile(ODlg1.FileName));
    LVDisplayFiles;
  end;
  Timer1.Enabled:= False;
end;


 procedure TFPrgMgr.ModLangue ;
begin
//ShowMessage(LangStr);
With LangFile do
  begin
    // MessageBox buttons
    YesBtn:= ReadString(LangStr, 'YesBtn', 'Oui');
    NoBtn:= ReadString(LangStr, 'NoBtn', 'Non');
    CancelBtn:= ReadString(LangStr, 'CancelBtn', 'Annuler');
    HookResourceString(@SMsgDlgYes, PChar(YesBtn));
    HookResourceString(@SMsgDlgNo, PChar(NoBtn));
    HookResourceString(@SMsgDlgCancel, PChar(CancelBtn));
    //Form
    CBDisplay.Items.Text:= StringReplace(ReadString(LangStr, 'CBDisplay.Items.Text',
                       ''),
                       '%s', #13#10, [rfReplaceAll]);
    CBDisplay.ItemIndex:= IconDisplay;
    CBSort.Items.Text:=  StringReplace(ReadString(LangStr, 'CBSort.Items.Text',
                       'Pas de tri%sTri par nom (ascendant)%sTri par nom (descendant)%sTri par date (ascendant)%sTri par date (descendant)'),
                      '%s', #13#10, [rfReplaceAll]);
    CBSort.ItemIndex:= IconSort;
    SBrow1.Caption:= ReadString(LangStr, 'SBrow1.Caption', SBrow1.Caption);
    SBrow1.Prompt:= ReadString(LangStr, 'SBrow1.Prompt',  SBrow1.Prompt);
    SBrow1.CancelBtnCaption:= CancelBtn; //ReadString(LangStr, 'SBrow1.CancelBtnCaption', SBrow1.CancelBtnCaption);
    SBGroup.Hint:= ReadString(LangStr, 'SBGroup.Hint', SBGroup.Hint);
    SBFolder.Hint:= ReadString(LangStr, 'SBFolder.Hint', SBFolder.Hint);
    SBAddFile.Hint:= ReadString(LangStr, 'SBAddFile.Hint', SBAddFile.Hint);
    SBAbout.Hint:= ReadString(LangStr, 'SBAbout.Hint', SBAbout.Hint);
    SBSave.Hint:=  ReadString(LangStr, 'SBSave.Hint', SBSave.Hint);
    SBPrefs.Hint:= ReadString(LangStr, 'SBPrefs.Hint', SBPrefs.Hint);
    SBRefresh.Hint:= ReadString(LangStr, 'SBRefresh.Hint', SBRefresh.Hint);
    SBQuit.Hint:= ReadString(LangStr, 'SBQuit.Hint', SBQuit.Hint);
    SBLoadConf.Hint:= ReadString(LangStr, 'SBLoadConf.Hint', SBLoadConf.Hint);
    ODlg1.Title:= ReadString(LangStr, 'ODlg1.Title', ODlg1.Title);
    PMnuRun.Caption:= ReadString(LangStr, 'PMnuRun.Caption', PMnuRun.Caption);
    PMnuRunAs.Caption:= ReadString(LangStr, 'PMnuRunAs.Caption', PMnuRunAs.Caption);
    PMnuProps.Caption:= ReadString(LangStr, 'PMnuProps.Caption', PMnuProps.Caption);
    PMnuDelete.Caption:= ReadString(LangStr, 'PMnuDelete.Caption', PMnuDelete.Caption);
    PMnuGroup.Caption:= SBGroup.Hint;
    PMnuFolder.Caption:= SBFolder.Hint;
    PMnuAddFile.Caption:= SBAddFile.Hint;
    PMnuAbout.Caption:= SBAbout.Hint;
    PMnuSave.Caption:= SBSave.Hint;
    PMnuPrefs.Caption:= SBPrefs.Hint;
    PMnuRefresh.Caption:= SBRefresh.Hint;
    PMnuLoadConf.Caption:= SBLoadConf.Hint;
    PMnuQuit.Caption:= ReadString(LangStr, 'PMnuQuit.Caption', PMnuQuit.Caption);

    PTrayMnuRestore.Caption:= ReadString(LangStr, 'PTrayMnuRestore.Caption', PTrayMnuRestore.Caption);
    PTrayMnuMinimize.Caption:= ReadString(LangStr, 'PTrayMnuMinimize.Caption', PTrayMnuMinimize.Caption);
    PTrayMnuMaximize.Caption:= ReadString(LangStr, 'PTrayMnuMaximize.Caption', PTrayMnuMaximize.Caption);
    PTrayMnuAbout.Caption:= SBAbout.Hint;
    PTrayMnuQuit.Caption:= PMnuQuit.Caption;

    SMnuMaskBars:= LangFile.ReadString(LangStr, 'PMnuMaskBars','Masquer la barre de boutons');
    SMnuShowBars:= LangFile.ReadString(LangStr, 'PMnuShowBars','Afficher la barre de boutons');
    if HideBars then PMnuHideBars.Caption:= SMnuShowBars
    else PMnuHideBars.Caption:= SMnuMaskBars;
    ShortCutName:= ReadString(LangStr, 'ShortCutName', 'Gestionnaire de groupe de programmes');

    DeleteOKMsg:= ReadString(LangStr, 'DeleteOKMsg', 'Vous allez effacer %u �l�ment%s. Etes-vous sur ?');

    UpdateAvailable:=ReadString(LangStr, 'UpdateAvailable', 'Nouvelle version %s disponible');
    LUpdateCaption:= ReadString(LangStr, 'LUpdateCaption', 'Recherche de mise � jour');
    LastChkCaption:= ReadString(LangStr, 'LastChkCaption', 'Derni�re v�rification');
    LastUpdateSearch:= ReadString(LangStr, 'LastUpdateSearch', 'Derni�re recherche de mise � jour');
    NoLongerChkUpdates:= ReadString(LangStr, 'NoLongerChkUpdates', 'Ne plus rechercher les mises � jour');
    NextChkCaption:= ReadString(LangStr, 'NextChkCaption', 'Prochaine v�rification');
    NoDeleteGroup:= ReadString(LangStr, 'NoDeleteGroup', 'Impossible de supprimer le groupe en cours');
    DeleteGrpMsg:= ReadString(LangStr, 'DeleteGrpMsg', 'Vous allez effacer le groupe %s. Etes-vous sur ?');

    FSaveCFG.Caption := ReadString(LangStr, 'FSaveCFG.Caption', FSaveCFG.Caption);
    FSaveCfg.Label1.Caption:= StringReplace(ReadString(LangStr, 'FSaveCfg.Label1.Caption',
                               'Le groupe de programmes a �t� mofifi�.%sVoulez-vous enregistrer ces modifications ?'),
                                '%s', #13#10, [rfReplaceAll]);
    FSaveCfg.RBtnSave.Caption:= ReadString(LangStr, 'FSaveCfg.RBtnSave.Caption', FSaveCfg.RBtnSave.Caption);
    FSaveCfg.RBtnSaveAs.Caption:= ReadString(LangStr, 'FSaveCfg.RBtnSaveAs.Caption', FSaveCfg.RBtnSaveAs.Caption);
    FSaveCfg.CBXShortCut.Caption:= ReadString(LangStr, 'FSaveCfg.CBXShortCut.Caption', FSaveCfg.CBXShortCut.Caption);
    FSaveCfg.Label2.Caption:= ReadString(LangStr, 'FSaveCfg.Label2.Caption', FSaveCfg.Label2.Caption);
    FSaveCfg.Image1.Hint:= ReadString(LangStr, 'FSaveCfg.Image1.Hint', FSaveCfg.Image1.Hint);
    FSaveCfg.BtnCancel.Caption:= CancelBtn;
    //ReadString(LangStr, 'FSaveCfg.BtnCancel.Caption', FSaveCfg.BtnCancel.Caption);
    AboutBox.Caption:= SBAbout.Hint;

    FPrefs.Caption:= ReadString(LangStr, 'FPrefs.Caption', FPrefs.Caption);
    FPrefs.CBStartWin.Caption:= ReadString(LangStr, 'FPrefs.CBStartWin.Caption', Fprefs.CBStartWin.Caption);
    FPrefs.CBSavSizePos.Caption:= ReadString(LangStr, 'FPrefs.CBSavSizePos.Caption',  FPrefs.CBSavSizePos.Caption);
    FPrefs.CBNoChkNewVer.Caption:= ReadString(LangStr, 'FPrefs.CBNoChkNewVer.Caption', FPrefs.CBNoChkNewVer.Caption);
    FPrefs.LLangue.Caption:= ReadString(LangStr, 'FPrefs.LLangue.Caption', FPrefs.LLangue.Caption);
    FPrefs.BtnCancel.Caption:= CancelBtn;
    FPrefs.CBMiniInTray.Caption:= ReadString(LangStr, 'FPrefs.CBMiniInTray.Caption', FPrefs.CBMiniInTray.Caption);
    FPrefs.CBMiniInTray.Hint:= ReadString(LangStr, ' FPrefs.CBMiniInTray.Hint',  FPrefs.CBMiniInTray.Hint);
    FPrefs.CBHideInTaskBar.Caption:= ReadString(LangStr, 'FPrefs.CBHideInTaskBar.Caption', FPrefs.CBHideInTaskBar.Caption);
    FPrefs.CBHideInTaskBar.Hint:= ReadString(LangStr, 'FPrefs.CBHideInTaskBar.Hint',  FPrefs.CBHideInTaskBar.Hint);

    FPrefs.ImgPrefs.Hint:= ReadString(LangStr, 'FPrefs.ImgPrefs.Hint', FPrefs.ImgPrefs.Hint);

    FPropertyCaption:= ReadString(LangStr, 'FPropertyCaption', 'Propri�t�s de %s');
    FProperty.TSGeneral.Caption:= ReadString(LangStr, 'FProperty.TSGeneral.Caption', FProperty.TSGeneral.Caption);
    FProperty.LFileType.Caption:= ReadString(LangStr, 'FProperty.LFileType.Caption', FProperty.LFileType.Caption);
    FProperty.LDescription.Caption:= ReadString(LangStr, 'FProperty.LDescription.Caption', FProperty.LDescription.Caption);
    //FProperty.Caption:= FPropertyCaption;
    FProperty.Image1.Hint:= FSaveCfg.Image1.Hint;
    FProperty.BtnCancel.Caption:= CancelBtn; //FSaveCfg.BtnCancel.Caption;
    FProperty.LCible.Caption:= ReadString(LangStr, 'FProperty.LCible.Caption', FProperty.LCible.Caption);
    FProperty.SBCible.Hint:= ReadString(LangStr, 'FProperty.SBCible.Hint', FProperty.SBCible.Hint);
    FProperty.LParams.Caption:= ReadString(LangStr, 'FProperty.LParams.Caption', FProperty.LParams.Caption);
    Fproperty.LPath.Caption:= ReadString(LangStr, 'Fproperty.LPath.Caption', Fproperty.LPath.Caption);

    FLoadGroup.Caption:= SBGroup.Hint;
    FLoadGroup.BtnNew.Caption:= ReadString(LangStr, 'FLoadGroup.BtnNew.Caption', FLoadGroup.BtnNew.Caption);
    FLoadGroup.BtnDelete.Caption:= ReadString(LangStr, 'FLoadGroup.BtnDelete.Caption', FLoadGroup.BtnDelete.Caption);
    FLoadGroup.BtnCancel.Caption:= CancelBtn; //SBrow1.CancelBtnCaption;

    FloadConf.Caption:= ReadString(LangStr, 'FloadConf.Caption', FloadConf.Caption);
    FLoadConf.BtnApply.Caption:= ReadString(LangStr, 'FLoadConf.BtnApply.Caption', FLoadConf.BtnApply.Caption);
    FLoadConf.BtnCancel.Caption:= ReadString(LangStr, 'FLoadConf.BtnCancel.Caption', FLoadConf.BtnCancel.Caption);
  end;
end;

procedure TFPrgMgr.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);

begin
     If Item <> nil then
     try
       LPrgSel.Caption:= ListeFichiers.GetItem(Item.index).Description;
       ImgPrgSel.Picture.Icon.Handle:= ExtractIcon (handle, PChar(ListeFichiers.GetItem(Item.index).IconFile), ListeFichiers.GetItem(Item.index).IconIndex);
     except
     end;
   //

end;

procedure TFPrgMgr.PnlToolsResize(Sender: TObject);
begin
  CBSort.Left:= PnlTools.Width-CBSort.Width-8;
  CBDisplay.Left:= CBSort.Left- CBDisplay.Width-6;
end;

procedure TFPrgMgr.SBAboutClick(Sender: TObject);
begin

  AboutBox.UrlUpdate:= UpdateURl+Version;
  AboutBox.LUpdate.Caption:= LUpdateCaption;
  AboutBox.LastUpdate:= LastUpdChk;
  AboutBox.LUpdate.Hint:=  LastUpdateSearch+': '+DateToStr(AboutBox.LastUpdate);
  AboutBox.ShowModal;
  LastUpdChk:= AboutBox.LastUpdate;

end;

procedure TFPrgMgr.SBrow1SelChange(Sender: TObject; NewFolder: String;
  IsDisplayName: Boolean);
begin
  SBrow1.StatusText:= NewFolder;
end;

procedure TFPrgMgr.ListView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_DELETE) THEN PMnuDeleteClick(Sender);
end;

procedure TFPrgMgr.SBSaveClick(Sender: TObject);

begin
  if WinVersion1.VerMaj > 5 then   // Vista et apr�s
  FSaveCfg.IconDefFile:= SystemRoot+'\system32\imageres.dll' else
  FSaveCfg.IconDefFile:= SystemRoot+'\system32\shell32.dll';
  FSaveCfg.EGrpName.Text:= GroupName;
  FSaveCfg.Image1.Picture.Icon:= Application.Icon;
  If FSaveCfg.Showmodal = mrOK then
  begin
    if FSaveCfg.RBtnSaveAs.Checked then
    begin
      if length(FSaveCfg.EGrpName.Text) > 0 then GroupName:= FSaveCfg.EGrpName.Text;
    end;

    if FSaveCfg.CBXShortCut.Checked then
    begin
      if length(FSaveCfg.IconFile) > 0 then GrpIconFile:= FSaveCfg.IconFile;
      if FSaveCfg.IconIndex >=0 then GrpIconIndex:= FSaveCfg.IconIndex;
      CreateShortcut(Application.ExeName, Desktop, GroupName, '','', 'Grp='+GroupName,
                       ShortCutName, GrpIconFile, GrpIconIndex);

    end;
    SaveConfig(GroupName, StateChanged);
     ListeChange:= False;
     SBSave.Enabled:= False;
     PMnuSave.Enabled:= PMnuSaveEnable(False);

  end ;
 
end;

function TFPrgMgr.ShowAlert(Title, AlertStr, StReplace, NoShow: String; var Alert: Boolean):Boolean;
begin
  Result:= False;
  With AlertBox do
  begin
    Caption:= Title;
    Image1.Picture.Icon:= Application.Icon;
    MAlert.Text:= StringReplace(AlertStr, '%s', stReplace, [rfIgnoreCase, rfReplaceAll]);
    CBNoShowAlert.Caption:= NoShow;
    CBNoShowAlert.Checked:= Alert;
    if not Alert then
   if  ShowModal = mrOK then result:= True;
    Alert:= CBNoShowAlert.Checked;
  end;
end;

procedure TFPrgMgr.ChkVersion;
begin
  //
  //Derni�re recherche il y a plus de 7 jours ?
  if (Trunc(Now) > LastUpdChk+7) and (not NoChkNewVer) then
  begin
    //ShowMessage(ChkVerURL);
    LastUpdChk:= Trunc(Now);
    FChkNewVer.GetLastVersion (ChkVerURL, 'programgrpmgr', Handle);
  end;
end;

procedure TFPrgMgr.SBPrefsClick(Sender: TObject);
begin
  With FPrefs do
  begin

    LWinVer.Caption:= ' '+WinVersion1.VerDetail;
    if WinVersion1.VerMaj > 5 then   // Vista et apr�s
    IconDefFile:= SystemRoot+'\system32\imageres.dll' else
    IconDefFile:= SystemRoot+'\system32\shell32.dll';
    ImgPrefs.Picture.Icon:= Application.Icon;
    CBLangue.ItemIndex:= CurLang;
    CBStartWin.Checked:= StartWin;
   // CBStartMini.Checked:= StartMini;
    CBSavSizePos.Checked:= SavSizePos;
    CBNoChkNewVer.Checked:= NoChkNewVer;
    CBMiniInTray.Checked:= MiniInTray;
    CBHideInTaskbar.Enabled:= MiniInTray;
    CBHideInTaskbar.checked:= HideInTaskbar;
    if ShowModal = mrOK then
    begin
      //CurLang:= CBLangue.ItemIndex;
      If CBLangue.ItemIndex <> CurLang then
      begin
        CurLang:= CBLangue.ItemIndex;
        LangStr:= LangNums[CurLang];
        ModLangue;
      end;
      StartWin:= CBStartWin.Checked;
      SavSizePos:= CBSavSizePos.Checked;
      NoChkNewVer:= CBNoChkNewVer.Checked;
      MiniInTray:= CBMiniInTray.Checked;
      if ImgChanged then
      begin
        Application.Icon:= ImgPrefs.Picture.Icon ;
        ImgPrgSel.Picture.Icon:= Application.Icon;
        GrpIconFile:= IconFile;
        GrpIconIndex:= IconIndex;
        SBSave.Enabled:= True;
        PMnuSave.Enabled:= PmnuSaveEnable(True);

        ImgChanged:= False;
      end;
    end;
    HideInTaskBar:= CBHideInTaskbar.Checked;
    HidinTaskBar(HideInTaskBar and MiniInTray);
    if CBXShortCut.Checked then
    begin
      CreateShortcut(Application.ExeName, Desktop, GroupName, '','', 'Grp='+GroupName,
                       ShortCutName, GrpIconFile, GrpIconIndex);
    end;
    TrayProgman.Active:= MiniInTray;
    SaveConfig(GroupName, StateChanged);
    
  end;
end;



procedure TFPrgMgr.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
if (Msg.message = WM_DROPFILES) and (Msg.hwnd = ListView1.Handle) then

begin

//Beep;

end;
end;

procedure TFPrgMgr.SBRefreshClick(Sender: TObject);
var
  i: Integer;
  MyFichier: TFichier;
begin
  For i:= 0 to ListeFichiers.Count-1 do
  begin
    MyFichier:= GetFile (ListeFichiers.GetItem(i).Path+ListeFichiers.GetItem(i).Name);
    ListeFichiers.ModifyFile(i, MyFichier);
    LVDisplayFiles;
  end;
end;

procedure TFPrgMgr.ListView1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Pt: Tpoint;
  currentItem, nextItem, dropItem : TListItem;
begin
  if Sender = Source then
  begin
    with TListView(Sender) do
    begin
      Pt.X:= X;
      Pt.Y:= Y;
      DropItem:= GetItemAt(X,Y);
      If DropItem = nil then DropItem:= GetNearestItem(Pt, sdAll);
      currentItem := Selected;
      while currentItem <> nil do
      begin
        NextItem := GetNextItem(currentItem, SdAll, [IsSelected]) ;
        if CBSort.ItemIndex <> 0 then CBSort.ItemIndex:= 0;  // Pas de tri !!!
        if Assigned(dropItem) then  ListeFichiers.DoMove(currentItem.Index, DropItem.Index)
        else ListeFichiers.DoMove(currentItem.Index, ListeFichiers.Count-1);
        currentItem.Free;
        currentItem := nextItem;
      end;
      LVDisplayFiles;
    end;
  end;
end;

procedure TFPrgMgr.ListView1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);

begin
  Accept := Sender = ListView1;
end;

procedure TFPrgMgr.SBGroupClick(Sender: TObject);
var
  i: Integer;
  SearchRec: TSearchRec;
  FileAttr: Bool;
  ListItem: TListItem;
  GroupXML: TjanXMLParser2;
  IconFile: String;
  IconIndex: Integer;
  MyIcon: TIcon;
begin
  ZeroMemory(@SearchRec, SizeOf(TSearchRec));
  GroupXML:= TjanXMLParser2.create;
  MyIcon:= TIcon.Create;

  With FLoadGroup do
  begin
    LV1.Clear;
    IL1.Clear;
    BtnOK.Enabled:= False;
    BtnDelete.Enabled:= False;
  i := FindFirst(PrgMgrAppsData + '*.xml', faAnyFile, SearchRec);
  while i = 0 do
  begin
    FileAttr:= ((SearchRec.Attr and FaDirectory)<> FaDirectory) ;
    if FileAttr then
    begin
      GroupXML.text:= '';
      GroupXML.LoadXML(PrgMgrAppsData+SearchRec.Name);
      IconFile:= GroupXML.attribute ['grpiconfile'];

      try
        IconIndex:= StrToInt(GroupXML.attribute ['grpiconindex']);
      except
        IconIndex:= 0;
      end;
      ListItem := LV1.Items.Add;
      Listitem.Caption := GroupXML.attribute ['GroupName'];
      MyIcon.Handle:= ExtractIcon(Handle, PChar(IconFile), IconIndex);
      ListItem.ImageIndex :=IL1.AddIcon(MyIcon);
    end;
    i := FindNext(SearchRec);
  end;
  Timer1.Enabled:= True;
  Case ShowModal of
    // Charge un groupe
    mrOK: begin
              LoadGroup(LV1.Selected.Caption);

          end;
    // Cr�e un groupe
    mrYes: begin
             LoadGroup(FLoadGroup.BtnNew.Caption);
             ListeFichiersOnChange(Self);
           end;
    // Supprime un groupe
    mrRetry: if LV1.Selected.Caption = GroupName
             then MsgDlg(Caption, NoDeleteGroup, mtInformation, [mbOK], 0)
             else begin
               If MsgDlg (Caption, Format(DeleteGrpMsg, [LV1.Selected.Caption]),
                   mtWarning,[mbYes, mbNo],0) = mrYes
               then DeleteFile(PrgMgrAppsData+LV1.Selected.Caption+'.xml') ;
             end;
  end;
  Timer1.Enabled:= False;
  end;
  MyIcon.Free;
  GroupXML.Free;

end;

procedure TFPrgMgr.ODlg1Show(Sender: TObject);
var
  r: TRect;
begin
  //with sender as topendialog do begin
    GetWIndowRect( ODlg1.handle , r );
    MOveWindow( ODlg1.handle ,
                10, 10, r.right-r.left,
                r.bottom-r.top, true );
    Abort;            

  end;

procedure TFPrgMgr.Timer1Timer(Sender: TObject);
var
  dlgWnd  : HWND;
  dlgX,
  dlgY    : Integer;
  dlgRect : TRect;
begin

 dlgWnd := FindWindow('#32770',Pchar(dlgTitle));     {Find the dialog window}

 if dlgWnd <> 0 then
   begin
   GetWindowRect(dlgWnd, dlgRect);
   dlgX:= Left+(Width div 2)-(dlgRect.Right-DlgRect.Left) div 2;
   dlgY := Top+(ClientHeight div 2)- (dlgRect.Bottom - dlgRect.Top) div 2;
   SetWindowPos(dlgWnd, 0, dlgX, dlgY, 0, 0, SWP_NOSIZE);
   Timer1.Enabled := False;
  end;

end;

procedure TFPrgMgr.SBLoadConfClick(Sender: TObject);
var
  i: Integer;
  w: Integer;
  s, FilNamWoExt: String;
begin
  With FloadConf do
  begin
    w:= FloadConf.Width;
    LB2.Clear;
    s:= ExtractFileExt(ConfigFile);
    FilNamWoExt:= Copy (ConfigFile, 1, length(ConfigFile)-length(s));

    For i:= 0 to 9 do
    begin
     s:= ExtractFileName(FilNamWoExt+'.bk'+IntToStr(i));
     If FileExists(FilNamWoExt+'.bk'+IntToStr(i)) then
     begin
       FileList [i,0]:= ExtractFileName(s);
       FileList [i,1]:= DateTimeToStr(FileGetDateTime (FilNamWoExt+'.bk'+IntToStr(i), 2));
       LB2.Items.Add(FileList [i,0]+' - '+FileList [i,1]);
     end;
     if LB2.Canvas.TextWidth(s) > LB2.ClientWidth then FloadConf.Width:= w+LB2.Canvas.TextWidth(s)- LB2.ClientWidth+6 ;
    end;
    ShowModal;
    if ModalResult <>  mrOK then 
    if ListeChange then
    begin
      FPrgMgr.LoadCfgFile(ConfigFile);
      FPrgMgr.LVDisplayFiles;
      Listechange:= False;
    end;
  end;

end;

procedure TFPrgMgr.SBQuitClick(Sender: TObject);
begin
 Close;
end;

procedure TFPrgMgr.FormConstrainedResize(Sender: TObject; var MinWidth,
  MinHeight, MaxWidth, MaxHeight: Integer);
begin
  MinWidth := FMinWidth;
  MinHeight:= FMinHeight;  // Bug ??
end;



procedure TFPrgMgr.PTrayMnuQuitClick(Sender: TObject);
begin
   SBQuitClick(self);
end;

procedure TFPrgMgr.PTrayMnuMinimizeClick(Sender: TObject);
begin
  PTrayMnuRestore.Enabled:= True;
  PTrayMnuMinimize.Enabled:= False;
  PTrayMnuMaximize.Enabled:= True;
  if TrayProgman.ApplicationVisible then TrayProgMan.HideApplication;

end;

procedure TFPrgMgr.PTrayMnuMaximizeClick(Sender: TObject);
begin
  PTrayMnuRestore.Enabled:= True;
  PTrayMnuMinimize.Enabled:= True;
  PTrayMnuMaximize.Enabled:= False;
  if not TrayProgman.ApplicationVisible then TrayProgman.ShowApplication;
  WindowState:= wsMaximized;
end;

procedure TFPrgMgr.PTrayMnuRestoreClick(Sender: TObject);
begin
  PTrayMnuRestore.Enabled:= False;
  PTrayMnuMinimize.Enabled:= True;
  PTrayMnuMaximize.Enabled:= True;
  TrayProgman.ShowApplication;
end;

procedure TFPrgMgr.PTrayMnuAboutClick(Sender: TObject);
begin
  SBAboutClick(self);
end;

procedure TFPrgMgr.TrayProgmanMinimizeToTray(Sender: TObject);
begin
   PTrayMnuRestore.Enabled:= True;
  PTrayMnuMinimize.Enabled:= False;
  PTrayMnuMaximize.Enabled:= True;
end;

procedure TFPrgMgr.PMnuHideBarsClick(Sender: TObject);
begin
  If HideBars then
  begin
    FMinHeight:= BarsHeight+GetSystemMetrics(SM_CYCAPTION)+142;
    HideBars:= False;
    PnlTools.Visible:= True;
    PnlStatus.Visible:= True;
    PMnuHideBars.Caption:= SMnuMaskBars;
    Height:= HideBarsheight+BarsHeight;
  end else
  begin
    FMinHeight:= GetSystemMetrics(SM_CYCAPTION)+142;
    HideBars:= True;
    PnlTools.Visible:= False;
    PnlStatus.Visible:= False;
    PMnuHideBars.Caption:= SMnuShowBars;
    Height:= ShowBarsHeight-BarsHeight;
  end;
end;

procedure TFPrgMgr.PMnuGroupClick(Sender: TObject);
begin
   SBGroupClick(self);
end;

procedure TFPrgMgr.PMnuFolderClick(Sender: TObject);
begin
  SBFolderClick(self);
end;

procedure TFPrgMgr.PMnuSaveClick(Sender: TObject);
begin
  SBSaveClick(self);
end;

procedure TFPrgMgr.PMnuPrefsClick(Sender: TObject);
begin
  SBPrefsClick(self);
end;

procedure TFPrgMgr.PMnuRefreshClick(Sender: TObject);
begin
  SBRefreshClick(self);
end;

procedure TFPrgMgr.PMnuLoadConfClick(Sender: TObject);
begin
  SBLoadConfClick(self);
end;

procedure TFPrgMgr.PMnuAboutClick(Sender: TObject);
begin
  SBAboutClick(self);
end;

procedure TFPrgMgr.PMnuQuitClick(Sender: TObject);
begin
  SBQuitClick(self);
end;


procedure TFPrgMgr.FormResize(Sender: TObject);
var
  BorderWidths: Integer;
begin
  BorderWidths:= Width-ClientWidth;
  if HideBars then begin
     ShowBarsHeight:= Height+BarsHeight;
      FminWidth:= 250;
     HideBarsHeight:= Height;
  end else
  begin
     HideBarsHeight:= Height-BarsHeight;
     FMinWidth := SBQuit.Left+SBQuit.Width+10+CBDisplay.Width+10+CBSort.Width+BorderWidths;
      if (Width < FMinWidth) then Width:= FMinWidth;
     ShowBarsHeight:= Height;
  end;
end;

procedure TFPrgMgr.PMnuAddFileClick(Sender: TObject);
begin
  SBAddFileClick(self);
end;

// Explorer restarted, need to re-create trayIcon

procedure TFPrgMgr.TrayProgmanCreateTaskBar(Sender: TObject);
begin
  //ReadTrayIconProps(TrayProps);
  //Application.ProcessMessages;
  //CreateTrayIcon(TrayProps);
end;

end.
