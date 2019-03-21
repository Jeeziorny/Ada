with Ada.Numerics.Float_Random;  use Ada.Numerics.Float_Random;
with Ada.Text_IO; 	         use Ada.Text_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Records;                    use Records;

package protectedMagazine is

   protected Protected_Magazine is 
      procedure Get (X : OUT Unbounded_String);
      procedure Put (X : IN Unbounded_String);
      procedure Show;
      procedure Init;
      function Is_Full return Boolean;
   private
      simpleMagazine : Magazine;
      last_Put : Magazine_capacity;
   end Protected_Magazine;

end protectedMagazine;
