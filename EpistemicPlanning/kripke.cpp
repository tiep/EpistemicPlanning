#include "kstate.h"
#include "kripke.h"
#include "kedge.h"
#include "planner.h"
#include "define.h"

/*********************************************************************
 Kripke implementation
**********************************************************************/

Kripke::Kripke()
{
     
}

Kripke::Kripke(Kripke* k)
{
	states_list = k->get_stateslist();
    edges_list = k->get_edgeslist();
    //B edges;
    pId = k->get_pstate()->get_id();
}

Kripke::~Kripke()
{

}

States Kripke::get_stateslist()
{
	return states_list;
}

B Kripke::get_edges()
{
	return edges;
}

Edges Kripke::get_edgeslist()
{
    return edges_list;
}
Kstate* Kripke::get_pstate()
{
	return &states_list.at(pId);
}

int Kripke::get_id()
{
	return pId;
}

void Kripke::set_stateslist(States sl)
{
	states_list = sl;
}

void Kripke::set_edges(B el)
{		
	edges = el;	
}

void Kripke::set_edgeslist(Edges el)
{
    edges_list = el;
}

void Kripke::set_pId(int st)
{
	pId = st;
}

bool Kripke::entail_ff_list(const list<FluentFormula> ffs) const
{
	list<FluentFormula>::const_iterator itff;
	BFNode ff;
	ff.node_type = fluForm;
	for(itff = ffs.begin();itff!=ffs.end();itff++)
	{
		FluentFormula temp = *itff;
		ff.fluform = &temp;
		if(!entail(ff)){
			return false;
		}
	}
	return true;
}

bool Kripke::entail_BForm(BFNode node, Agent ag, bool atleastone) const
{
    Kripke temp;
    temp.set_stateslist(states_list);
    temp.set_edgeslist(edges_list);
    
    Kstate pState = states_list.at(pId);
    EdgeList el = pState.get_out();
    
	EdgeList::const_iterator it;
	
	bool exist_label;
	if(atleastone){
		exist_label = false;
	}else {
		exist_label = true;
	}	
	for(it = el.begin(); it != el.end(); it++)
	{
        Kedge edg = edges_list.at(*it);
		if(edg.get_label() == ag)
		{
			exist_label = true;
			temp.set_pId(edg.get_to());
			if(atleastone && !temp.entail(node))
            {
                return false;
            }else if(!atleastone && !temp.entail1(node)){
				return false;
			}
		}
	}
	if(!exist_label){
		return false;
	}	
	return true;
	
}

bool Kripke::isValid(AgentSet ag)
{
	Kstate p = states_list.at(pId);
	EdgeList el = p.get_out();
	EdgeList::iterator it;
    for(it = el.begin();it!=el.end();it++)
    {
		int label = edges_list.at(*it).get_label();
		ag.erase(label);
		if(ag.size()==0)
		{
			return true;
		}
	}
	return false;
}
StateList Kripke::reachableStates(int fromStateID, Agents ags) const
{
    Kstate src = states_list.at(fromStateID);
    StateList out;
    out.insert(fromStateID);
    
    StateList newlyadd;
    newlyadd.insert(fromStateID);
    while(newlyadd.size()!=0)
    {
        int curId = *newlyadd.begin();
        newlyadd.erase(newlyadd.begin());
        Kstate curstate = states_list.at(curId);
        EdgeList el = curstate.get_out();
        EdgeList::iterator it;
        for(it = el.begin();it!=el.end();it++)
        {
            Kedge e = edges_list.at(*it);
            Agent ag = e.get_label();
            //check edge's agent
            Agents::iterator it1;
            it1 = std::find(ags.begin(), ags.end(),ag);
            if(it1 == ags.end())
            {
                continue;
            }
            //check the state_to is in outlist or not yet
            int to = e.get_to();
            StateList::iterator islt;
            islt = out.find(to);
            if(islt == out.end())
            {
                out.insert(to);
                newlyadd.insert(to);
            }
        }
    }
    return out;
}

bool Kripke::entail(BFNode node) const
{
    switch (node.node_type)
    {
        case fluForm:
        {
            Kstate s = states_list.at(pId);
            return s.entail_fluform(*node.fluform);
        }
        case BForm:
        {
            Agent ag = node.agentPro2;
            BFNode bf = *node.bfnode1;
            return entail_BForm(bf,ag,true);
        }
        case propForm:
        {
            if(node.bfOperator == BFNOT)
            {
                return !entail(*node.bfnode1);
            }else if(node.bfOperator == BFOR)
            {
                return entail(*node.bfnode1) || entail(*node.bfnode2);
            }else if(node.bfOperator==BFAND)
            {
                return entail(*node.bfnode1) && entail(*node.bfnode2);
            }else{
                return true;
            }
        }
        case EForm:
        {
            Agents::iterator it;
            
            for(it = node.agents.begin(); it != node.agents.end(); it++)
            {
                if(!entail_BForm(*(node.bfnode1),*it,true))
                return false;
            }
            
            return true;
        }
        case CForm:
        {
            Agents ags = node.agents;
            StateList sl = reachableStates(pId,ags);
            StateList::iterator it;
            for(it = sl.begin(); it != sl.end(); it++)
            {
                Kripke temp;
                temp.set_stateslist(states_list);
                temp.set_edgeslist(edges_list);
                temp.set_pId(*it);
                if(!temp.entail(*node.bfnode1))
                {
                    return false;
                }
            }
            return true;
        }
        case BFEmpty:
            return true;
    }
}

bool Kripke::entail1(BFNode node) const
{
    switch (node.node_type)
    {
        case fluForm:
        {
            Kstate s = states_list.at(pId);
            return s.entail_fluform(*node.fluform);
        }
        case BForm:
        {
            Agent ag = node.agentPro2;
            BFNode bf = *node.bfnode1;
            return entail_BForm(bf,ag,false);
        }
        case propForm:
        {
            if(node.bfOperator == BFNOT)
            {
                return !entail1(*node.bfnode1);
            }else if(node.bfOperator == BFOR)
            {
                return entail1(*node.bfnode1) || entail1(*node.bfnode2);
            }else if(node.bfOperator==BFAND)
            {
                return entail1(*node.bfnode1) && entail1(*node.bfnode2);
            }else{
                return true;
            }
        }
        case EForm:
        {
            Agents::iterator it;
            
            for(it = node.agents.begin(); it != node.agents.end(); it++)
            {
                if(!entail_BForm(*(node.bfnode1),*it,false))
                return false;
            }
            
            return true;
        }
        case CForm:
        {
            Agents ags = node.agents;
            StateList sl = reachableStates(pId,ags);
            StateList::iterator it;
            for(it = sl.begin(); it != sl.end(); it++)
            {
                Kripke temp;
                temp.set_stateslist(states_list);
                temp.set_edgeslist(edges_list);
                temp.set_pId(*it);
                if(!temp.entail1(*node.bfnode1))
                {
                    return false;
                }
            }
            return true;
        }
        case BFEmpty:
            return true;
    }
}

void Kripke::add_kstate(Kstate ks){
    states_list.push_back(ks);
}


void Kripke::print_report()
{
	cout << "The number of states is: " << states_list.size() << endl;
	cout << "The number of edges is: " << edges_list.size() << endl;
    cout << "s is: " << states_list.at(pId).get_id() << endl << endl;

	States::iterator it;
	for(it = states_list.begin(); it != states_list.end(); it++)
	{
        it->print_info();
        cout << endl;
//        cout << "print states into...." << endl;
//        EdgeList::iterator iee;
//        for(iee = (*it)->get_in()->begin(); iee!= (*it)->get_in()->end(); iee++){
//            cout << "id of edge is " << (*iee)->get_id() << endl;
//        }
	}
    
    Edges::iterator ite;
    for(ite = edges_list.begin(); ite!=edges_list.end();ite++)
    {
		ite->print_info();
	}
    
    B::iterator it3;
    vector<int>::iterator it2;
    
    for(it3 = edges.begin(); it3 != edges.end(); it3++)
        for(it2 = it3->begin(); it2 != it3->end(); it2++)
        {
            cout << "Edge (" << edges_list.at(*it2).get_exist() << ") with id " << edges_list.at(*it2).get_id() << " has label " << edges_list.at(*it2).get_label()
            << " and connects worlds " << edges_list.at(*it2).get_from() << " --> "
            << edges_list.at(*it2).get_to() << endl;
        }
    cout << endl << endl;
}

void Kripke::add_edge2state(int stIndex, int edgeIndex, bool isOut)
{
	Kstate* st = &states_list.at(stIndex);
	if(isOut == true){
		st->add_out(edgeIndex);
	}else{
		st->add_in(edgeIndex);
	}
}

void Kripke::add_edge(Kedge k)
{
	edges_list.push_back(k);
}
