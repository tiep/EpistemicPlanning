fluent y,x,z;

%action aa,bb,cc,dd,ee,ff;

agent a,b,c;

%y if -x;
%executable aa if B(a,(-x),y);
executable bb if x,(-y);
bb causes -x,z if (-y);
%bb causes y if (-y);
aa determines x;
cc announces y;
%dd announces (-x) | (-y);
%dd announces (x,y);
%b observes cc;
b aware_of bb;
a observes bb;
a observes aa;



initially -x;
%initially (y);
%initially (-z);
%initially C([a,b,c],-z);
initially C([a,b,c], -x);
initially C([a,b,c], B(a,-z));

%initially C([a,b], B(a,y) | B(a,(-y) , (-x)) );
%initially C([a,b], B(a,y) | B(a,(-y)));
%initially C([a,b], -B(a,y) , -B(a,(-y)));

goal -x;
