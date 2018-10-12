global A B C K u

%initialisation des variables
fprintf('\n');
disp('Bonjour!Initialisation des variables');
fprintf('\n');
disp('Entrez des elements de la matrice A');

%a11=input('valeur de a11=');
%a12=input('valeur de a12=');
%a21=input('valeur de a21=');
%a22=input('valeur de a22=');

a11=0;
a12=1;
a21=2;
a22=-1;
A=[a11 a12;a21 a22];
fprintf('\n');
disp('La matrice A est:');
disp(A);
disp('La matrice A avec perturbation est:') %erreur du modele
fprintf('\n');

disp('Entrez des elements du vecteur colonne B');
%b1=input('valeur de b1=')
%b2=input('valeur de b2=')
b1=0;
b2=1;
B=[b1,b2];
fprintf('\n');
disp('Le vecteur B est:');
disp(B);
fprintf('\n');

disp('Entrez des elements du vecteur ligne C');
%c1=input('valeur de c1=');
%c2=input('valeur de c2=');
c1=1;
c2=0;
C=[c1 c2];
fprintf('\n');
disp('Le vecteur C est:');
disp(C);
fprintf('\n');

%Etude de la controlabilite
fprintf('\n');
disp('________________');
disp('Etude de la controlabilite');
H=A*B;
I=[B H];
disp('rang de [B AB]='); disp(num2str(rank(I)));
if rank(I)==2
    disp('Le systeme est controlable');
else 
    disp('Le systeme est non controlable');

end;

%Etude de la stabilité
fprintf('\n');
disp('________');
disp('Etude de la stabilt');
disp('Les valeurs propres de A sont:'); disp(eig(A));
V=eig(A);
if (real(V(:,1)))<=0
    disp('Le systeme est stable')
else 
    disp('Le systeme n"est pas stable');
end;

%Etude de la observabilite
fprintf('\n');
disp('_____');
disp('Etude de la observabilite');
J=(A')*(C');
L=[C' J];
disp('rang de [tC tAtC]='); disp(rank(L));
if rank(L)==2
    disp('Le systeme est observable');
else
    disp('Le systeme n"est pas observable');
end;

%Matrice de gain K qui assure la stabilité
fprintf('\n');
disp('____');
disp('Construction de l"observateur');
fprintf('\n');

%v1=input('Valeur propre v1');
%v2=input('Valeur propre v2');
v1=-1;
v2=-2;

p1=[v1 v2];
K=place(A',C',p1).';
disp(");
disp('Matrice de gain:');disp(K);



