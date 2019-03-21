with Ada.Text_IO; 	    use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Records;		    use Records;
with bossPackage;           use bossPackage;
with workerPackage;         use workerPackage;
with protectedCommand;      use protectedCommand;
with protectedMagazine;     use protectedMagazine;
with customerPackage;       use CustomerPackage;
with protectedProgramMode;  use protectedProgramMode;

procedure main is
   task type myBossTask;
   task body myBossTask is
   begin
      boss;
   end myBossTask;

   task type myWorkerTask;
   task body myWorkerTask is
   begin
      worker;
   end myWorkerTask;



   task type myCustomerTask;
   task body myCustomerTask is
   begin
      customer;
   end myCustomerTask;


   secondTask: myWorkerTask;
   firstTask : myBossTask;
   thirdTask : myCustomerTask;
   mode : Integer;

   bossTask   : myBossTask;

   C_Array : array (numOfCustomers) of myCustomerTask;
   W_Array : array (numOfWorkers) of myWorkerTask;

begin
   Put_Line("Choose program mode:");
   Put_Line("1. Silent mode.");
   Put_Line("2. Noisy mode.");
   mode := Integer'Value(Get_Line);
   if (mode = 1) then
      Protected_Program_Mode.SetNoisy(FALSE);
      Put_Line("You've choosen silent mode. Press 1 to show magazine or 2 for task list");
      loop
         mode := Integer'Value(Get_Line);
         if (mode = 1) then
            Protected_Magazine.show;
         elsif (mode = 2) then
            Protected_Command_List.Show;
         else
            Put_Line("Incorrect input, bye");
         end if;
         Put_Line("1 to show magazine, 2 to show task list");
      end loop;
   else
      Protected_Program_Mode.SetNoisy(TRUE);
   end if;

end main;
