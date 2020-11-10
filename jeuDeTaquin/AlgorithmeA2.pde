 import java.util.Collections;
 
 int x2 = 0, y2 = 0;

  boolean exists2(ArrayList<Node2> erase, Node2 fils){

     for (Node2 n : erase) {
         
         if(n.equalGrille(fils.grille_inter)){

             return true;
         }
     }

     return false;
  }

  boolean found2(){

       if(arbre2.size() != 0){ 
         
       if(arbre2.get(0).equalGrille(confVictoire)) return true;
       return false;
      
      }else return true;
  }
 
  void algorithmeA2(){

      long temps_deb, temps_fin;
    
      int nbNodes2 = 0;

      arbre2.clear();
      erased2.clear();
      solution2.clear();
      
      
      arbre2.add(new Node2("root",null));

      temps_deb = System.currentTimeMillis();

    while(!found2()){

      if(!exists2(erased2,arbre2.get(0))){ 


          arbre2.get(0).getPosition0();
        
          nbNodes2++;
        
          //switch up
          if(x2 - 1 >= 0){
        
              Node2 fils = new Node2("U",arbre2.get(0));
        
                arbre2.add(fils);
              
          }

          //switch down
          if(x2 + 1 < 3){
          
              Node2 fils = new Node2("D",arbre2.get(0));

                arbre2.add(fils);
                  
          }

            //switch left
          if(y2 - 1 >= 0){
          
              Node2 fils = new Node2("L",arbre2.get(0));
              
              arbre2.add(fils);
                  
          }

            //switch right
          if(y2 + 1 < 3){
          
              Node2 fils = new Node2("R",arbre2.get(0));

                arbre2.add(fils);
        
          }
        
          erased2.add(arbre2.remove(0));
          Collections.sort(arbre2);
        }
        else{

            arbre2.remove(arbre2.get(0));
            Collections.sort(arbre2);
        }

          
    }

   if (arbre2.size() != 0) {
       
    Node2 victoire = arbre2.get(0);

    
    while(victoire.dad != null){

            solution2.add(victoire);
            victoire = victoire.dad;
            
    }

    
    Collections.reverse(solution2);
    temps_fin = System.currentTimeMillis();

  
    double seconds = (temps_fin - temps_deb) / 1000F;

     cp5.get(Textfield.class,"tAlgo2").setText(String.valueOf(String.format("%1.4f",seconds)) + " s.");

     cp5.get(Textfield.class,"nbNode2").setText(String.valueOf(nbNodes2));

   

   }
    
 }
