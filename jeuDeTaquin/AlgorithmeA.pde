 import java.util.Collections;
 
 int x1 = 0, y1 = 0;

 boolean exists(ArrayList<Node> erase,Node fils){

     for (Node n : erase) {
         
         if(n.equalGrille(fils.grille_inter)){

             return true;
         }
     }

     return false;
 }

 boolean found(){

    if(arbre.size() != 0){ 

       if(arbre.get(0).equalGrille(confVictoire)) return true;
      
       return false;
      
      }else return true;
 }

 void algorithmeA(){

    long temps_deb, temps_fin;

    int nbNodes = 0;
    
     arbre.clear();
     erased.clear();
     solution.clear();
     
     
     arbre.add(new Node("root",null));
     temps_deb = System.currentTimeMillis();

   while(!found()){

    if(!exists(erased,arbre.get(0))){ 


        arbre.get(0).getPosition0();
        nbNodes++;
      
        //switch up
        if(x1 - 1 >= 0){
       
            Node fils = new Node("U",arbre.get(0));
       
            arbre.add(fils);
    
        }

         //switch down
        if(x1 + 1 < 3){
        
            Node fils = new Node("D",arbre.get(0));

               arbre.add(fils);
                
        }

          //switch left
        if(y1 - 1 >= 0){
        
            Node fils = new Node("L",arbre.get(0));
            
             arbre.add(fils);
                
        }

          //switch right
        if(y1 + 1 < 3){
        
            Node fils = new Node("R",arbre.get(0));

               arbre.add(fils);
       
        }
      
        erased.add(arbre.remove(0));
        Collections.sort(arbre);
      }
      else{

          arbre.remove(arbre.get(0));
          Collections.sort(arbre);
      }

        
  }

   if (arbre.size() != 0) {
       
    Node victoire = arbre.get(0);

    
    while(victoire.dad != null){

            solution.add(victoire);
            victoire = victoire.dad;
            
    }

    
    Collections.reverse(solution);
    temps_fin=System.currentTimeMillis();

  
    double seconds = (temps_fin - temps_deb) / 1000F;
    
    
     cp5.get(Textfield.class,"tAlgo1").setText(String.valueOf(String.format("%1.4f",seconds)) + " s.");
   
     cp5.get(Textfield.class,"nbNode1").setText(String.valueOf(nbNodes));

       

   }
    
 }
