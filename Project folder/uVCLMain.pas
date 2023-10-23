Unit uVCLMain;

Interface

Uses
    Winapi.Windows,
    Winapi.Messages,
    System.SysUtils,
    System.Variants,
    System.Classes,
    Vcl.Graphics,
    Vcl.Controls,
    Vcl.Forms,
    Vcl.Dialogs,
    Vcl.ExtCtrls,
    Vcl.Grids,
    Vcl.Buttons,
    Vcl.StdCtrls,
    UEngine,
    System.ImageList,
    Vcl.ImgList,
    Vcl.VirtualImageList,
    System.Actions,
    Vcl.ActnList,
    Vcl.PlatformDefaultStyleActnCtrls,
    Vcl.ActnMan;

Type
    TfrmMain = Class(TForm)
        GrpBackground: TGridPanel;
        LbIsOpen: TLabel;
        LbPortName: TLabel;
        LbGeneralPortInfo: TLabel;
        LbIsAvaliable: TLabel;
        LbPortConfigs: TLabel;
        LbBaudrate: TLabel;
        LbStopBits: TLabel;
        LbParityBit: TLabel;
        LbByteSize: TLabel;
        LbPortNameValue: TLabel;
        LbIsOpenValue: TLabel;
        LbIsAvaliableValue: TLabel;
        LbBaudrateValue: TLabel;
        LbParityBitValue: TLabel;
        LbByteSizeValue: TLabel;
        LbStopBitsValue: TLabel;
        SdbtExit: TSpeedButton;
        VilImages48: TVirtualImageList;
        PButtons: TPanel;
        PMessages: TPanel;
        SdbtChangePort: TSpeedButton;
        SdbtChangeBaudrate: TSpeedButton;
        MmMessages: TMemo;
        LbMessages: TLabel;
        BtMessages: TButton;
        ActmngActions: TActionManager;
        ActCloseForm: TAction;
        ActInput: TAction;
        ActGetMessages: TAction;
        ActSettings: TAction;
        Procedure FormCreate(Sender: TObject);
        Procedure GrpBackgroundMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        Procedure PMessagesMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        Procedure PButtonsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        Procedure MmMessagesMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
        Procedure ActCloseFormExecute(Sender: TObject);
        Procedure ActGetMessagesExecute(Sender: TObject);
        Procedure ActInputExecute(Sender: TObject);
    Private
        Procedure Init();
        Procedure PortCheck();
    Public
        Engine: TEngine;
    End;

Var
    FrmMain: TfrmMain;

Implementation

{$R *.dfm}

Uses
    UdtmdData,
    UVCLInputForm;

{ Private Methods }

Procedure TfrmMain.Init;
Begin
    Engine := TEngine.Create;
    Engine.SetConfigs(CBR_9600, NOPARITY, 8, ONESTOPBIT);
    LbPortNameValue.Caption := Engine.COMPortName;
    PortCheck;
End;

Procedure TfrmMain.PortCheck();
Begin
    If Engine.TryToOpenComPort Then
    Begin
        LbPortNameValue.Caption := Engine.COMPortName;
        LbIsOpenValue.Caption := '������';
        LbIsOpenValue.Font.Color := ClWebDarkgreen;
        LbIsAvaliableValue.Caption := '��������';
        LbIsAvaliableValue.Font.Color := ClWebDarkGreen;
        LbBaudRateValue.Caption := Inttostr(Engine.DeviceControlBlock.BaudRate);
        LbParityBitValue.Caption := Inttostr(Engine.DeviceControlBlock.Parity);
        LbByteSizeValue.Caption := Inttostr(Engine.DeviceControlBlock.ByteSize);
        LbStopBitsValue.Caption := Inttostr(Engine.DeviceControlBlock.StopBits);
    End
    Else
    Begin
        LbPortName.Caption := '����������';
        LbIsOpenValue.Caption := '������';
        LbIsOpenValue.Font.Color := ClWebDarkRed;
        LbIsAvaliableValue.Caption := '����������';
        LbIsAvaliableValue.Font.Color := ClWebDarkRed;
        LbBaudRateValue.Caption := '����������';
        LbParityBitValue.Caption := '����������';
        LbByteSizeValue.Caption := '����������';
        LbStopBitsValue.Caption := '����������';
    End;
End;

{ Form }

Procedure TfrmMain.FormCreate(Sender: TObject);
Var
    Rgn: HRGN;
Begin
    Rgn := CreateRoundRectRgn(0, 0, ClientWidth, ClientHeight, 70, 70);
    SetWindowRgn(Handle, Rgn, True);

    Init();
End;

{ Form - Form-dragging }

Procedure TfrmMain.GrpBackgroundMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
    ReleaseCapture;
    FrmMain.Perform(WM_SysCommand, $F012, 0);
End;

Procedure TfrmMain.PMessagesMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
    ReleaseCapture;
    FrmMain.Perform(WM_SysCommand, $F012, 0);
End;

Procedure TfrmMain.MmMessagesMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
    ReleaseCapture;
    FrmMain.Perform(WM_SysCommand, $F012, 0);
End;

Procedure TfrmMain.PButtonsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
    ReleaseCapture;
    FrmMain.Perform(WM_SysCommand, $F012, 0);
End;

{ ActionManager }

Procedure TfrmMain.ActCloseFormExecute(Sender: TObject);
Begin
    Close;
End;

Procedure TfrmMain.ActGetMessagesExecute(Sender: TObject);
Var
    TempArr: UEngine.TArr;
    TempStr: String;
    I: Integer;
Begin
    TempArr := Engine.GetInfoFromProt;
    If Length(TempArr) > 0 Then
    Begin
        for I := Low(TempArr) to High(TempArr) do
            TempStr := TempStr + IntToStr(TempArr[I]);
        MmMessages.Lines.Text := MmMessages.Text + TempStr;
    End
    Else
        MmMessages.Lines.Text := MmMessages.Text + '��������� ���.' + #13#10;
End;

Procedure TfrmMain.ActInputExecute(Sender: TObject);
Begin
    FrmInput := TFrmInput.Create(Self);
    Frminput.ShowModal;
    FrmInput.Free;
    PortCheck;
End;

End.
