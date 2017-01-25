#ifndef KSTATE_H
#define KSTATE_H
#include "define.h"
#include "kedge.h"



class Kedge;
typedef vector<int> EdgeList; // vector of edges' id
typedef vector<Kedge> Edges ;


class Kstate{
  protected:
    Literals lits;
    int id;
	EdgeList edge_out;
	EdgeList edge_in;
	bool exists;
    
  public:
	Kstate();
	Kstate* copy();
	virtual ~Kstate();

	/* operators */
	//bool checkEntail1(Literal);
	//bool checkEntail2(Literals);
	//bool checkEntail3(FluentFormula);

	EdgeList get_in();
	EdgeList get_out();
	Literals get_lits();
	int get_id();
	bool get_exist();
	void set_in(EdgeList);
	void set_out(EdgeList);
	void set_lits(Literals);
	void set_id(int);
	void set_exist(bool);
	void add_out(int);
	void add_in(int);
	void print_info();
    
    bool entail_fluform(FluentFormula) const;
    bool entail_lit(Literal) const;
    bool entail_lits(Literals) const;
  };

#endif
