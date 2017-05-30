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
    Mliste: TMemo;
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
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;
  CONST
  victoire='victoire';
  défaite='défaite';
  parti_en_cours='Partie en cours';

var
  Form1: TForm1;
  mot:string;

implementation

{$R *.dfm}

//Procedure qui va réaliser tous les tests sur l'entrée de l'utilisateur, en vérifier la validité puis la tester avec le mot choisi au hasard dans le mémo.
procedure TForm1.BcheckClick(Sender: TObject);

var
nb_essais,nb_lettres,x:integer;
i:integer;
test_correct, test_mot:boolean;
mot_test,  lettres_utilisées:string;
  j, k: Integer;

begin
  test_correct:=true;
  mot_test:=Emot.Text;
  Ebulls.Text:=inttostr(0);
  Ecows.Text:=inttostr(0);
    //Permet de tester dans un premier temps si les longueurs du mot testé et du mot cherché sont les même
   test_correct:=(Length(mot_test)=length(mot));




      for j := 1 to Length(mot) do
      begin
          //Cette première boucle if teste si le caractère j est une minuscule
         if ((ord(mot_test[j])>=ord('a'))AND (ord(mot_test[j])<=ord('z'))) then
        test_correct:=test_correct AND TRUE
        else test_correct:= test_correct AND False;

        //Permet de tester si le même caractère se trouve deux fois dans le mot testé. On stocke chaque caractère déjà testé dans une string et chaque nouveau caractère testé est comparé aux caractère composant cette string
         for i := 1 to Length(lettres_utilisées) do
         begin
           if mot_test[j]=lettres_utilisées[i] then
             test_correct:=test_correct AND TRUE
          else test_correct:= test_correct AND False;
         end;
         lettres_utilisées:=lettres_utilisées+mot_test[j];



        //Si le mot est valide (pas de cractères spéciaux, de même longueur et sans deux fois le même caractère, il peut entrer dans les boucles de comparaison avec le mot cherché
        if test_correct=TRUE  then
        begin
        //Si le caractère est présent dans les deux mots au même emplacement, +1 dans bulls
        if mot[j]=mot_test[j] then
         begin
         Ebulls.Text:=inttostr(strtoint(Ebulls.Text)+1);
         end;

         //grâce à la seconde boucle, on peut comparer le caractère j avec tous les caractères k du mot cherché l'un après l'autre, cela permet de chercher si le caractère j est présent à un emplacement différent dans le mot cherché.Si c'est le cas, +1 dans cows.
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
   //Si les mots sont les mêmes, victoire
  if test_correct=TRUE then
  begin
   if test_mot=TRUE then
   begin
      Evd.Text:=victoire;
      ShowMessage('Félicitations,une nouvelle partie va automatiquement se lance, appuyez sur quitter pour fermer');
   end

   else
   //Sinon, -1 essai
   begin
     Etry.Text:=inttostr(strtoint(Etry.Text)-1);
   end;



  end
  //Le message d'erreur si le mot testé n'est pas valide
  else ShowMessage('Erreur, caractères invalides, nombre de caractères incorrectes ou deux fois le même caractère.');

  //Si le compteur d'essai atteint 0, c'est perdu
  if strtoint(Etry.Text)=0 then
    begin
      evd.Text:=défaite;
      ShowMessage('Quel dommage, mais une nouvelle partie commence, retentez votre chance');
    end;

    //Si le joueur gagne ou perd, la partie se relance automatiquement
    if (test_mot=TRUE) OR (strtoint(Etry.Text)=0) then
    begin
      randomize;
      x:=random(10);
      mot:=Mliste.Lines[x];
      Lmot.Caption:=Mliste.Lines[x];

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

//procedure pour quitter le programme
procedure TForm1.BquitClick(Sender: TObject);
begin
close;
end;

//Permet de commencer une nouvelle partie sans terminer la précédente
procedure TForm1.BrazClick(Sender: TObject);
var
nb_essais,nb_lettres,x:integer;

begin
randomize;
x:=random(10);
mot:=Mliste.Lines[x];
Lmot.Caption:=Mliste.Lines[x];

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


//Initialise la première partie après le lancement du programme
procedure TForm1.FormActivate(Sender: TObject);
var
nb_essais,nb_lettres,x:integer;
begin
randomize;
x:=random(10);
mot:=Mliste.Lines[x];
Lmot.Caption:=Mliste.Lines[x];

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

//Intègre le fichier contenant la liste de mots pouvant être cherchés par le joueur
procedure TForm1.FormCreate(Sender: TObject);

begin
Mliste.Lines.LoadFromFile('liste_mots.txt');
end;

end.
