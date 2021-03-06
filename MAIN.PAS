unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GrabBar, ExtCtrls, dfsSplitter, ComCtrls, SystemControlPack,
  SystemTreeView, StdCtrls, SystemComboBox, MPlayer, Buttons,
  SystemListView, customScrollBar, Menus, jpeg;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    dfsGrabBar1: TdfsGrabBar;
    Splitter1: TSplitter;
    dfsSystemComboBox1: TdfsSystemComboBox;
    dfsSystemTreeView1: TdfsSystemTreeView;
    Panel6: TPanel;
    dfsGrabBar2: TdfsGrabBar;
    Panel5: TPanel;
    ListView: TdfsSystemListView;
    ListBox: TListBox;
    add_btn: TSpeedButton;
    SpeedButton2: TSpeedButton;
    copy_btn: TSpeedButton;
    MediaPlayer: TMediaPlayer;
    Timer1: TTimer;
    trackbar: TcustomScrollBar;
    Bevel1: TBevel;
    trackbar_back: TImage;
    SpeedButton1: TSpeedButton;
    SaveDialog1: TSaveDialog;
    SpeedButton4: TSpeedButton;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    deleteselected1: TMenuItem;
    clearlist1: TMenuItem;
    savelist1: TMenuItem;
    openliost1: TMenuItem;
    N1: TMenuItem;
    SpeedButton5: TSpeedButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PopupMenu2: TPopupMenu;
    view1: TMenuItem;
    Report1: TMenuItem;
    List1: TMenuItem;
    largeIcons1: TMenuItem;
    Menu3: TPopupMenu;
    copyfiles1: TMenuItem;
    movefiles1: TMenuItem;
    deletefiles1: TMenuItem;
    procedure ListViewClick(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure trackbarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure trackbar_backMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure trackbar_backClick(Sender: TObject);
    procedure ListViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListViewDblClick(Sender: TObject);
    procedure add_btnClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure deleteselected1Click(Sender: TObject);
    procedure clearlist1Click(Sender: TObject);
    procedure savelist1Click(Sender: TObject);
    procedure openliost1Click(Sender: TObject);
    procedure ListBoxClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Report1Click(Sender: TObject);
    procedure List1Click(Sender: TObject);
    procedure largeIcons1Click(Sender: TObject);
    procedure copyfiles1Click(Sender: TObject);
    procedure copy_btnClick(Sender: TObject);
    procedure deletefiles1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  savefilename: string ='';
implementation

uses Unit2;

{$R *.DFM}
var mX, mY: integer;

procedure TForm1.ListViewClick(Sender: TObject);
begin
 with listview do mediaplayer.FileName:= FullFilename[Selected];
 try
   trackbar.position:= 0;
   mediaplayer.Open;
   mediaplayer.play;
   trackbar.Max:= mediaplayer.Length;
 except
 end;
end;

procedure TForm1.TrackBarChange(Sender: TObject);
begin
 try
   mediaplayer.position:= trackbar.position;
   mediaplayer.play;
 except
 end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 if mediaplayer.position >= trackbar.max  then
   trackbar.Position:= 0
 else
   trackbar.position:= mediaplayer.position;
end;

procedure TForm1.trackbarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 try
  mediaplayer.Position:= trackbar.position;
  mediaplayer.play;
 except
  trackbar.position:= 0;
 end;
end;

procedure TForm1.trackbar_backMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 mx:= X;
end;

procedure TForm1.trackbar_backClick(Sender: TObject);
var hlp1: integer;
begin
 try
  trackbar.position:= (trackbar.max * mX) div trackbar_back.width;
  mediaplayer.position:= trackbar.position;
  mediaplayer.play;
 except
  trackbar.position:= 0;
 end;
end;

procedure TForm1.ListViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

try
 case key of
  39: mediaplayer.position:= mediaplayer.position + 20000;
  37: mediaplayer.position:= mediaplayer.position - 20000;
  13: add_btn.click;
 end;
 mediaplayer.play;
except
end;

end;

procedure TForm1.ListViewDblClick(Sender: TObject);
begin
 add_btn.click;
end;

procedure TForm1.add_btnClick(Sender: TObject);
begin
 listbox.items.add(listview.FullFilename[listview.Selected]);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
 if savefilename = '' then if savedialog1.Execute then
  savefilename:= savedialog1.filename;
 listbox.Items.SaveToFile(savefilename);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
 if savedialog1.Execute then
 Begin
  Savefilename:= savedialog1.filename;
  listbox.Items.SaveToFile(savefilename);
 end; 
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
 if opendialog1.Execute then
  listbox.Items.LoadFromFile(opendialog1.filename);
end;

procedure TForm1.ListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
 listview.OnClick(self);
end;

procedure TForm1.deleteselected1Click(Sender: TObject);
begin
 listbox.Items.Delete(listbox.itemindex);
end;

procedure TForm1.clearlist1Click(Sender: TObject);
begin
 listbox.clear;
end;

procedure TForm1.savelist1Click(Sender: TObject);
begin
 speedbutton2.click;
end;

procedure TForm1.openliost1Click(Sender: TObject);
begin
 Speedbutton4.click;
end;

procedure TForm1.ListBoxClick(Sender: TObject);
begin
 with listbox do mediaplayer.FileName:= items[itemindex];
 try
   trackbar.position:= 0;
   mediaplayer.Open;
   mediaplayer.play;
   trackbar.Max:= mediaplayer.Length;
 except
 end;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
try
 mediaplayer.stop;
except
end;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
try
 mediaplayer.play;
except
end;
end;

procedure TForm1.Report1Click(Sender: TObject);
begin
 listview.ViewStyle:= vsReport;
end;

procedure TForm1.List1Click(Sender: TObject);
begin
 listview.ViewStyle:= vslist;
end;

procedure TForm1.largeIcons1Click(Sender: TObject);
begin
 listview.ViewStyle:= vsicon;
end;

procedure TForm1.copyfiles1Click(Sender: TObject);
begin
if listbox.Items.Capacity = 0 then exit;
try
  mediaplayer.stop;
  mediaplayer.close;
except

end;
With (sender as tmenuitem) do
 case tag of
   0: form2.docopy(copy);
   1: form2.docopy(move);
   2: form2.docopy(del);
 End;
end;

procedure TForm1.copy_btnClick(Sender: TObject);
var Pt: Tpoint;
begin
  pt.x:= Copy_btn.Left + panel2.left + form1.left + 30;
  pt.y:= Copy_btn.top + panel6.top + form1.top + 30;
  menu3.Popup(pt.x, pt.y);
end;

procedure TForm1.deletefiles1Click(Sender: TObject);
begin
if listbox.Items.Capacity = 0 then exit;
try
  mediaplayer.stop;
  mediaplayer.close;
except

end;
  form2.dodel;
end;

end.
