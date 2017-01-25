fluent f,g,h,k;

action a,b,c;

executable b if f;

a causes f if g;
a causes f if -g;

b causes h;
%executable c if k;
%executable c if -k;

c causes k;

%initially g | -g;
%initially k | -k;

%goal (-h,-g) | (h,g);
%goal h|g;
goal (f | g), (f | -g);
%goal (g,-g);
