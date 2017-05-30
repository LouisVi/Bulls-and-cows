unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Lmot: TLabel;
    Emot: TEdit;
    Ecows: TEdit;
    Ebulls: TEdit;
    Etry: TEdit;
    Evd: TEdit;
    Bcheck: TButton;
    Braz: TButton;
    Bquit: TButton;
    Motliste: TMemo;
    Lcows: TLabel;
    Lbulls: TLabel;
    Ltry: TLabel;
    Lvd: TLabel;
    Lnbchar: TLabel;
    Lnb: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate ( Sender: TObject);
    procedure BcheckClick(Sender: TObject);
    procedure BrazClick(Sender: TObject);
    procedure BquitClick(Sender: TObject);
  private

  public

  end;
  CONST
  victoire='victoire';
  d�faite='d�faite';
  parti_en_cours='Partie en cours';

var
  Form1: TForm1;
  mot:string;

implementation

{$R *.dfm}


procedure TForm1.BcheckClick(Sender: TObject);

var
nb_essais,nb_lettres,x:integer;
i:integer;
test_correct, test_mot:boolean;
mot_test,  lettres_utilis�es:string;
  j, k: Integer;

begin
  test_correct:=true;
  mot_test:=Emot.Text;
  Ebulls.Text:=inttostr(0);
  Ecows.Text:=inttostr(0);

   test_correct:=(Length(mot_test)=length(mot));




      for j := 1 to Length(mot) do
      begin

         if ((ord(mot_test[j])>=ord('a'))AND (ord(mot_test[j])<=ord('z'))) then
        test_correct:=test_correct AND TRUE
        else test_correct:= test_correct AND False;


         for i := 1 to Length(lettres_utilis�es) do
         begin
           if mot_test[j]=lettres_utilis�es[i] then
             test_correct:=test_correct AND TRUE
          else test_correct:= test_correct AND False;
         end;
         lettres_utilis�es:=lettres_utilis�es+mot_test[j];




        if test_correct=TRUE  then
        begin

        if mot[j]=mot_test[j] then
         begin
         Ebulls.Text:=inttostr(strtoint(Ebulls.Text)+1);
         end;


        for k := 1 to Length(mot) do
          begin


          if ((mot[j]=mot_test[k]) AND (j<>k)) then
            begin
            Ecows.Text:=inttostr(strtoint(Ecows.Text)+1);
            end;
          end;
          test_mot:=(mot_test=mot);
        end;
      end;

  if test_correct=TRUE then
  begin
   if test_mot=TRUE then
   begin
      Evd.Text:=victoire;
      ShowMessage('F�licitations,une nouvelle partie va automatiquement se lance, appuyez sur quitter pour fermer');
   end

   else

   begin
     Etry.Text:=inttostr(strtoint(Etry.Text)-1);
   end;



  end

  else ShowMessage('Malheuresement vous avez fait une erreur.');


  if strtoint(Etry.Text)=0 then
    begin
      evd.Text:=d�faite;
      ShowMessage('Quel dommage, mais une nouvelle partie commence, retentez votre chance');
    end;


    if (test_mot=TRUE) OR (strtoint(Etry.Text)=0) then
    begin
      randomize;
      x:=random(10);
      mot:=Motliste.Lines[x];
      Lmot.Caption:=Motliste.Lines[x];

      nb_lettres:=Length(mot);
      case nb_lettres of
      3:nb_essais:=4;

      4:nb_essais:=7;

      5:nb_essais:=10;

      6:nb_essais:=16;

      7:nb_essais:=20;
      end;
      Etry.Text:=inttostr(nb_essais);
      Lnbchar.Caption:=inttostr(length(mot));
      Evd.Text:=parti_en_cours;
    end;


    Emot.Text:='';
    Emot.SetFocus;

end;


procedure TForm1.BquitClick(Sender: TObject);
begin
close;
end;


procedure TForm1.BrazClick(Sender: TObject);
var
nb_essais,nb_lettres,x:integer;

begin
randomize;
x:=random(10);
mot:=Motliste.Lines[x];
Lmot.Caption:=Motliste.Lines[x];

nb_lettres:=Length(mot);
case nb_lettres of
3:nb_essais:=4;

4:nb_essais:=7;

5:nb_essais:=10;

6:nb_essais:=16;

7:nb_essais:=20;
end;
Etry.Text:=inttostr(nb_essais);
Lnbchar.Caption:=inttostr(length(mot));
Evd.Text:=parti_en_cours;
Emot.Text:='';
Emot.SetFocus;
end;



procedure TForm1.FormActivate(Sender: TObject);
var
nb_essais,nb_lettres,x:integer;
begin
randomize;
x:=random(10);
mot:=Motliste.Lines[x];
Lmot.Caption:=Motliste.Lines[x];

nb_lettres:=Length(mot);
case nb_lettres of
3:nb_essais:=4;

4:nb_essais:=7;

5:nb_essais:=10;

6:nb_essais:=16;

7:nb_essais:=20;
end;
Etry.Text:=inttostr(nb_essais);
Lnbchar.Caption:=inttostr(length(mot));
Evd.Text:=parti_en_cours;
Emot.SetFocus;
end;


procedure TForm1.FormCreate(Sender: TObject);

begin
Motliste.Lines.LoadFromFile('liste_mots.txt');
end;

end.
