object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 578
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 40
    Width = 83
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 112
    Top = 8
    Width = 185
    Height = 545
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 320
    Top = 8
    Width = 185
    Height = 545
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 144
    Width = 83
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 175
    Width = 83
    Height = 21
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 8
    Top = 202
    Width = 83
    Height = 21
    TabOrder = 5
  end
  object Button3: TButton
    Left = 16
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 6
    OnClick = Button3Click
  end
end
