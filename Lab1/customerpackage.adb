with Ada.Numerics.Float_Random;  use Ada.Numerics.Float_Random;
with Ada.Text_IO; 	         use Ada.Text_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Records;                    use Records;
with protectedMagazine;          use protectedMagazine;
with protectedProgramMode;       use protectedProgramMode;

package body CustomerPackage is
   
   procedure customer is
      product : Unbounded_String;
      G       : Generator;
   begin
      Reset (G);
      delay Duration((Random (G) * 10.0));
      loop 
         protected_Magazine.Get(product);
         if (Protected_Program_Mode.isNoisy = TRUE and product /= "") then
            Put_Line ("Customer bought product " & To_String(product));
         end if;
         delay customerDelay;
      end loop;
   end customer;
   
end CustomerPackage;
