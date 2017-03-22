The `%let` statement is an effective way to trim leading and trailing spaces from macro variable values. The `%put` statement is an effective way to display macro variable values to the log. Using `%let` and `%put` together looks like this.

```
%let mymac = &mymac;
%put mymac = [&mymac];
```

Unfortunately, typing the macro variable name 4 times can become quite tedious. This repository contains a simple macro `%letput` that can be used to strip a macro variable and displaying its value in your log.

```
data _null_;
   x = "   my value   ";
   call symput("mymac",x);
run;

%put mymac = [&mymac];

%letput(mymac);
```

Log excerpt:

<kbd>![letput log excerpt](https://github.com/srosanba/sas-letput/blob/master/put_vs_letput.png)</kbd>

The benefits of `%letput` vs. `%let` + `%put` are:

1. You only have to type `mymac` once.
1. You don't have to type the [brackets].
1. The resulting macro variable value has been stripped (spaces removed from beginning and end).
1. The value displayed in the log is indented and color coded.

You can read more about the macro in the [SESUG paper](http://www.lexjansen.com/sesug/2015/121_Final_PDF.pdf).

## GOTCHA

Of course, this being the SAS macro language, nothing is perfect. If your macro variable values have double quotes in them you will get an error with `%letput`. Many alternative approaches were explored, but each came with its own shortcoming. It was decided that double quotes was the least likely item to show up in a macro variable value. On the plus side, if you do have double quotes in your macro variable values, simply comment out `%letput` for that macro variable.
