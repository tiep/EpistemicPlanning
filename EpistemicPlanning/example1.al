fluent tail, has_key_a, has_key_b, has_key_c, has_key_d, has_key_e, opened ,looking_a, looking_b, looking_c, looking_d, looking_e;

action open_a, open_b ,open_c, open_d, open_e;

action peek_a, peek_b, peek_c, peek_d, peek_e; 

action signal_a_b, signal_a_c,signal_a_d, signal_a_e, signal_b_a, signal_b_c, signal_b_d, signal_b_e, signal_c_a, signal_c_b, signal_c_d, signal_c_e, signal_d_a, signal_d_b,signal_d_c, signal_d_e,signal_e_a, signal_e_b,signal_e_c, signal_e_d;

action distract_a_b, distract_a_c, distract_a_d, distract_a_e, distract_b_a, distract_b_c, distract_b_d, distract_b_e, distract_c_a, distract_c_b,distract_c_d,distract_c_e, distract_d_a, distract_d_b, distract_d_c, distract_d_e, distract_e_a, distract_e_b, distract_e_c, distract_e_f;

action shout_tail_a, shout_tail_b, shout_tail_c, shout_tail_d, shout_tail_e;

agent a,b,c,d,e;

executable open_a if B(a,has_key_a), has_key_a;
executable open_b if B(b,has_key_b),has_key_b;
executable open_c if B(c,has_key_c),has_key_c;
executable open_d if B(d,has_key_d),has_key_d;
executable open_e if B(e,has_key_e),has_key_e;

executable peek_a if B(a,opened), B(a,looking_a), looking_a, opened;
executable peek_b if B(b,opened), B(b,looking_b), looking_b, opened;
executable peek_c if B(c,opened), B(c,looking_c), looking_c, opened;
executable peek_d if B(d,opened), B(d,looking_d), looking_d, opened;
executable peek_e if B(e,opened), B(e,looking_e), looking_e, opened;

executable signal_a_b if  B(a, looking_a), B(a, -looking_b), looking_a, -looking_b;
executable signal_a_c if  B(a, looking_a), B(a, -looking_c), looking_a, -looking_c;
executable signal_a_d if  B(a, looking_a), B(a, -looking_d), looking_a, -looking_d;
executable signal_a_e if  B(a, looking_a), B(a, -looking_e), looking_a, -looking_e;

executable signal_b_a if  B(b, looking_b), B(b, -looking_a), looking_b, -looking_a;
executable signal_b_c if  B(b, looking_b), B(b, -looking_c), looking_b, -looking_c;
executable signal_b_d if  B(b, looking_b), B(b, -looking_d), looking_b, -looking_d;
executable signal_b_e if  B(b, looking_b), B(b, -looking_e), looking_b, -looking_e;

executable signal_c_a if  B(c, looking_c), B(c, -looking_a), looking_c, -looking_a;
executable signal_c_b if  B(c, looking_c), B(c, -looking_b), looking_c, -looking_b;
executable signal_c_d if  B(c, looking_c), B(c, -looking_d), looking_c, -looking_d;
executable signal_c_e if  B(c, looking_c), B(c, -looking_e), looking_c, -looking_e;

executable signal_d_a if  B(d, looking_d), B(d, -looking_a), looking_d, -looking_a;
executable signal_d_b if  B(d, looking_d), B(d, -looking_b), looking_d, -looking_b;
executable signal_d_c if  B(d, looking_d), B(d, -looking_c), looking_d, -looking_c;
executable signal_d_e if  B(d, looking_d), B(d, -looking_e), looking_d, -looking_e;

executable signal_e_a if  B(e, looking_e), B(e, -looking_a), looking_e, -looking_a;
executable signal_e_b if  B(e, looking_e), B(e, -looking_b), looking_e, -looking_b;
executable signal_e_c if  B(e, looking_e), B(e, -looking_c), looking_e, -looking_c;
executable signal_e_d if  B(e, looking_e), B(e, -looking_d), looking_e, -looking_d;

executable distract_a_b if B(a,looking_a), B(a, looking_b), looking_a, looking_b;
executable distract_a_c if B(a,looking_a), B(a, looking_c), looking_a, looking_c;
executable distract_a_d if B(a,looking_a), B(a, looking_d), looking_a, looking_d;
executable distract_a_e if B(a,looking_a), B(a, looking_e), looking_a, looking_e;

executable distract_b_a if B(b,looking_b), B(b, looking_a), looking_b, looking_a;
executable distract_b_c if B(b,looking_b), B(b, looking_c), looking_b, looking_c;
executable distract_b_d if B(b,looking_b), B(b, looking_d), looking_b, looking_d;
executable distract_b_e if B(b,looking_b), B(b, looking_e), looking_b, looking_e;

executable distract_c_a if B(c,looking_c), B(c, looking_a), looking_c, looking_a;
executable distract_c_b if B(c,looking_c), B(c, looking_b), looking_c, looking_b;
executable distract_c_d if B(c,looking_c), B(c, looking_d), looking_c, looking_d;
executable distract_c_e if B(c,looking_c), B(c, looking_e), looking_c, looking_e;

executable distract_d_a if B(d,looking_d), B(d, looking_a), looking_d, looking_a;
executable distract_d_b if B(d,looking_d), B(d, looking_b), looking_d, looking_b;
executable distract_d_c if B(d,looking_d), B(d, looking_c), looking_d, looking_c;
executable distract_d_e if B(d,looking_d), B(d, looking_e), looking_d, looking_e;

executable distract_e_a if B(e,looking_e), B(e, looking_a), looking_e, looking_a;
executable distract_e_b if B(e,looking_e), B(e, looking_b), looking_e, looking_b;
executable distract_e_c if B(e,looking_e), B(e, looking_c), looking_e, looking_c;
executable distract_e_d if B(e,looking_e), B(e, looking_d), looking_e, looking_d;

executable shout_tail_a if B(a,tail), tail;
executable shout_tail_b if B(b,tail), tail;
executable shout_tail_c if B(c,tail), tail;
executable shout_tail_d if B(d,tail), tail;
executable shout_tail_e if B(e,tail), tail;

open_a causes opened;
open_b causes opened;
open_c causes opened;
open_d causes opened;
open_e causes opened;

signal_a_b causes looking_b;
signal_a_c causes looking_c;
signal_a_d causes looking_d;
signal_a_e causes looking_e;

signal_b_a causes looking_a;
signal_b_c causes looking_c;
signal_b_d causes looking_d;
signal_b_e causes looking_e;

signal_c_a causes looking_a;
signal_c_b causes looking_b;
signal_c_d causes looking_d;
signal_c_e causes looking_e;

distract_a_b causes -looking_b;
distract_a_c causes -looking_c;
distract_a_d causes -looking_d;
distract_a_e causes -looking_e;

distract_b_a causes -looking_a;
distract_b_c causes -looking_c;
distract_b_d causes -looking_d;
distract_b_e causes -looking_e;

distract_c_a causes -looking_a;
distract_c_b causes -looking_b;
distract_c_d causes -looking_d;
distract_c_e causes -looking_e;

distract_d_a causes -looking_a;
distract_d_b causes -looking_b;
distract_d_c causes -looking_c;
distract_d_e causes -looking_e;

distract_e_a causes -looking_a;
distract_e_b causes -looking_b;
distract_e_c causes -looking_c;
distract_e_d causes -looking_d;

peek_a determines tail;
peek_b determines tail;
peek_c determines tail;
peek_d determines tail;
peek_e determines tail;


shout_tail_a announces tail;
shout_tail_b announces tail;
shout_tail_c announces tail;
shout_tail_d announces tail;
shout_tail_e announces tail;

a observes open_a;
b observes open_b;
c observes open_c;
d observes open_d;
e observes open_e;

a observes peek_a;
b observes peek_b;
c observes peek_c;
d observes peek_d;
e observes peek_e;

a observes open_b if looking_a;
a observes open_c if looking_a;
a observes open_d if looking_a;
a observes open_e if looking_a;

b observes open_a if looking_b;
b observes open_c if looking_b;
b observes open_d if looking_b;
b observes open_e if looking_b;

c observes open_a if looking_c;
c observes open_b if looking_c;
c observes open_d if looking_c;
c observes open_e if looking_c;

d observes open_a if looking_d;
d observes open_b if looking_d;
d observes open_c if looking_d;
d observes open_e if looking_d;

e observes open_a if looking_e;
e observes open_b if looking_e;
e observes open_c if looking_e;
e observes open_d if looking_e;

a aware_of peek_b if looking_a;
a aware_of peek_c if looking_a;
a aware_of peek_d if looking_a;
a aware_of peek_e if looking_a;

b aware_of peek_a if looking_b;
b aware_of peek_c if looking_b;
b aware_of peek_d if looking_b;
b aware_of peek_e if looking_b;

c aware_of peek_a if looking_c;
c aware_of peek_b if looking_c;
c aware_of peek_d if looking_c;
c aware_of peek_e if looking_c;

d aware_of peek_a if looking_d;
d aware_of peek_b if looking_d;
d aware_of peek_c if looking_d;
d aware_of peek_e if looking_d;

e aware_of peek_a if looking_e;
e aware_of peek_b if looking_e;
e aware_of peek_c if looking_e;
e aware_of peek_d if looking_e;

a observes shout_tail_a;
a observes shout_tail_b;
a observes shout_tail_c;
a observes shout_tail_d;
a observes shout_tail_e;

b observes shout_tail_a;
b observes shout_tail_c;
b observes shout_tail_b;
b observes shout_tail_d;
b observes shout_tail_e;

c observes shout_tail_c;
c observes shout_tail_a;
c observes shout_tail_b;
c observes shout_tail_d;
c observes shout_tail_e;

a observes distract_a_b;
a observes distract_a_c;
a observes distract_a_d;
a observes distract_a_e;
a observes distract_b_a;
a observes distract_c_a;
a observes distract_d_a;
a observes distract_e_a;

b observes distract_b_a;
b observes distract_b_c;
b observes distract_b_d;
b observes distract_b_e;
b observes distract_a_b;
b observes distract_c_b;
b observes distract_d_b;
b observes distract_e_b;

c observes distract_c_a;
c observes distract_c_b;
c observes distract_c_d;
c observes distract_c_e;
c observes distract_a_c;
c observes distract_b_c;
c observes distract_d_c;
c observes distract_e_c;

d observes distract_d_a;
d observes distract_d_b;
d observes distract_d_c;
d observes distract_d_e;
d observes distract_a_d;
d observes distract_b_d;
d observes distract_c_d;
d observes distract_e_d;

e observes distract_e_a;
e observes distract_e_b;
e observes distract_e_c;
e observes distract_e_d;
e observes distract_a_e;
e observes distract_b_e;
e observes distract_c_e;
e observes distract_d_e;


a observes signal_a_b;
a observes signal_a_c;
a observes signal_a_d;
a observes signal_a_e;
a observes signal_b_a;
a observes signal_c_a;
a observes signal_d_a;
a observes signal_e_a;

b observes signal_b_a;
b observes signal_b_c;
b observes signal_b_d;
b observes signal_b_e;
b observes signal_a_b;
b observes signal_c_b;
b observes signal_d_b;
b observes signal_e_b;

c observes signal_c_a;
c observes signal_c_b;
c observes signal_c_d;
c observes signal_c_e;
c observes signal_a_c;
c observes signal_b_c;
c observes signal_d_c;
c observes signal_e_c;

d observes signal_d_a;
d observes signal_d_b;
d observes signal_d_c;
d observes signal_d_e;
d observes signal_a_d;
d observes signal_b_d;
d observes signal_c_d;
d observes signal_e_d;

e observes signal_e_a;
e observes signal_e_b;
e observes signal_e_c;
e observes signal_e_d;
e observes signal_a_e;
e observes signal_b_e;
e observes signal_c_e;
e observes signal_d_e;

initially C([a,b,c],has_key_a);
initially C([a,b,c],-has_key_b);
initially C([a,b,c],-has_key_c);
initially C([a,b,c],-has_key_d);
initially C([a,b,c],-has_key_e);
initially C([a,b,c],-opened);
%initially C([a,b,c],-B(a,tail) , -B(a,(-tail));
%initially C([a,b,c],-B(b,tail) , -B(b,(-tail));
%initially C([a,b,c],-B(c,tail) , -B(c,(-tail));
initially C([a,b,c],looking_a);
initially C([a,b,c],looking_b);
initially C([a,b,c],looking_c);
initially C([a,b,c],looking_d);
initially C([a,b,c],looking_e);
initially tail, has_key_a, -has_key_b, -has_key_c,-has_key_d,-has_key_e, -opened ,looking_a, looking_b, looking_c, looking_d, looking_e;
%initially C([a,b,c],B(a,tail));


goal B(b,tail) | B(b,-tail);
goal B(d,(-B(b,tail)) , (-B(b,-tail)));
goal B(c,(-B(b,tail)), (-B(b,-tail)));
