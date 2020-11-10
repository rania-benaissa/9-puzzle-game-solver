public class Node implements Comparable<Node>{
  
  int [][] grille_inter;

  int cout, h;

  Node dad;
  
  
      public Node(String direction,Node d){
      
         grille_inter = new int[3][3];

         dad = d;
         
         if(dad == null) cout = 0;
         else cout = dad.cout + 1;

         cloner();

         inverse(direction);

         h = nbrDeChiffresMalsPlaces() + cout; 
   
      }

      public int compareTo(Node n){  
      
         if(n.h == h)  
         return 0;
         
            else if(h > n.h)  
         
            return 1;  
            else  
            return -1;  
         
      }

      int nbrDeChiffresMalsPlaces(){

         int cpt = 8;

         for (int i = 0; i < 3; ++i) {
            
            for (int j = 0; j < 3; ++j) {
               
               if (confVictoire[i][j] != 0 && confVictoire[i][j] == grille_inter[i][j]) {
                  
                  cpt--;
               }

            }
         }
         return cpt;
      }

      void cloner(){

         if(dad != null)
         {
            for (int i = 0; i < 3; ++i) {
               
               for (int j = 0; j < 3; ++j) {
                  
                  grille_inter[i][j] = dad.grille_inter[i][j];
               }
            }

         }else {

            for (int i = 0; i < 3; ++i) {
               
               for (int j = 0; j < 3; ++j) {
                  
                  grille_inter[i][j] = grille[i][j];
               }
            }
         }
      }

      void inverse(String direction){

         getPosition0();
         
         switch (direction) {
            
            case "U" :{

               grille_inter[x1][y1] = grille_inter[x1 - 1][y1];
               grille_inter[x1 - 1][y1] = 0;
            }break;

            case "D" :{
               grille_inter[x1][y1] = grille_inter[x1 + 1][y1];
               grille_inter[x1 + 1][y1] = 0;
            }break;

             case "L" :{
               grille_inter[x1][y1] = grille_inter[x1][y1 - 1];
               grille_inter[x1][y1 - 1] = 0;
            }break;

            case "R" :{
               grille_inter[x1][y1] = grille_inter[x1][y1 + 1];
               grille_inter[x1][y1 + 1] = 0;
            }break;	
         }
      }

      void getPosition0(){

         label1:

         for (int i = 0; i < 3; ++i) {
           
            for (int j = 0; j < 3; ++j) {
               
               if(grille_inter[i][j] == 0){

                  x1 = i;
                  y1 = j;
                  break label1;
               }
            }
         }
      }

      boolean equalGrille(int [] [] g){

         
         for (int i = 0; i < 3; ++i) {
                  
            for (int j = 0; j < 3; ++j) {
               
               if(grille_inter[i][j] != g[i][j] ){

                 return false;
               }
            }
         }

         return true;
        
      }
      
     
}
