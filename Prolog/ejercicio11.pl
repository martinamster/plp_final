%intercalar(?L1, ?L2, ?L3). Son todos reversibles ya que no hago nada que necesite instanciado un parametro
intercalar([],L,L).
intercalar(L,[],[]).
intercalar([X|L1],[Y|L2],[X|[Y|L3]]) :- intercalar(L1,L2,L3). 
