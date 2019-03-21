with Ada.Numerics.Float_Random;  use Ada.Numerics.Float_Random;
with Ada.Text_IO; 	         use Ada.Text_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Records;                    use Records;

package body protectedMagazine is

   protected body Protected_Magazine is 
      procedure Get (X : OUT Unbounded_String) is
      begin
         if (last_Put /= Magazine_capacity'First) then 
            X := simpleMagazine(last_Put);
            last_Put := last_Put - 1;
         else 
            X := To_Unbounded_String("");
         end if;
      end Get;
      
      procedure Put (X : IN Unbounded_String) is 
      begin
         if (last_Put < Magazine_capacity'Last) then 
            last_Put := last_Put + 1;
            simpleMagazine(last_Put) := X;
         end if;
      end Put;
      
      procedure Show is 
      begin 
       for I in Magazine_capacity loop 
         Put_Line (To_String(simpleMagazine (I)));
       end loop;
       New_Line;
      end Show;
      
      procedure Init is 
      begin 
         for I in Magazine_capacity loop 
           simpleMagazine(I) := To_Unbounded_String("C");
         end loop;
         last_Put := Magazine_capacity'First;
      end Init;
      
      function Is_Full return Boolean is 
      begin 
         if (last_Put = Magazine_capacity'Last) then 
            return true;
         else 
            return false;
         end if;
      end Is_Full;
      
      end Protected_Magazine;

end protectedMagazine;
