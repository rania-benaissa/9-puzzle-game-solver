import controlP5.*;

// INITIALISATIONS

int w, h, value, posX = 0, posY = 0, posMatX, posMatY;

PImage[] images = new PImage[9];

ArrayList<Node> arbre = new ArrayList();
ArrayList<Node> erased = new ArrayList();
ArrayList<Node> solution = new ArrayList();
ArrayList<Node2> arbre2 = new ArrayList();
ArrayList<Node2> erased2 = new ArrayList();
ArrayList<Node2> solution2 = new ArrayList();

boolean ok = false;

int echelleY = 100, echelleX = 128;

PFont font, font2;

ControlP5 cp5;

Textlabel algo1, algo2, tAlgo1Label, tAlgo2Label, nbNode1Label, nbNode2Label, nbcoupsLabel;

/* GRILLES INITIALES ( CONFIGURATION INITIALE ) */


int [][] grille= {
     
       {4,6,8},
       {2,7,5},
       {0,3,1}
    };
    
    
int [][] grille2= {
     
       {4,6,8},
       {2,7,5},
       {0,3,1}
    };

int [][] grille3 =  {
     
       {4,6,8},
       {2,7,5},
       {0,3,1}
    };
    
 /* GRILLE OBJECTIF ( CONFIGURATION FINALE ) */


int [][] confVictoire= {
     
       {1,2,3},
       {8,0,4},
       {7,6,5}
    };  



void setup(){

  
  /* CANEVAS SIZE */
  
   size(448,448);
   
   w = 488;
   h = 448;
  
  /* POLICE DU TEXT */
  
  font = loadFont("BellMTBold-14.vlw");

  font2 = loadFont("BellMTBold-20.vlw");

  /* BACKGROUND COLOR */
  
  background(#00695c);
  
  chargerImages();

  dessinerSansAlgo();
   
  prepareText();

}

void mouseClicked(){
 

               posMatY = ( mouseX - echelleX) / 64;
               posMatX = ( mouseY - echelleY) / 64;
               
if(posMatX >= 0 & posMatX < 3 & posMatY>=0 & posMatY < 3){

    if (solution.size() != 0) {
         
               //le bas 

               if(posMatX + 1 < 3 && grille[posMatX + 1][posMatY] == 0){
               
               grille[posMatX + 1][posMatY] = grille[posMatX][posMatY];
               
               grille[posMatX][posMatY] = 0;
               
               if(solution.size() != 0 && solution.get(0).grille_inter[posMatX][posMatY] == 0) { solution.remove(0);}
               else  {
                     
                        Node fils = new Node("D",null);
                        solution.get(0).dad=fils;
                        Collections.reverse(solution);
                        solution.add(fils);
                        Collections.reverse(solution);
               
                     }
               
               }
               else{
                  
                  //haut
                 
                  if(posMatX - 1 >= 0 && grille[posMatX - 1][posMatY] == 0){
                  
                  grille[posMatX-1][posMatY] = grille[posMatX][posMatY];
                  
                  grille[posMatX][posMatY] = 0;
                  
                  if(solution.size()!= 0 && solution.get(0).grille_inter[posMatX][posMatY] == 0) { solution.remove(0);}
                  else  {
                     
                        Node fils = new Node("U",null);
                        solution.get(0).dad = fils;
                        Collections.reverse(solution);
                        solution.add(fils);
                        Collections.reverse(solution);
               
                     }
               
               }else{

                  //gauche

                  if(posMatY - 1 >= 0 && grille[posMatX][posMatY - 1] == 0){
                  
                  grille[posMatX][posMatY - 1] = grille[posMatX][posMatY];
                  
                  grille[posMatX][posMatY] = 0;
                  
                  if(solution.size() != 0 && solution.get(0).grille_inter[posMatX][posMatY] == 0) {solution.remove(0);}
                  else   {
                     
                        Node fils = new Node("L",null);
                        solution.get(0).dad = fils;
                        Collections.reverse(solution);
                        solution.add(fils);
                        Collections.reverse(solution);
               
                     }

               }else{

                  if(posMatY + 1 < 3 && grille[posMatX][posMatY + 1] == 0){
                  
                  grille[posMatX][posMatY + 1] = grille[posMatX][posMatY];
                  
                  grille[posMatX][posMatY] = 0;
                  
                     if(solution.size() != 0 && solution.get(0).grille_inter[posMatX][posMatY] == 0) { solution.remove(0);}
                     else  {
                     
                        Node fils = new Node("R",null);
                        solution.get(0).dad = fils;
                        Collections.reverse(solution);
                        solution.add(fils);
                        Collections.reverse(solution);
               
                     }

                        }
               }
               
               
               }
               
               
            }
               dessiner();
      
         }else{

                  ok  = false;

               
                  grille = copy(grille3);

                  grille2 = copy(grille3);

                   prepareText();
         }

}

 }

void draw(){

   if(!ok){
      
     
      algorithmeA();
      
      dessiner();
     
      thread("algorithmeA2");
     
      ok = true;
 
     
   
   }

}
