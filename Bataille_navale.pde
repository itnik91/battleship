// Centrer texte, message pour guider joueur, probleme avec 2eme bateaux, blem superposition, mettre du temps entre chaque tir ordi
int i,j,k,l;//Variables pour les for
int a,b;//mémoire pour tourner le bateaux seulement si on clique-droit sur la case initiale
int tailleCase; //Taille des cases de la grille
int nbCases=10; //Nombre de case de la grille
int [][]grille=new int[nbCases][nbCases];//Grille cachée (rempli par l'ordi)
int [][]grille2=new int[nbCases][nbCases];//Grille affichée ordi
int [][]grille3=new int[nbCases][nbCases];//Grille utilisateur
int tailleBateaux=1;//Variable de la taille des bateaux de l'utilisateur
//int tailleBateauxOrdi=2; //Variable de la taille des bateaux de l'ordinateur
boolean SousMarin=false, SousMariin=false; //Utilisé pour gérer la taille des bateaux
String texte;
int direction; //Direction des bateaux
boolean joueur=true; //Dit à qui est ce de jouer, joueur ou ordinateur
int Bataillenavale=0; //0=Ecran titre, 1=Phase d'initialisation (On pose les bateaux), 2=Phase de combat, 3=Affichage du gagnant, 4=Rêgle
boolean gagnantjoueur=false, gagnantordi=false;//Dit si joueur a gagné ou si c'est l'ordi
boolean winner=false;//Dit s'il y a un gagnant
boolean ordinateur=false;
boolean noPlace=false;//true s'il n'y a pas la place pour mettre un bateaux
PImage plouf; //Image de l'écran titre
PImage mer;
PImage boom;
PImage ecran_titre;
PImage Jouer;
PImage Regles;
PImage les_regles;
PImage Regles_jouer;
boolean test=false;
  
void setup(){//Initialisation des valeurs
  
  background (255);//Fond blanc
  size(900,500);//Taille de la fenêtre
  textSize(65);//Taille du texte
  fill(0);//Texte en noir
  frameRate(9);
  tailleCase=width/21;//Taille des cases
  plouf = loadImage("Plouf.jpg");
  mer = loadImage("mer.jpg");
  boom = loadImage("boom.jpg");
  ecran_titre=loadImage("ecran_titre.jpg");
  Jouer=loadImage("Jouer.jpg");
  Regles=loadImage("Regles.jpg");  
  les_regles=loadImage("les_regles.jpg");
  Regles_jouer=loadImage("Regles_jouer.jpg");
  
  //Initialise les cases en me
  for(j=0;j<nbCases;j++){
    for(i=0;i<nbCases;i++){
      grille2[i][j]=0;
    }
  }
  //Initialise les cases en blanc
  for(k=0;j<nbCases;k++){
    for(l=0;i<nbCases;l++){
      grille[l][k]=0;
      grille3[l][k]=0;
    }
  }
  //Place 5 bateaux au hasard : 1 de 2 cases, 2 de 3 cases, 1 de 4 cases et 1 de 5 cases
  while(test==false){
  creerBateauxOrdi(grille);
  }
  //affiche(grille3,0); 
  //affiche(grille,460);
}

void draw(){
  //image(plouf, 0, 0);
  textSize(65);
  tailleBateaux=bateaux(tailleBateaux);
  if(tailleBateaux==5){
    fill(0);
    textSize(45);
    text("Clique pour commencer",175,480);
  }
  if(tailleBateaux==6){
    Bataillenavale=2;
  }
  //Ecran Titre
  if(Bataillenavale==0){
    background(ecran_titre);
      //Surligne en couleurs négatives lors de passage au dessus de Jouer ou Regles  
    if(mouseX>365 && mouseX<560 && mouseY>250 && mouseY<315){
      background(Jouer);
    }
    if(mouseX>365 && mouseX<560 && mouseY>315 && mouseY<380){
      background(Regles);
    }
    if(mousePressed==true){
      //Si clic sur Jouer, passage au plaçage des bateaux.
      if(mouseX>365 && mouseX<560 && mouseY>250 && mouseY<315){
      Bataillenavale=1;
      background(255);
      }
      //Si clic sur Règles, passage a l'écran des règles.
      if(mouseX>365 && mouseX<560 && mouseY>315 && mouseY<380){
      Bataillenavale=4;
      }
      
      
      } 
      
     
      }
      if(Bataillenavale==4){
      background(les_regles);
      if(mouseX>700 && mouseX<899 && mouseY>0 && mouseY<100){
      background(Regles_jouer);
      if(mousePressed==true){
      Bataillenavale=1;
      background(255);
      }
      }
      }
   
 
  if(Bataillenavale==1){
    affiche(grille3,0);
  for(j=0;j<nbCases;j++){
    for(i=0;i<nbCases;i++){
      if (mousePressed == true){
        if(mouseX>j*tailleCase && mouseX<(j+1)*tailleCase && mouseY>i*tailleCase && mouseY<(i+1)*tailleCase){
          affiche(creerBateaux(i,j,tailleBateaux,grille3),0);
        }
      }
    }
  }
  
  }
  if(Bataillenavale==2){
    if(winner==false){
    if(joueur==true){
      winordi();
  for(k=0;k<nbCases;k++){
    for(l=0;l<nbCases;l++){
      if (mousePressed == true){
        background(255);
        if(mouseX>k*tailleCase+460 && mouseX<(k+1)*tailleCase+460 && mouseY>l*tailleCase && mouseY<(l+1)*tailleCase){
          if(grille2[l][k]==0){
            if(grille[l][k]==1){
              grille2[l][k]=3;
            }
            else{
              grille2[l][k]=4;
              joueur=false;
            }
          
            texte=situation(grille,l,k);
            fill(0);
            //text("trololo",200,480);
            //text(texte,200,480);
          }
        }
      }
    }
  }
    }
    while(joueur==false){
      winjoueur();
      tirOrdi(grille3);
    }
  }
    if(gagnantjoueur==true){
      winner=true;
      Bataillenavale=3;
      fill(0);
      text("Vous avez gagné !",175,480);
      //Changer combat en 2 pour après afficher le gagnant et ainsi arrêter la phase de combat
      //Afficher dans situation le texte avec le gagnant
    }
    if(gagnantordi==true){
      winner=true;
      Bataillenavale=3;
      fill(0);
      text("Vous avez perdu !",175,480);
      //Pareil ici, t'as pas lu la phrase d'avant ou quoi?
    }
  affiche(grille3,0);
  affiche(grille2,460);
  }
}

//Fonction qui permet de tirer au hazard sur la grille du joueur
void tirOrdi(int [][]grille){
   a=(int)random(nbCases);
   b=(int)random(nbCases);
  while(grille[a][b]==3 || grille[a][b]==4){
     a=(int)random(nbCases);
     b=(int)random(nbCases);
  }
   if(grille[a][b]==1){
     grille[a][b]=3;  
   }
   else if(grille[a][b]==0){
     grille[a][b]=4;
     joueur=true;
   }    
}

// Affiche une grille à partir d'un tableau
void affiche(int [][]grille, int debut){
  for(j=0;j<nbCases;j++){
    for(i=0;i<nbCases;i++){
      if(grille[i][j]==1){ //Noir
        fill(0);
        rect(j*tailleCase+debut,i*tailleCase,tailleCase,tailleCase);
      }
      if(grille[i][j]==0){ // Mer
        image(mer,j*tailleCase+debut,i*tailleCase,tailleCase,tailleCase);
      }
      if(grille[i][j]==3){ // Touché
        image(boom,j*tailleCase+debut,i*tailleCase,tailleCase,tailleCase);
      }
      if(grille[i][j]==4){ // Raté
        image(plouf,j*tailleCase+debut,i*tailleCase,tailleCase,tailleCase);
      }
    }
  }
}

//Fonction qui créée des bateaux suivant là où le joueur clic
int[][] creerBateaux(int x, int y, int taille, int[][] grille){
  textSize(65);
  background (255);
  if(mouseButton==LEFT){
    if(grille[x][y]==0){
      direction=placement(x,y,taille,grille,0);
      a=x;
      b=y;
  }
    if(noPlace==true){
      tailleBateaux=tailleBateaux-1;// Empeche la taille des bateaux d'augmenter si on ne clique pas la où il y a de la place
      fill(0);
      text("Il n'y a pas de place",100,480);
    }
    if(grille[x][y]==1){
      tailleBateaux=tailleBateaux-1;// Empeche la taille des bateaux d'augmenter si on ne clique pas la où il y a de la place
      fill(0);
      text("Il y a déjà un bateaux",100,480);
    }
  }
  if(x==a && y==b){ //Permet de changer la direction du bateaux seulement si on clic-droit sur la case de départ
    if(mouseButton==RIGHT){  
      for(j=0;j<taille;j++){
        if(direction==0){
          grille[x-j][y]=0;
        }
        if(direction==1){
          grille[x][y+j]=0;
        }
        if(direction==2){
          grille[x+j][y]=0;
        }
        if(direction==3){
          grille[x][y-j]=0;
        }
      }
      direction=direction+1;
      direction=placement(x,y,taille,grille,0);
    }
    if(noPlace==false){
    if(grille[x][y]==0){// Permet de créer un bateaux seulement si on ne clic pas déjà sur un autre bateaux
    //haut=0, droite=1, bas=2, gauche=3
    for(j=0;j<taille;j++){
      if(direction==0){
        grille[x-j][y]=1;
      }
      if(direction==1){
        grille[x][y+j]=1;
      }
      if(direction==2){
        grille[x+j][y]=1;
      }
      if(direction==3){
        grille[x][y-j]=1;
      }
    }
    }
    }
    }
  noPlace=false;
  return(grille); 
}

// Fonction qui gère la taille des bateaux
int bateaux(int taille){
  if(mousePressed==true){
    if(mouseButton==LEFT){
      if(mouseX>0 && mouseX<tailleCase*10 && mouseY>0 && mouseY<tailleCase*10){
        if(taille==1 || taille==4 || taille==5){
          taille=taille+1;
          return(taille);
        }
        if(taille==2){
          taille=taille+1;
          SousMarin=true;
          return(taille);
        }
        if(SousMariin==true){
          taille=4;
          SousMarin=false;
          return(taille);
        }
        if(SousMarin==true){
          SousMariin=true;
          SousMarin=false;
          return(taille);
        }
      }
    }
  }
  return(taille);
}

// Fonction qui choisie la direction en fonction des bords et des autres bateaux (pour éviter qu'ils ne se superpose) 
int placement(int x, int y, int taille, int[][]grille, int ordi){
  if(ordi==1){
    direction=(int)random(4);
  }
  if(direction>=4){
    direction=0;
  } 
  if(x<=taille-2 && y<=taille-2){ // haut gauche
    if(direction==3 || direction==0){
      direction=1;
    }
    if(verification(x,y,grille,1)==false && verification(x,y,grille,2)==false){
      noPlace=true;
    }
    else{
      while(!verification(x,y,grille,direction)){
        direction=direction+1;
        if(direction==3 || direction==0){
          direction=1;
        }
      }
    }
  }
  else if(x<=taille-2 && y>=(nbCases-1)-(taille-2)){ // Haut droite
    if(direction==0 || direction==1){
      direction=2;
    }
    if(verification(x,y,grille,3)==false && verification(x,y,grille,2)==false){
      noPlace=true;
    }
    else{
      while(!verification(x,y,grille,direction)){
        direction=direction+1;
        if(direction==0 || direction==1){
        direction=2;
        }
      }
    }
  }
  else if(x>=(nbCases-1)-(taille-2) && y>=(nbCases-1)-(taille-2)){ // Bas droite
    if(direction==1 || direction==2){
      direction=3;
    }
    if(verification(x,y,grille,0)==false && verification(x,y,grille,3)==false){
      noPlace=true;
    }
    else{
      while(!verification(x,y,grille,direction)){
        direction=direction+1;
        if(direction==1){
          direction=3;
        }
      }
    }
  }
  else if(x>=(nbCases-1)-(taille-2) && y<=taille-2){ // Bas gauche
    if(direction==2 || direction==3){
      direction=0;
    }
    if(verification(x,y,grille,0)==false && verification(x,y,grille,1)==false){
      noPlace=true;
    }
    else{
      while(!verification(x,y,grille,direction)){
        direction=direction+1;
        if(direction==2 || direction==3){
          direction=0;
        }
      }
    }
  }
  else if(x>=(nbCases-1)-(taille-2)){ // Bas
    if(direction==2){
      direction=3;
    }
    if(verification(x,y,grille,3)==false && verification(x,y,grille,0)==false && verification(x,y,grille,1)==false){
      noPlace=true;
    }
    else{
      while(!verification(x,y,grille,direction)){
        direction=direction+1;
        if(direction==2){
          direction=3;
        }
        if(direction>=4){
          direction=0;
        }
      }
    }
  }
  else if(x<=taille-2){ // Haut
    if(direction==0){
      direction=1;
    }
    if(verification(x,y,grille,3)==false && verification(x,y,grille,2)==false && verification(x,y,grille,1)==false){
      noPlace=true;
    }
    else{
      while(!verification(x,y,grille,direction)){
        direction=direction+1;
        if(direction==0){
          direction=1;
        }
      }
    }
  }
  else if(y>=(nbCases-1)-(taille-2)){ // Droite
    if(direction==1){
      direction=2;
    }
    if(verification(x,y,grille,3)==false && verification(x,y,grille,0)==false && verification(x,y,grille,2)==false){
      noPlace=true;
    }
    else{
      while(!verification(x,y,grille,direction)){
        direction=direction+1;
        if(direction==1){
          direction=2;
        }
      }
    }
  }
  else if(y<=taille-2){ // Gauche
    if(direction==3){
      direction=0;
    }
    if(verification(x,y,grille,2)==false && verification(x,y,grille,0)==false && verification(x,y,grille,1)==false){
      noPlace=true;
    }
    else{
      while(!verification(x,y,grille,direction)){
        direction=direction+1;
        if(direction==3){
          direction=0;
        }
      }
    }
  }
  else{
    if(verification(x,y,grille,3)==false && verification(x,y,grille,0)==false && verification(x,y,grille,1)==false && verification(x,y,grille,2)==false){
      noPlace=true;
    }
    while(!verification(x,y,grille,direction)){
      direction=direction+1;
    }
  }
  if(direction>=4){
    direction=0;
  }
  return(direction);
}

// Fonction qui vérifie s'il n'y a pas de bateaux dans la direction demandée
boolean verification(int x, int y, int [][]grille, int direction){
  boolean ok=true;
  if(direction==0){
    for(k=1;k<tailleBateaux;k++){
      if(grille[x-k][y]==1 || grille[x-k][y]==3){
        ok=false;
      }
    }
  }                                                                                                                                                                    
  else if(direction==1){
    for(k=1;k<tailleBateaux;k++){
      if(grille[x][y+k]==1 || grille[x][y+k]==3){
        ok=false;
      }
    }
  }
  else if(direction==2){
    for(k=1;k<tailleBateaux;k++){
      if(grille[x+k][y]==1 || grille[x+k][y]==3){
        ok=false;
      }
    }
  }
  else if(direction==3){
    for(k=1;k<tailleBateaux;k++){
      if(grille[x][y-k]==1 || grille[x][y-k]==3){
        ok=false;
      }
    }
  }
  return(ok);
}
  
