public class Node2 implements Comparable<Node2>{
  
  int [][] grille_inter;

  float cout, h;

  Node2 dad;
  
  
      public Node2(String direction,Node2 d){
      
         grille_inter = new int[3][3];

         dad = d;
         
         if(dad==null)cout = 0;

         else cout= dad.cout + 1;

         cloner();

         inverse(direction);

         h = distanceEuclidienne() + cout; 
   
      }

      public int compareTo(Node2 n){  
         
         if(n.h == h)  

            return 0;

         else if(h > n.h)  
         
               return 1;  
            else  
               return -1;  
            
      }

      float distanceEuclidienne(){

        float d = 0;
        
         for (int i = 0; i < 3; ++i) {
            
            for (int j = 0; j < 3; ++j) {
               
               switch (grille_inter[i][j]) {
                  
                  case 1 : d = d + pow( abs(0-i) +  abs(0-j) ,2) ; break;
                  case 2 : d = d + pow( abs(0-i) +  abs(1-j) ,2) ; break;
                  case 3 : d = d + pow( abs(0-i) +  abs(2-j) ,2) ; break;
                  case 4 : d = d + pow( abs(1-i) +  abs(2-j) ,2) ; break;
                  case 5 : d = d + pow( abs(2-i) +  abs(2-j) ,2) ; break;
                  case 6 : d = d + pow( abs(2-i) +  abs(1-j) ,2) ; break;
                  case 7 : d = d + pow( abs(2-i) +  abs(0-j) ,2) ; break;
                  case 8 : d = d + pow( abs(1-i) +  abs(0-j) ,2) ; break;
                  
               
               }

            }
         }

         return sqrt(d);
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
                  
                  grille_inter[i][j] = grille2[i][j];
               }
            }
         }
      }

      void inverse(String direction){

         getPosition0();
         
         switch (direction) {
            
            case "U" :{

               grille_inter[x2][y2] = grille_inter[x2 - 1][y2];
               grille_inter[x2 - 1][y2] = 0;
            }break;

            case "D" :{

               grille_inter[x2][y2] = grille_inter[x2 + 1][y2];
               grille_inter[x2 + 1][y2] = 0;

            }break;

             case "L" :{

               grille_inter[x2][y2] = grille_inter[x2][y2 - 1];
               grille_inter[x2][y2 - 1] = 0;

            }break;

            case "R" :{

               grille_inter[x2][y2] = grille_inter[x2][y2 + 1];
               grille_inter[x2][y2 + 1] = 0;

            }break;  
         }
      }

      void getPosition0(){

         label1:
         for (int i = 0; i < 3; ++i) {
           
            for (int j = 0; j < 3; ++j) {
               
               if(grille_inter[i][j] == 0){

                  x2 = i;
                  y2 = j;

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
