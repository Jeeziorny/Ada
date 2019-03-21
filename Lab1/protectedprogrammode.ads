package protectedProgramMode is

   protected Protected_Program_Mode is 
      function isNoisy return boolean;
      procedure SetNoisy (X : IN boolean);
   private
      noisy_mode : boolean := FALSE;
   end Protected_Program_Mode;

end protectedProgramMode;
