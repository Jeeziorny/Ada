with Ada.Numerics.Float_Random;  use Ada.Numerics.Float_Random;
with Ada.Text_IO; 	         use Ada.Text_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Records;                    use Records;
with protectedCommand;           use protectedCommand;
with protectedMagazine;          use protectedMagazine;
with protectedProgramMode;       use protectedProgramMode;

package body workerPackage is
   
   procedure worker is 
      Curr_Cmd  : Command := ('E', 0.0, 0.0);
      solution  : Real;
      error_flag: Boolean := FALSE;
      solvedStr : Unbounded_String := To_Unbounded_String("");
      G         : Generator;
   begin
      Reset (G);
      delay Duration((Random (G) * 10.0));
      loop
         if (not Protected_Magazine.Is_Full) then 
            Protected_Command_List.Get(Curr_Cmd);
         end if;
         if (Curr_Cmd.Operator /= 'E') then 
            solution := solve(Curr_Cmd, error_flag);
            if (error_flag = FALSE) then 
               solvedStr := To_Unbounded_String (Curr_Cmd.arg1'Image) & 
               To_Unbounded_String (Curr_Cmd.Operator'Image) & 
               To_Unbounded_String (Curr_Cmd.arg2'Image) &
               To_Unbounded_String ("=") &
               To_Unbounded_String (solution'Image);
               Protected_Magazine.Put(solvedStr);
            end if;
         end if;
         
         if (Protected_Program_Mode.isNoisy = TRUE and solvedStr /= "") then 
            Put_Line("Worker solved: " & To_String(solvedStr));
         end if;
         delay workerDelay;
         error_flag := FALSE;
         solvedStr := To_Unbounded_String("");
      end loop;
   end worker;

end workerPackage;
