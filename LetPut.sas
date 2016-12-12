/*----------------------------------------------------------------------------------*

   *******************************************************
   *** Copyright 2015, Rho, Inc.  All rights reserved. ***
   *******************************************************

   MACRO:      %LetPut
   
   PURPOSE:    Write %let and %put statements for a given macro variable. E.g.,
   
                  %let mymacvar = &mymacvar;
                  %put NOTE- mymacvar = [&mymacvar];
               
   ARGUMENTS:  _mvar    => macro variable name.

   RETURNS:    None.

   USAGE:      Call the macro as a standalone statement. E.g., 

                  %LetPut(sqlobs);

   NOTES:      The purpose of the %let half of the macro is to trim leading and
               trailing spaces from the macro variable value.
               The purpose of the %put half of the macro is to write the value
               of the macro variable to the log (indented and blue).

   PROGRAM HISTORY:

   Date        Programmer        Description
   ---------   ---------------   ----------------------------------------------------
   2015-07-16  Shane Rosanbalm   Original program. 

*-----------------------------------------------------------------------------------*/

%macro letput(_mvar);

   %if %symexist(&_mvar) eq 1 %then %do;

      %let &_mvar = &&&_mvar;
      %put NOTE- &_mvar = [&&&_mvar];

   %end;

   %else %put NOTE- Macro variable %upcase(&_mvar) does not exist.;

%mend letput;