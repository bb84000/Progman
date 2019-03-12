unit localizemessagedialog;

interface

implementation

uses Windows, Consts;

procedure HookResourceString(aResStringRec: PResStringRec; aNewStr: PChar);
var
OldProtect: DWORD;
begin
VirtualProtect(aResStringRec, SizeOf(aResStringRec^), PAGE_EXECUTE_READWRITE, @OldProtect);
aResStringRec^.Identifier := Integer(aNewStr);
VirtualProtect(aResStringRec, SizeOf(aResStringRec^), OldProtect, @OldProtect);
end;

initialization
HookResourceString(@SMsgDlgConfirm, 'Konfirmasi');
HookResourceString(@SMsgDlgWarning, 'Toto');
HookResourceString(@SMsgDlgYes, 'Ya');
HookResourceString(@SMsgDlgNo, 'Tidak');
HookResourceString(@SMsgDlgCancel, 'Batal');
end.
