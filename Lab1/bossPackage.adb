with Ada.Numerics.Float_Random;  use Ada.Numerics.Float_Random;
with Ada.Text_IO; 	         use Ada.Text_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Records;                    use Records;
with protectedCommand;           use protectedCommand;
with protectedProgramMode;       use protectedProgramMode;

package body bossPackage is

   procedure boss is
      G        : Generator;
      CMD      : Command;  
   begin
      Reset (G);
      loop
         if (not Protected_Command_List.Is_Full) then 
            CMD.Operator := Symbols (Integer (Float'Ceiling (Random (G) * 4.0)));
            CMD.arg1     := Real (Random (G) * 10.0);
            CMD.arg2     := Real (Random (G) * 10.0);
            Protected_Command_List.Put(CMD);
            if (Protected_Program_Mode.isNoisy = True) then 
               Put_Line("Boss added task: " & To_String(Command_To_String(CMD)));
            end if;
         end if;
         delay bossDelay;
      end loop;
   end boss;

end bossPackage;
