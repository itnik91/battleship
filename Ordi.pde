// PROBLEME PAS DE TEXTE TOUCHE COULE + CENTRER TEXTE

int dTorpilleur, dSousMarin, dContreTorpilleurs, dCroiseur, dPorteAvion;

//Créé aléatoirement des bateaux sur la grille
void creerBateauxOrdi(int[][] grille){
  //Empeche les bateaux de se superposer PROBLEME
  int taille=2;
  for(i=0;i<5;i++){
    if(i==1 || i==2){
      taille=3;
    }
    if(i==3){
      taille=4;
    }
    if(i==4){
      taille=5;
    }
    int x=(int)random(nbCases);
    int y=(int)random(nbCases);
    while(grille[x][y]==1 || noPlace==true){
      x=(int)random(nbCases);
      y=(int)random(nbCases);
    }
    grille[x][y]=1;
    direction=placement(x,y,taille,grille,1);
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
    if(i==0){
      dTorpilleur=direction;
    }
    if(i==1){
      dSousMarin=direction;
    }
    if(i==2){
      dContreTorpilleurs=direction;
    }
    if(i==3){
      dCroiseur=direction;
    }
    if(i==4){
      dPorteAvion=direction;
    }
    noPlace=false;
  }
  int compteur=0;
    for(k=0;k<nbCases;k++){
    for(l=0;l<nbCases;l++){
      if(grille[l][k]==1){
        compteur=compteur+1;
      }
    }
  }
  if(compteur==17){
    test=true;
  }
}

//Affiche si l'utilisateur à touché un bateaux
String situation(int [][]grille, int x, int y){
  String texte="x";
  fill(0);
  if(grille[x][y]==0){
    background (255);
    texte="Raté";
  }
  if(grille[x][y]==3){ 
    background (255);
    texte="Touché !";
  }
  return(texte);
}
