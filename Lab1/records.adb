with Ada.Numerics.Float_Random;  use Ada.Numerics.Float_Random;
with Ada.Text_IO; 	         use Ada.Text_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;

package body Records is
   
   --solving task;
   function Solve (cmd : Command; e_flag : OUT Boolean) return Real is
   begin
      e_flag := FALSE;
      case cmd.Operator is 
         when '+' => return cmd.arg1 + cmd.arg2;
         when '-' => return cmd.arg1 - cmd.arg2;
         when '*' => return cmd.arg1 * cmd.arg2;
         when '/' => return cmd.arg1 / cmd.arg2;
         when others => 
            e_flag := TRUE;
            return Real(0);
      end case;
   end Solve;

   
   --command to string
   function Command_To_String (cmd : IN Command) return Unbounded_String is 
      Result : Unbounded_String;
   begin
      Result := To_Unbounded_String ("Task: " & Real'Image(cmd.arg1) & " " 
      & Character'Image(cmd.Operator) & Real'Image(cmd.arg2));
      return Result;
   end Command_To_String;

   
   procedure Show_Magazine (mag: IN Magazine) is 
   begin 
      for I in Magazine_capacity loop 
         Put_Line (To_String (mag(I)));
      end loop;
   end Show_Magazine;
         
   
end Records;

   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
