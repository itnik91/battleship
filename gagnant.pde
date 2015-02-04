boolean winjoueur(){
  int compteurjoueur=0;
  for(j=0;j<nbCases;j++){
    for(i=0;i<nbCases;i++){
      if(grille2[i][j]==3){ //changer le numéro de la grille pour celle masquée du joueur
        compteurjoueur=compteurjoueur+1;
      }
    }
  }
 if(compteurjoueur==17){
   gagnantjoueur=true;
 }
  return(gagnantjoueur);
}
boolean winordi(){
  int compteurordi=0;
  for(j=0;j<nbCases;j++){
    for(i=0;i<nbCases;i++){
      if(grille3[i][j]==3){ //changer le numéro de la grille pour celle grisée de l'ordi
        compteurordi=compteurordi+1;
      }
    }
  }
 if(compteurordi==17){
   gagnantordi=true;
 }
  return(gagnantordi);
}
/*boolean pret(int[][] grille){
  int compteur=0;
  for(j=0;j<nbCases;j++){
    for(i=0;i<nbCases;i++){
      if(grille3[i][j]==1){ //changer le numéro de la grille pour celle grisée de l'ordi
        compteur=compteur+1;
      }
    }
  }
 if(compteur==17){
   ordinateur=true;
 }
 return(ordinateur);
}*/
