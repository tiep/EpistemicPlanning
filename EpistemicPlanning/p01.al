
%===========================
% FLUENT DECLARATION 
%===========================
fluent less(l1,l2);
fluent high(l1);
fluent high(l2);
fluent less(l2,l1);

%===============================
%ACTION EXECUTABILITY CONDITIONS
%===============================
executable cmpswap(l2,l1) if less(l2,l1);
executable cmpswap(l1,l2) if less(l1,l2);

%===============================
%ACTION EFFECTS 
%===============================
cmpswap(l2,l1) causes -high(l2) if -high(l1);
cmpswap(l2,l1) causes high(l1) if high(l2);
cmpswap(l1,l2) causes -high(l1) if -high(l2);
cmpswap(l1,l2) causes high(l2) if high(l1);

%===============================
%INITITAL STATE  
%===============================
initially less(l1,l2);
%initially high(l1)|-high(l1); 
%initially high(l2)|-high(l2) ;


%===============================
%GOAL STATE  
%===============================
goal  high(l2)|-high(l1) ;
%goal high(l1), high(l2);
