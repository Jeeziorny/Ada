with Ada.Numerics.Float_Random;  use Ada.Numerics.Float_Random;
with Ada.Text_IO; 	         use Ada.Text_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Records;                    use Records;

package body protectedCommand is 

   protected body Protected_Command_List is 
      
      procedure Get (X : IN OUT Command) is
         cmd : Command := ('E', 0.0, 0.0);
      begin
         if (last_Put /= Command_List'First) then 
            X := cmd_List(last_Put);
            last_Put := last_Put - 1;
         else 
            X := ('E', 0.0, 0.0);
         end if;
      end Get;
      
      function Is_Full return Boolean is 
      begin 
         if (last_Put = Command_List_Size'Last) then 
            return true;
         else 
            return false; 
         end if;
      end Is_Full;
         
      procedure Put (X : IN Command) is 
      begin
         if (last_Put < Command_List_Size'Last) then 
            last_Put := last_Put + 1;
            cmd_List(last_Put) := X;
         end if;
      end Put;
      
      procedure Show is 
      begin 
       for I in Command_List_Size loop 
         Put_Line (To_String(Command_To_String(cmd_List (I))));
       end loop;
       New_Line;
      end Show;
      
      procedure Init is 
      begin 
         for I in Command_List_Size loop 
           cmd_List(I).Operator := 'E';
           cmd_List(I).arg1 := 0.0;
           cmd_List(I).arg2 := 0.0;
         end loop;
      end Init;
      
      end Protected_Command_List;

end protectedCommand;
