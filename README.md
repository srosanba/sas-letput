This repository contains a simple macro `%letput` that can be used to strip a macro variable and displaying its value in your log.

```
data _null_;
   x = "   my value   ";
   call symput("mymac",x);
run;

%put mymac = [&mymac];

%letput(mymac);
```

Log excerpt:

<kbd>![letput log excerpt](https://github.com/srosanba/sas-letput/blob/master/letput.png)</kbd>

The benefits of `%letput` vs. `%put` are:

1. You only have to type `mymac` once.
1. You don't have to type the [brackets].
1. The resulting macro variable value has been stripped (spaces removed from beginning and end).
1. The value displayed in the log is indented and color coded.

You can read more about the macro in the [SESUG paper](http://www.lexjansen.com/sesug/2015/121_Final_PDF.pdf).
