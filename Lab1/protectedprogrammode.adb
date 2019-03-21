with Ada.Numerics.Float_Random;  use Ada.Numerics.Float_Random;
with Ada.Text_IO; 	         use Ada.Text_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Records;                    use Records;

package body protectedProgramMode is 

   protected body Protected_Program_Mode is 
      procedure SetNoisy (X : IN boolean) is 
      begin
         noisy_mode := X;
      end SetNoisy;
      
      function isNoisy return boolean is
      begin
         return noisy_mode;
      end isNoisy;
      
      end Protected_Program_Mode;

end protectedProgramMode;
