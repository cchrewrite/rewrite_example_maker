


rewrite_basic([X,Y],X,Y,[]).
rewrite_basic([X,Y],[T|L],[S|L],[1|P]):-
  \+var(L),
  rewrite_basic([X,Y],T,S,P).
rewrite_basic([X,Y],[T|LT],[T|LS],[R|LP]):-
  \+var(LT),
  rewrite_basic([X,Y],LT,LS,[P|LP]),
  R is P + 1.

round6(X,Y):-
  round(X*1000000,T),
  Y is T / 1000000.

rewrite_numeric([xplus,[xnum,A],[xnum,B]],[xnum,C],[]):-
  number(A),
  number(B),
  T is A + B,
  round6(T,C).
rewrite_numeric([xminus,[xnum,A],[xnum,B]],[xnum,C],[]):-
  number(A),
  number(B),
  T is A - B,
  round6(T,C).
rewrite_numeric([xmult,[xnum,A],[xnum,B]],[xnum,C],[]):-
  number(A),
  number(B),
  T is A * B,
  round6(T,C).
rewrite_numeric([xdiv,[xnum,A],[xnum,B]],[xnum,C],[]):-
  number(A),
  number(B),
  T is A / B,
  round6(T,C).
rewrite_numeric([xneg,[xnum,X]],[xnum,Y],[]):-
  number(X),
  T is 0 - X,
  round6(T,Y).
rewrite_numeric([T|L],[S|L],[1|P]):-
  ground([T|L]),
  rewrite_numeric(T,S,P).
rewrite_numeric([T|LT],[T|LS],[R|LP]):-
  ground([T|LT]),
  rewrite_numeric(LT,LS,[P|LP]),
  R is P + 1.

rewrite_all_to_polynominal(SExpr,TExpr):-
  RSet = [

    % (X + Y) + Z <= X + (Y + Z)
    [add_asso2,[xplus,X,[xplus,Y,Z]],[xplus,[xplus,X,Y],Z]],

    % X - Y => X + (-Y)
    [minus_to_plus1,[xminus,X,Y],[xplus,X,[xmult,[xnum,-1],Y]]],

    % (X * Y) * Z <= X * (Y * Z)
    [mult_asso2,[xmult,X,[xmult,Y,Z]],[xmult,[xmult,X,Y],Z]],

    % X * (Y + Z) => X * Y + X * Z
    [mult_dist1,[xmult,X,[xplus,Y,Z]],[xplus,[xmult,X,Y],[xmult,X,Z]]],

    % (X + Y) * Z => X * Z + Y * Z
    [mult_dist3,[xmult,[xplus,X,Y],Z],[xplus,[xmult,X,Z],[xmult,Y,Z]]]
  ],
  member([_,X1,Y1],RSet),
  copy_term([X1,Y1],R),
  rewrite_basic(R,SExpr,TempExpr,_),
  rewrite_all_to_polynominal(TempExpr,TExpr),
  !.
rewrite_all_to_polynominal(Expr,Expr):-!.

get_fitst_n_element(_,0,[]):-!.
get_fitst_n_element([X|L],N,[X|LT]):-
  N1 is N - 1,
  get_fitst_n_element(L,N1,LT),
  !.

dnn_rulelist(RSet,RList):-
  RList = RSet.
  %random_permutation(RSet,RList).
 
  %get_fitst_n_element(R1,8,RList).
  
:- dynamic searched/1.

rewrite_search(RSet,SExpr,TExpr,Path,MaxDepth,HintList):-
  MaxDepth > 0,
  D1 is MaxDepth - 1,
  (
    HintList = [],
    RNList = []
    ;
    HintList \= [],
    HintList = [RN|RNList]
  ),
  dnn_rulelist(RSet,RList),
  member([RN,X1,Y1],RList),
  rewrite_rule_sym(N,RN),
  copy_term([X1,Y1],R),
  (
    RN = numeric,
    rewrite_numeric(SExpr,T,P)
    ;
    RN \= numeric,
    rewrite_basic(R,SExpr,T,P)
  ),
  (
    T = TExpr,
    Path = [[SExpr,N,P]]
    ;
    \+cyclic_term(T),
    \+searched(T),
    (
      ground(T),
      assert(searched(T))
      ;
      \+ground(T)
    ),
    rewrite_search(RSet,T,TExpr,P1,D1,RNList),
    Path = [[SExpr,N,P]|P1]
  ).

for(K,P,Q):-
  P =< Q,
  K = P.
for(K,P,Q):-
  P < Q,
  P1 is P + 1,
  for(K,P1,Q).

rewrite_shortest(RSet,SExpr,TExpr,Path,MaxDepth,HintList):-
  length(HintList,MinDepth),
  for(Depth,MinDepth,MaxDepth),
  retractall(searched(_)),
  \+cyclic_term(SExpr),
  assert(searched(SExpr)),
  rewrite_search(RSet,SExpr,TExpr,Path,Depth,HintList),
  length(Path,Depth),
  !.

substitute_all([],_,[]):-!.
substitute_all(X,[xsub,X,Y],Y):-!.
substitute_all([T|L],[xsub,X,Y],[TT|LT]):-
  substitute_all(T,[xsub,X,Y],TT),
  substitute_all(L,[xsub,X,Y],LT),
  !.
substitute_all(T,[xsub,X,_],T):-
  T \= X,
  !.
  






get_first_element(_,0,[]).
get_first_element([],N,[norule|Res1]):-
  N > 0,
  N1 is N - 1,
  get_first_element([],N1,Res1).
get_first_element([X|L],N,[X|Res1]):-
  N > 0,
  N1 is N - 1,
  get_first_element(L,N1,Res1).

prev_path_extension([],_,_,[]).
prev_path_extension([[Expr,Rule,Pos]|L],N,Prev,[[Expr,[Rule|ExPath],Pos]|LT]):-
  prev_path_extension(L,N,[Rule|Prev],LT),
  get_first_element(Prev,N,ExPath).
  
copy_n_times(_,0,[]):-!.
copy_n_times(X,N,[X|L]):-
  N > 0,
  N1 is N - 1,
  copy_n_times(X,N1,L),
  !.

produce_empty_tree(_,0,novalue):-!.
produce_empty_tree(B,D,[novalue|L]):-
  D > 0,
  D1 is D - 1,
  produce_empty_tree(B,D1,Res1),
  copy_n_times(Res1,B,L),
  !.

get_partial_tree([X|_],_,0,X):-!.
get_partial_tree(X,_,0,X):-
  \+is_list(X),
  !.
get_partial_tree([X|L],Breadth,Depth,[X|LT]):-
  Depth > 0,
  D1 is Depth - 1,
  get_partial_tree2(L,Breadth,D1,LT),
  !.
get_partial_tree(X,Breadth,Depth,[X|LT]):-
  \+is_list(X),
  Depth > 0,
  D1 is Depth - 1,
  get_partial_tree2([],Breadth,D1,LT),
  !.


get_partial_tree2(L,Breadth,Depth,Res):-
  findall(XT,(member(X,L),get_partial_tree(X,Breadth,Depth,XT)),Res1),
  length(L,LenL),
  length(XT,LenL), % Check if the lengths agree.
  N1 is Breadth - LenL,  
  produce_empty_tree(Breadth,Depth,TEmpty),
  copy_n_times(TEmpty,N1,Res2),
  append(Res1,Res2,Res),
  !.

tree_centralise(_,T,0,T):-!.
tree_centralise(_,[novalue|L],Depth,[novalue|L]):-
  Depth > 0,
  !.
tree_centralise(FT,T,Depth,Res):-
  Depth > 0,
  append(T1,[_|[]],T),
  append(T1,[FT],[Func|ArgList]),
  D1 is Depth - 1,
  findall(
    PT,
    (
      member(P,ArgList),
      tree_centralise([Func|ArgList],P,D1,PT)
    ),
    ArgListT
  ),
  Res = [Func|ArgListT],
  !.
  

cut_tree([X|_],0,X):-!.
cut_tree(X,0,X):-
  \+is_list(X),
  !.
cut_tree([X|L],Depth,[X|LT]):-
  Depth > 0,
  D1 is Depth - 1,
  findall(
    PT,
    (
      member(P,L),
      cut_tree(P,D1,PT)
    ),
    LT
  ),
  length(L,Len),
  length(LT,Len),
  !.
 

tree_centralise_start([X|L],Depth,Res):-
  D1 is Depth - 1,
  findall(
    PT,
    (
      member(P,L),
      tree_centralise([X|L],P,D1,PT)
    ),
    L1
  ),
  cut_tree([X|L1],Depth,[X|LT]),
  (
    LT = L,
    Res = [X|LT]
    ;
    LT \= L,
    tree_centralise_start([X|LT],Depth,Res)
  ),
  !.
  

produce_centralised_tree(T,Breadth,Depth,Res):-
  get_partial_tree(T,Breadth,Depth,PT),
  tree_centralise_start(PT,Depth,Res),
  !.



get_sub_tree(X,_,X,[]).
get_sub_tree([_|L],Depth,T,[I|P]):-
  Depth > 0,
  length(L,N),
  D1 is Depth - 1,
  for(I,1,N),
  nth1(I,L,X),
  get_sub_tree(X,D1,T,P).

tree_depth(X,0):-
  \+is_list(X),
  !.
tree_depth([_|L],Depth):-
  setof(
    D,
    X^(
      member(X,L),
      tree_depth(X,D)
    ),
    DList
  ),
  append(_,[DMax],DList),
  Depth is DMax + 1,
  !.

partial_tree_extension([],_,_,[]).
partial_tree_extension([[Expr,Rule,Pos]|L],Breadth,Depth,Res):-
  tree_depth(Expr,ExprDepth),
  DFull is ExprDepth + Depth,
  produce_centralised_tree(Expr,Breadth,DFull,CtdExpr),
  (
    ExprDepth > Depth,
    D1 is ExprDepth - Depth
    ;
    ExprDepth =< Depth,
    D1 = 0
  ),
  findall(
    [P,T,Rule,Pos],
    (
      get_sub_tree(CtdExpr,ExprDepth,X,P),
      X \= [novalue|_],
      get_partial_tree(X,Breadth,Depth,T)
    ),
    ExList
  ),
  partial_tree_extension(L,Breadth,Depth,LT),
  append(ExList,LT,Res).

:- dynamic num_tree_sym/1.
:- dynamic tree_sym/2.
:- retractall(num_tree_sym(_)).
:- retractall(tree_sym(_,_)).
:- assert(num_tree_sym(0)).
:- assert(tree_sym(0,novalue)).

tree_to_vector([],[]):-!.
tree_to_vector([X|L],[XT|LT]):-
  (
     tree_sym(N,X),
     XT = N
     ;
     \+tree_sym(_,X),
     num_tree_sym(N1),
     retractall(num_tree_sym(_)),
     N is N1 + 1,
     assert(num_tree_sym(N)),
     assert(tree_sym(N,X)),
     XT = N
  ),
  tree_to_vector(L,LT),
  !.




:- dynamic num_sel_sym/1.
:- dynamic sel_sym/2.
:- retractall(num_sel_sym(_)).
:- retractall(sel_sym(_,_)).
:- assert(num_sel_sym(0)).
:- assert(sel_sym(0,novalue)).

sel_to_vector([],[]):-!.
sel_to_vector([X|L],[XT|LT]):-
  (
     sel_sym(N,X),
     XT = N
     ;
     \+sel_sym(_,X),
     num_sel_sym(N1),
     retractall(num_sel_sym(_)),
     N is N1 + 1,
     assert(num_sel_sym(N)),
     assert(sel_sym(N,X)),
     XT = N
  ),
  sel_to_vector(L,LT),
  !.




:- dynamic num_tree_pos_sym/1.
:- dynamic tree_pos_sym/2.
:- retractall(num_tree_pos_sym(_)).
:- retractall(tree_pos_sym(_,_)).
:- assert(num_tree_pos_sym(1)).
:- assert(tree_pos_sym(1,[])).

tree_pos_to_vector(X,XT):-
  tree_pos_sym(N,X),
  XT = N,
  !.
tree_pos_to_vector(X,XT):-
  \+tree_pos_sym(_,X),
  num_tree_pos_sym(N1),
  retractall(num_tree_pos_sym(_)),
  N is N1 + 1,
  assert(num_tree_pos_sym(N)),
  assert(tree_pos_sym(N,X)),
  XT = N.


:- dynamic num_rule_and_pos_sym/1.
:- dynamic rule_and_pos_sym/2.
:- retractall(num_rule_and_pos_sym(_)).
:- retractall(rule_and_pos_sym(_,_)).
:- assert(num_rule_and_pos_sym(0)).
:- assert(rule_and_pos_sym(0,novalue)).

rule_and_pos_to_vector(X,XT):-
  rule_and_pos_sym(N,X),
  XT = N,
  !.
rule_and_pos_to_vector(X,XT):-
  \+rule_and_pos_sym(_,X),
  num_rule_and_pos_sym(N1),
  retractall(num_rule_and_pos_sym(_)),
  N is N1 + 1,
  assert(num_rule_and_pos_sym(N)),
  assert(rule_and_pos_sym(N,X)),
  XT = N.

nth_sp(X,[X|_],1).
nth_sp(X,[_|L],N):-
  nth_sp(X,L,N1),
  N is N1 + 1.

find_same_element(L,[P,Q]):-
  nth_sp(X,L,P),
  X \= 0,
  nth_sp(X,L,Q),
  P \= Q.

rulelist_to_vector([],[]):-!.
rulelist_to_vector([norule|L],[0|LT]):-
  rulelist_to_vector(L,LT),
  !.
rulelist_to_vector([X|L],[X|LT]):-
  rulelist_to_vector(L,LT),
  !.

produce_feature([],[]):-!.
produce_feature([[P,T,[Rule|PrevRule],Pos]|L],[[PT,TT,ST,PosT,PRuleT]|LT]):-
  tree_pos_to_vector(P,PT),
  flatten(T,FT),
  tree_to_vector(FT,TT),
  findall(
    W,
    find_same_element(TT,W),
    S
  ),
  sel_to_vector(S,ST),
  rule_and_pos_to_vector([Rule|Pos],PosT),
  rulelist_to_vector(PrevRule,PRuleT),
  produce_feature(L,LT).

write_element([],_).
write_element([X|L],Stream):-
  write(Stream,X),
  write(Stream,' '),
  write_element(L,Stream).

write_log_file:-
  open('log.txt',write,Stream),
  logfile(L),
  write_by_line(Stream,L),
  close(Stream).

write_feature_to_file(L,FileName):-
  open(FileName,write,Stream),
  num_tree_pos_sym(N1),
  num_tree_sym(N2),
  num_sel_sym(N3),
  num_rule_and_pos_sym(N4),
  num_rewrite_rule(N5),
  L = [[_,T,_,_,PRule]|_],
  length(T,M),
  length(PRule,U),
  length(L,N),
  write_element([N,N1,M,N2,N3,N4,U,N5],Stream),
  nl(Stream),
  write_feature(L,Stream),
  nl(Stream),
  close(Stream).

write_feature([],_).
write_feature([[P,T,S,R,PR]|L],Stream):-
  write(Stream,P),
  nl(Stream),
  write_element(T,Stream),
  nl(Stream),
  length(S,LS),
  write(Stream,LS),
  write(Stream,' '),
  write_element(S,Stream),
  nl(Stream),
  write(Stream,R),
  nl(Stream),
  write_element(PR,Stream),
  nl(Stream),
  write_feature(L,Stream).
 

print_by_line([]).
print_by_line([X|L]):-
  print(X),nl,
  print_by_line(L).

write_by_line(_,[]).
write_by_line(Stream,[X|L]):-
  nl(Stream),write(Stream,X),nl(Stream),
  write_by_line(Stream,L).


expr_to_prefix(ukx,[xnum,_]):-!.
expr_to_prefix(X,[xnum,X]):-
  number(X),
  !.
expr_to_prefix(X,X):-
  \+number(X),
  atom(X),
  !.
expr_to_prefix([X,S,Y],Res):-
  (
    S = '=',
    ST = xequal
    ;
    S = '+',
    ST = xplus
    ;
    S = '-',
    ST = xminus
    ;
    S = '*',
    ST = xmult
    ;
    S = '/',
    ST = xdiv
    ;
    S = '^',
    ST = xpower
  ),
  expr_to_prefix(X,XT),
  expr_to_prefix(Y,YT),
  (
    XT = [xnum,_],
    YT = [xnum,_],
    rewrite_numeric([ST,XT,YT],Res,_),
    !
    ;
    Res = [ST,XT,YT],
    !
  ).
expr_to_prefix([d,X],[xder,XT]):-
  expr_to_prefix(X,XT),
  !.
expr_to_prefix([S,X],[S,XT]):-
  (
    S = xln
    ;
    S = xtan
    ;
    S = xsec
    ;
    S = xsin
    ;
    S = xcos
  ),
  expr_to_prefix(X,XT),
  !.


preprocess_expr(ExprList,Res):-
  findall(
    [XT,YT,H],
    (
      nth1(ExprN,ExprList,[X,Y,H]),
      expr_to_prefix(X,XT),
      expr_to_prefix(Y,YT),
      print(['Expr',ExprN,'ok!!!']),
      write_to_log_file(['Expr',ExprN,'ok!!!']),
      nl
    ),
    Res
  ).



:- dynamic num_rewrite_rule/1.
:- dynamic rewrite_rule_sym/2.
:- retractall(num_rewrite_rule(_)).
:- retractall(rewrite_rule_sym(_,_)).
:- assert(num_rewrite_rule(1)).
:- assert(rewrite_rule_sym(1,numeric)).


rule_to_sym([]):-!.
rule_to_sym([[RN,_,_]|L]):-
  (
    rewrite_rule_sym(_,RN),
    rule_to_sym(L)
    ;
    \+rewrite_rule_sym(_,RN),
    num_rewrite_rule(N1),
    N is N1 + 1,
    retractall(num_rewrite_rule(_)),
    assert(num_rewrite_rule(N)),
    assert(rewrite_rule_sym(N,RN)),
    rule_to_sym(L)
  ).


get_path([],[]):-!.
get_path([[_,N,_]|L],[RN|LT]):-
  rewrite_rule_sym(N,RN),
  get_path(L,LT),
  !.

:-dynamic logfile/1.
:-retractall(logfile(_)).
:-assert(logfile([])).

write_to_log_file(X):-
  logfile(L),
  retractall(logfile(_)),
  append(L,[X],Y),
  assert(logfile(Y)).
  

run_main2:-
  rule_set2(R),
  rule_to_sym(R),
  %test_expr(ExprList),
  test_expr2(PreExprList),
  preprocess_expr(PreExprList,ExprList),
print_by_line(ExprList),
  findall(
    PTemp,
    (
      nth1(ExpN,ExprList,[X,Y,H]),
      rewrite_shortest(R,X,Y,P,1000,H),
      print(['ok!!!',ExpN,X,Y]),nl,
      write_to_log_file(['ok!!!',ExpN,X,Y]),
      get_path(P,PPrt),
      nl,print('==>'),print(PPrt),nl,nl,
      write_to_log_file(['==>',PPrt]),
      prev_path_extension(P,5,[],PList),
      member(PTemp,PList)
    ),
    ExPath
  ),
  partial_tree_extension(ExPath,3,3,PT),
  produce_feature(PT,FeT),
  %print_by_line(FeT),
  write_feature_to_file(FeT,'feat.txt').


run_main3:-
  rule_set3(R),
  rule_to_sym(R),
  %test_expr(ExprList),
  test_expr3(PreExprList),
  preprocess_expr(PreExprList,ExprList),
print_by_line(ExprList),
  findall(
    PTemp,
    (
      nth1(ExpN,ExprList,[X,Y,H]),
      rewrite_shortest(R,X,Y,P,1000,H),
      print(['ok!!!',ExpN,X,Y]),nl,
      write_to_log_file(['ok!!!',ExpN,X,Y]),
      get_path(P,PPrt),
      nl,print('==>'),print(PPrt),nl,nl,
      write_to_log_file(['==>',PPrt]),
      prev_path_extension(P,5,[],PList),
      member(PTemp,PList)
    ),
    ExPath
  ),
  partial_tree_extension(ExPath,3,3,PT),
  produce_feature(PT,FeT),
  %print_by_line(FeT),
  write_feature_to_file(FeT,'feat.txt').

rewrite_given_path(_,_,[sflag|_]):-!.
rewrite_given_path(_,_,[]):-!.
rewrite_given_path([Expr,TExpr],RSet,[RN|L]):-
print(Expr),nl,
  print(['Rule:',RN]),nl,
  member([RN,X1,Y1],RSet),
  copy_term([X1,Y1],R),
print(R),
  (
    RN \= numeric,
    RN \= all_to_polynominal,
    RN \= auto,
    rewrite_basic(R,Expr,T,_)
    ;
    RN = numeric,
    rewrite_numeric(Expr,T,_)
    ;
    RN = all_to_polynominal,
    rewrite_all_to_polynominal(Expr,T)
    ;
    RN = auto
  ),
  (
    RN \= auto,
    nl,
    nl,nl,
    print_by_line([RN,Expr,'==>',T]),
    nl,
    rewrite_given_path([T,TExpr],RSet,L)
    ;
    RN = auto,
    nl,
    print('by auto'),
    rewrite_shortest(RSet,Expr,TExpr,_,1000,[])
  ).



rewrite_test_temp:-
  rule_set3(RSet),
  rule_to_sym(RSet),

  %Expr = [[xequal,[xplus,[xmult,[xnum,2],x],[xnum,5]],[xplus,[xmult,[xnum,1],x],[xnum,19]]],[xequal,x,[xnum,14]]],
  %Path = [add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,minus_trans2,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,mult_trans1,numeric],

  %Expr = [[xequal,[xminus,[xmult,[xnum,8],x],[xnum,7]],[xplus,[xmult,[xnum,4],x],[xnum,73]]],[xequal,x,[xnum,20]]],
  %Path = [minus_trans1,add_comm,add_asso1,numeric,minus_trans2,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,mult_trans1,numeric],

  %Expr = [xequal,[xplus,[xmult,[xnum,2],[xplus,x,x]],[xnum,5]],x],
  %Path = [move_all_to_left,all_to_polynominal],



  Expr = [[xdiv,[xder,[xmult,[xsin,x],[xcos,x]]],[xder,x]],[xcos,[xmult,[xnum,2],x]]],
  Path = [sincos,dmult1,dconst,mult_zero1,plus_zero1,dchain1,dsin,dmult1,dconst,mult_zero1,plus_zero1,div_to_1,numeric,mult_comm,mult_asso1,numeric],


  nl,print(Expr),nl,nl,
  rewrite_given_path(Expr,RSet,Path).

