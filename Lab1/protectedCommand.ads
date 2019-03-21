with Ada.Numerics.Float_Random;  use Ada.Numerics.Float_Random;
with Ada.Text_IO; 	         use Ada.Text_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Records;                    use Records;

package protectedCommand is

   protected Protected_Command_List is
      procedure Get (X : IN OUT Command);
      procedure Put (X : IN Command);
      procedure Show;
      procedure Init;
      function Is_Full return Boolean;
   private
      cmd_List : Command_List;
      last_Put : Command_List_Size;
   end Protected_Command_List;

end protectedCommand;
