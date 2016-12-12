This repository contains a simple macro for stripping macro variables and displaying their values in your log.

```
data _null_;
   x = "   my value   ";
   call symput("mymac",x);
run;

%put mymac = [&mymac];

%letput(mymac);
```

