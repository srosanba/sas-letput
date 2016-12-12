This repository contains a simple macro `%letput` that can be used to strip a macro variable and displaying its value in your log.

```
data _null_;
   x = "   my value   ";
   call symput("mymac",x);
run;

%put mymac = [&mymac];

%letput(mymac);
```

As you can see, the differences between `%put` and `%letput` are:

1. You only have to type `mymac` once.
1. You don't have to type the [brackets].
1. The resulting macro variable value has been stripped (spaces removed from beginning and end).
1. The value displayed in the log is indented and color coded.
