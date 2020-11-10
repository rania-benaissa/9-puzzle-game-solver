void dessiner(){
  
  Node n = null;
  posX = 0;
  posY = 0;
  
 if(solution.size() != 0){

     n = solution.get(0);      
     
     cp5.get(Textfield.class,"nbcoupsValue").setText(String.valueOf(solution.size() + " coups"));
     
    }


  for (int i = 0; i < 3; ++i) {

        for (int j = 0; j < 3; ++j) {
            
            value = grille[i][j];

          if(n != null && n.grille_inter[i][j] == 0) { tint(255,255,0);}
           
            image(images[value],posX + echelleX, posY + echelleY);
            
            noTint();
        
            posX = posX + 64;
        }
         posX = 0;
         posY = posY + 64;
    }
    
     if(solution.size() == 0)  youWin();
    
}

void chargerImages(){
   
    for (int i = 0; i < 9; i++) {
        
        images[i] = loadImage("grille" + i + ".bmp");
       
    }
  
}

int [][] copy (int [] [] a){


  int [][] b = new int [3][3];


   for (int i = 0; i < 3; ++i) {
               
               for (int j = 0; j < 3; ++j) {
                  
                  b[i][j] = a[i][j];
               }
            }
            return b;
}

void dessinerSansAlgo(){
  
  posX = 0; posY = 0;
  
  for (int i = 0; i < 3 ; ++i) {

        for (int j = 0; j < 3; ++j) {
            
            value= grille[i][j];
           
            image(images[value],posX + echelleX,posY + echelleY);
            
            posX = posX + 64;
        }
         posX = 0;
         posY = posY + 64;
    }
    
}



void youWin(){
  
    fill(random(255), random(255), random(255));
    rect(echelleX + 32,echelleY + 64, w/3 - 32, h/3 - 64);
    fill(random(255), random(255), random(255));
    textSize(26);
    text(" YOU WIN ",echelleX + 32, echelleY + 115);

 
}


void prepareText(){


    cp5 = new ControlP5(this);
    
    algo1 = new Textlabel(cp5,"Heuristique 1 : ", 20, 330);
    algo2 = new Textlabel(cp5,"Heuristique 2 : ", 20, 390);
    tAlgo1Label = new Textlabel(cp5,"Temps d'execution : ", 10, 360);
    tAlgo2Label = new Textlabel(cp5,"Temps d'execution :", 10, 420);
    nbNode1Label = new Textlabel(cp5,"Nb.noeuds parcourus : ", 220, 360);
    nbNode2Label = new Textlabel(cp5,"Nb.noeuds parcourus : ", 220, 420);
    nbcoupsLabel = new Textlabel(cp5,"Nombre de coups restants : ", 60, 50);

    cp5.addTextfield("tAlgo1")
     .setPosition(150,355)
     .setSize(70,25)
     .setLabel("")
     .setColorBackground(#00695c)
     .setColorForeground(#00695c) 
     .lock()
     .setFont(font)
     .setText("0 s.");


      cp5.addTextfield("tAlgo2")
     .setPosition(150,415)
     .setSize(70,25)
     .setLabel("")
     .setColorBackground(#00695c)
     .setColorForeground(#00695c) 
     .lock()
     .setFont(font)
     .setText("0 s.");


      cp5.addTextfield("nbNode1")
     .setPosition(380,355)
     .setSize(50,25)
     .setLabel("")
     .setColorBackground(#00695c)
     .setColorForeground(#00695c) 
     .lock()
     .setFont(font)
     .setText("0");


       cp5.addTextfield("nbNode2")
     .setPosition(380,415)
     .setSize(50,25)
     .setLabel("")
     .setColorBackground(#00695c)
     .setColorForeground(#00695c) 
     .lock()
     .setFont(font)
     .setText("0");
     

      cp5.addTextfield("nbcoupsValue")
     .setPosition(310,49)
     .setSize(200,25)
     .setLabel("")
     .setColorBackground(#00695c)
     .setColorForeground(#00695c)
     .setText("0 coups")
     .lock()
     .setFont(font2);
    
 
    algo1.setFont(font2);
    algo2.setFont(font2);
    tAlgo1Label.setFont(font);
    tAlgo2Label.setFont(font);
    nbNode1Label.setFont(font);
    nbNode2Label.setFont(font);
    nbcoupsLabel.setFont(font2); 


    algo1.draw(this);
    algo2.draw(this);
    tAlgo1Label.draw(this);
    tAlgo2Label.draw(this);
    nbNode1Label.draw(this);
    nbNode2Label.draw(this);
    nbcoupsLabel.draw(this);

}
