(*
  Unit uEngine;
  
  Interface
  
  Uses
  Windows;
  
  Type
  TComPort = Class
  Private
  HFile: THandle;
  Public
  Constructor Create;
  Destructor Destroy; Override;
  Function InitCom(BaudRate, PortNo: Integer; Parity: Char; CommTimeOuts: TCommTimeouts): Boolean;
  Procedure CloseCom;
  Function ReceiveCom(Var Buffer; Size: DWORD): Integer;
  Function SendCom(Var Buffer; Size: DWORD): Integer;
  Function ClearInputCom: Boolean;
  End;
  
  Implementation
  
  Uses
  SysUtils;
  
  Constructor TComPort.Create;
  Begin
  Inherited;
  CloseCom;
  End;
  
  Destructor TComPort.Destroy;
  Begin
  CloseCom;
  Inherited;
  End;
  
  Function TComPort.InitCom(BaudRate, PortNo: Integer; Parity: Char; CommTimeOuts: TCommTimeouts): Boolean;
  Var
  FileName: String;
  DCB: TDCB;
  PortParam: String;
  Begin
  Result := FALSE;
  FileName := 'Com' + IntToStr(PortNo); { ��� ����� }
  HFile := CreateFile(PChar(FileName), GENERIC_READ Or GENERIC_WRITE, 0, Nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  If HFile = INVALID_HANDLE_VALUE Then
  Exit;
  
  //��������� ��������� ����������
  GetCommState(HFile, DCB);
  PortParam := 'baud=' + IntToStr(BaudRate) + ' parity=' + Parity + ' data=8 stop=1 ' + 'octs=off';
  If BuildCommDCB(PChar(PortParam), DCB) Then
  Result := SetCommState(HFile, DCB) And SetCommTimeouts(HFile, CommTimeOuts);
  
  If Not Result Then
  CloseCom;
  End;
  
  Procedure TComPort.CloseCom;
  Begin
  If HFile <> INVALID_HANDLE_VALUE Then
  CloseHandle(HFile);
  HFile := INVALID_HANDLE_VALUE;
  End;
  
  Function TComPort.ReceiveCom(Var Buffer; Size: DWORD): Integer;
  Var
  Received: DWORD;
  Begin
  If HFile = INVALID_HANDLE_VALUE Then
  Raise Exception.Create('�� ������� ������ � Com ����');
  
  If ReadFile(HFile, Buffer, Size, Received, Nil) Then
  Result := Received
  Else
  Raise Exception.Create('������ ������ ������: ' + IntToStr(GetLastError));
  End;
  
  Function TComPort.SendCom(Var Buffer; Size: DWORD): Integer;
  Var
  Sended: DWORD;
  Begin
  If HFile = INVALID_HANDLE_VALUE Then
  Raise Exception.Create('�� ������� ������ � Com ����');
  
  If WriteFile(HFile, Buffer, Size, Sended, Nil) Then
  Result := Sended
  Else
  Raise Exception.Create('������ �������� ������: ' + IntToStr(GetLastError));
  End;
  
  Function TComPort.ClearInputCom: Boolean;
  Begin
  If HFile = INVALID_HANDLE_VALUE Then
  Raise Exception.Create('�� ������� ������ � Com ����');
  Result := PurgeComm(HFile, PURGE_RXCLEAR);
  End;
  
  End.    
*)

Unit uEngine;

Interface

Uses
    Windows;

Type
    TArr = Array Of Byte;
    { Engine }
    TEngine = Class
    Private
        Port: String;
        HPort: THandle;
        DCB: TDCB;
    Public
        Property COMPortName: String Read Port Write Port;
        Property HandlePort: THandle Read HPort Write HPort;
        Property DeviceControlBlock: TDCB Read DCB Write DCB;
        Function TryToOpenComPort(): Boolean;
        Procedure SetConfigs(Const BRate: Cardinal; Const Par, BSize, Sbits: Byte);
        Function GetInfoFromProt: TArr;
        Procedure SendInfoToPort(Const SendingMsg: String);
        Constructor Create();
    End;

Implementation

{ Public Methods }

Constructor TEngine.Create();
Begin
    COMPortName := '����������';
    SetConfigs(CBR_9600, NOPARITY, 8, ONESTOPBIT);
End;

Function TEngine.TryToOpenComPort(): Boolean;
Begin
    HandlePort := CreateFile(PChar('\\.\' + ComPortName), GENERIC_READ Or GENERIC_WRITE, 0, Nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
    TryToOpenComPort := HPort <> INVALID_HANDLE_VALUE;
End;

Procedure TEngine.SetConfigs(Const BRate: Cardinal; Const Par, BSize, Sbits: Byte);
Var
    DevCtrlBlock: TDCB;
Begin
    //�.�. property �������� const obj, �� �������� �������� ������. ��� ����� ������������ ���������� DevCtrlBlock
    DevCtrlBlock := DeviceControlBlock;
    GetCommState(HPort, DevCtrlBlock);

    DevCtrlBlock.BaudRate := BRate; //�������� �������� ������ = 9600
    DevCtrlBlock.Parity := Par; //No parity bit
    DevCtrlBlock.ByteSize := BSize; //8 data bits
    DevCtrlBlock.StopBits := Sbits; //1 stop bit

    DeviceControlBlock := DevCtrlBlock;

    //�.�. ����� �� ��� ��������� ����� ��������� � �����, �� ����� ������������ � const obj
    SetCommState(HPort, DeviceControlBlock);
End;

Function TEngine.GetInfoFromProt: TArr;
Var
    BytesRead, BytesWritten: DWORD;
    Buffer: TArr;
Begin
    SetLength(Buffer, 256);
    ReadFile(HPort, Buffer, SizeOf(Buffer), BytesRead, Nil);

    If BytesRead > 0 Then
    Begin
    End
    Else
        SetLength(Buffer, 0);
    GetInfoFromProt := Buffer;
End;

Procedure TEngine.SendInfoToPort(Const SendingMsg: String);
Var
    BytesRead, BytesWritten: DWORD;
    Buffer: Array[0 .. 255] Of Byte;
Begin
    //Buffer[0] := $41; //Example: Writing 'A' to the port

    WriteFile(HPort, Buffer, 1, BytesWritten, Nil);

    If BytesWritten = 1 Then
    Begin
        //������ ������� ��������
    End;
End;

//Procedure TEngine.CloseCom();
//Begin
//    If HFile < > INVALID_HANDLE_VALUE Then
//        CloseHandle(HFile);
//    HFile := INVALID_HANDLE_VALUE;
//End;

End.
