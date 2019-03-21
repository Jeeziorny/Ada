with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; 	    use Ada.Text_IO;
with Ada.Numerics.Float_Random;

package Records is

   type Command_List_Size is range 0 .. 10;
   type Magazine_capacity is range 0 .. 20;
   
   type numOfWorkers is range 1 .. 10;
   type numOfCustomers is range 1 .. 10;
   
   bossDelay : constant Duration := 6.0;
   workerDelay : constant Duration := 24.0;
   customerDelay : constant Duration := 24.0;
   
   
   type Real is digits 5 range -1000.0 .. 1000.0;
   
   type Command is record
      Operator : Character;
      arg1     : Real;
      arg2     : Real;
   end record;
   
   Symbols : constant String := "+-*/E";
   
   type Command_List is array (Command_List_Size) of Command;
   type Magazine is array (Magazine_capacity) of Unbounded_String;
   
   function Solve (cmd : IN Command; e_flag : OUT Boolean) return Real;
   function Command_To_String (cmd : IN Command) return Unbounded_String;
   procedure Show_Magazine (mag: IN Magazine);
   
end Records;
