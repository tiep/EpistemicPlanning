fluent f,g,h,i,j;

action a;
action b,c,d;


agent tiep,ben,son;
agent smith;

executable a if E([ben,tiep,son],f);
executable a if C([teip],B(ben,f));
executable b if -E([son,hehe],C([tiep,haha], -(g|h)));
b causes h if B(ben,f) | i,j,-f;
b causes -i if B(ben,f),E([smith],C([ben],-f|-i)) | i,j,-f;
a causes g,-h,i if B(ben,f) | h; 
c announces -g , -h , -i;
a determines f;
ben observes a if -g , -h , -i;
ben aware_of a if -g | -h | -i;

initially f;

goal -j,-h;

