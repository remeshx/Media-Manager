unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, FileCtrl;

const
 copy = 0;
 move = 1;
 del = 2;

type
  TForm2 = class(TForm)
    Progress: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure docopy(job: Byte);
    procedure dodel;
  end;

var
  Form2: TForm2;

implementation

uses main;

{$R *.DFM}

procedure tform2.docopy(job: Byte);
var filename, destfilename, destdir: string;
    i: integer;
begin
 with form1 do
 if selectdirectory('Select directory to save files...', '', destdir) then
 Begin
  if destdir[length(destdir)] <> '\' Then destdir:= destdir + '\';
  progress.Max:= listbox.Items.capacity; 
  form1.listbox.itemindex:= 0;
  form2.show;
  application.ProcessMessages;
  for i:= 0 to listbox.items.capacity -1 do
  Begin
    form2.label1.Caption:= listbox.items[listbox.itemindex];
    form2.label1.Invalidate;
    application.ProcessMessages;
    progress.Position:= listbox.itemindex;
    filename:= listbox.items[listbox.itemindex];
    destfilename:= destdir + inttostr(listbox.itemindex) + '-' +  extractfilename(filename);
    case job of
     copy: copyfile(pchar(filename),Pchar(destfilename), true);
     move: movefile(pchar(filename),Pchar(destfilename));
     del: deletefile(filename);
    end;
    listbox.itemindex:= listbox.itemindex +1;
  end;
 end;
 form2.close;
end;

procedure tform2.dodel;
var  i: integer;
     filename: string; 
begin
 with form1 do
 if messagedlg('do you want to delete selected file(s)...?', mtwarning,[mbyes, mbno],0)= mryes then
 Begin
  progress.Max:= listbox.Items.capacity;
  form1.listbox.itemindex:= 0;
  form2.show;
  application.ProcessMessages;
  for i:= 0 to listbox.items.capacity -1 do
  Begin
    form2.label1.Caption:= listbox.items[listbox.itemindex];
    form2.label1.Invalidate;
    application.ProcessMessages;
    progress.Position:= listbox.itemindex;
    filename:= listbox.items[listbox.itemindex];
    deletefile(filename);
    listbox.itemindex:= listbox.itemindex +1;
  end;
 end;
 form2.close;
end;

end.
