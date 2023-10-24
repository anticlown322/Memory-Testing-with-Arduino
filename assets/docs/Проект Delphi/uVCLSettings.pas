Unit uVCLSettings;

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
    Vcl.Dialogs;

Type
    TfrmSettings = Class(TForm)
        Procedure FormCreate(Sender: TObject);
    End;

Var
    FrmSettings: TfrmSettings;

Implementation

{$R *.dfm}

Procedure TfrmSettings.FormCreate(Sender: TObject);
Var
    Rgn: HRGN;
Begin
    Rgn := CreateRoundRectRgn(0, //x-coordinate of the region's upper-left corner
        0, //y-coordinate of the region's upper-left corner
        ClientWidth, //x-coordinate of the region's lower-right corner
        ClientHeight, //y-coordinate of the region's lower-right corner
        70, //height of ellipse for rounded corners
        70); //width of ellipse for rounded corners
    SetWindowRgn(Handle, Rgn, True);
End;

End.
