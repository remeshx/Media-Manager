object Form2: TForm2
  Left = 656
  Top = 201
  BorderStyle = bsDialog
  Caption = 'copy'
  ClientHeight = 70
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 33
    Width = 21
    Height = 13
    Caption = 'AAA'
  end
  object Label2: TLabel
    Left = 13
    Top = 7
    Width = 122
    Height = 18
    Caption = 'Copying files.....'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Progress: TProgressBar
    Left = 13
    Top = 52
    Width = 287
    Height = 10
    Min = 0
    Max = 100
    Smooth = True
    TabOrder = 0
  end
end
