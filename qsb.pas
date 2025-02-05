unit qsb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

const
  tsize = 10;

var
  Form1: TForm1;
  t : array of integer;
  cpt : integer;

implementation

{$R *.dfm}

procedure Display(i : integer);
begin
  if i = 1 then
  begin
    form1.memo1.Clear;
    for i := 0 to tsize-1 do
    begin
      form1.memo1.Lines.Add(IntToStr(i) + ' ==> ' + IntToStr(t[i]));
    end;
  end
  else
  begin
    form1.memo2.Clear;
    for i := 0 to tsize-1 do
    begin
      form1.memo2.Lines.Add(IntToStr(i) + ' ==> ' + IntToStr(t[i]));
    end;
  end;
end;


procedure QuickSort(iLo, iHi: Integer) ;
 var
   Lo, Hi, Pivot, tmp,cpt : Integer;
 begin
   Lo := iLo;
   Hi := iHi;
   Pivot := t[(Lo + Hi) div 2];
   cpt := 0;
   form1.Memo1.Lines.Add('********* Debut loop **********');
   repeat
     while t[Lo] < Pivot do Inc(Lo) ;
     while t[Hi] > Pivot do Dec(Hi) ;


     //form1.Memo1.Lines.Add('---------');
      //form1.Memo1.Lines.Add(IntToStr(pivot));
      //form1.Memo1.Lines.Add(IntToStr(lo)+ ' ==> ' + (IntToStr(t[lo])));
      //form1.Memo1.Lines.Add(IntToStr(hi)+ ' ==> ' + IntToStr(t[hi]));
      //form1.Memo1.Lines.Add('---------');

     if Lo <= Hi then
     begin
       tmp := t[Lo];
       t[Lo] := t[Hi];
       t[Hi] := tmp;
       Inc(Lo) ;
       Dec(Hi) ;
       form1.Memo1.Lines.Add('PERMUT ! ');
     end;

   until Lo > Hi;
   inc(cpt);
   if cpt= 1 then
   begin
    Display(1);
    form1.Memo1.Lines.Add(IntToStr(pivot));
    form1.Memo1.Lines.Add(IntToStr(Hi));
    form1.Memo1.Lines.Add(IntToStr(Lo));
   end;

   if Hi > iLo then QuickSort(iLo, Hi) ;
   if Lo < iHi then QuickSort(Lo, iHi) ;
 end;


// ************************************************************//
// pushed to github
function partition(lo,hi : integer): integer;
var
  loptr, hiptr, pivot,tmp : integer;
begin
  loptr := lo;
  hiptr := hi;
  pivot := t[(hi+lo) div 2];

  repeat

    while (t[loptr] < pivot) do inc(loptr);
    while t[hiptr] > pivot do dec(hiptr);

    form1.Memo1.Lines.Add('---------');
    form1.Memo1.Lines.Add(IntToStr(pivot));
    form1.Memo1.Lines.Add(IntToStr(loptr)+ ' ==> ' + (IntToStr(t[loptr])));
    form1.Memo1.Lines.Add(IntToStr(hiptr)+ ' ==> ' + IntToStr(t[hiptr]));

    if loptr <= hiptr then
    begin
      tmp := t[hiptr];
      t[hiptr] := t[loptr];
      t[loptr] := tmp;
      inc(loptr) ;
      dec(hiptr);
    end;

      (*form1.Memo1.Lines.Add('---------');
      form1.Memo1.Lines.Add(IntToStr(pivot));
      form1.Memo1.Lines.Add(IntToStr(loptr)+ ' ==> ' + (IntToStr(t[loptr])));
      form1.Memo1.Lines.Add(IntToStr(hiptr)+ ' ==> ' + IntToStr(t[hiptr])); *)

    until loptr > hiptr;



  form1.Memo1.Lines.Add('---------');
  form1.Memo1.Lines.Add(IntToStr(loptr));
  form1.Memo1.Lines.Add(IntToStr(hiptr));



  partition := hiptr;


end;

procedure QS(lo,hi: integer);
var
 index : integer;
begin
  while lo<hi do
  begin
    index := partition(lo,hi) ;
    QS(lo,index-1);
    QS(index+1,hi);
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  i : integer;
begin
  memo1.Clear;
  setlength(t,tsize);
  for i := 0 to tsize-1 do
  begin
    t[i] := random(20);
    //t[i] :=  tsize - i;
  end;
  t[5] := 10;
  Display(1);

  partition(0,tsize);
 //QuickSort(0,tsize);
  //QS(0,tsize);


  memo2.Clear;
  for i := 0 to tsize-1 do
  begin
    memo2.Lines.Add(IntToStr(i) + ' ==> ' + IntToStr(t[i]));
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Display(1);
  partition(StrToInt(Edit1.Text),StrToInt(Edit2.Text));
  Display(2);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i : integer;
begin
  memo1.Clear;
  setlength(t,tsize);
  for i := 0 to tsize-1 do
  begin
    t[i] := random(20);
    //t[i] :=  tsize - i;
  end;
  t[5] := 10;
  Display(1);
  QuickSort(0, tsize) ;
  Display(2);

end;

end.
