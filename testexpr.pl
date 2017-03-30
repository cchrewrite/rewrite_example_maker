
test_expr(Expr):-
  Expr = [
    [
      [xequal,[xplus,[xres,x],[xnum,3]],[xplus,[xnum,4],[xnum,5]]],
      [xequal,[xres,x],[xnum,6]]
    ],
    [
      [xequal,[xplus,[xres,y],[xnum,8]],[xplus,[xnum,9],[xnum,10]]],
      [xequal,[xres,y],[xnum,11]]
    ]
  ].

test_expr2(Expr):-
  Expr = [

    % ================ Org1 ================== %

    
    % 12 = x - 20, x = 32
    [
      [12,=,[x,-,20]],
      [x,=,32],
      []
    ],

    % 3x - 5 = x, x = 2.5
    [
      [[[3,*,x],-,5],=,x],
      [x,=,2.5],
      [minus_to_plus1,numeric,add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
      %[add_trans1,minus_to_plus1,numeric]
    ],

    % -3 * x - 10 = 20, x = -10
    [
      [[[-3,*,x],-,10],=,20],
      [x,=,-10],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    % 12x + (-2.5 * 2) = 55, x = 5
    [
      [[[12,*,x],+,[-2.5,*,2]],=,55],
      [x,=,5],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    % 2x - 5 = x - 19, x = -14
    [
      [[[2,*,x],-,5],=,[x,-,19]],
      [x,=,-14],
      [minus_to_plus1,minus_to_plus1,add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    % 8x + 7 = 4x + 73, x = 16.5
    [
      [[[8,*,x],+,7],=,[[4,*,x],+,73]],
      [x,=,16.5],
      [add_trans1,minus_to_plus1,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    % 4x - 25 = 6x + 9, x = -17
    [
      [[[4,*,x],-,25],=,[[6,*,x],+,9]],
      [x,=,-17],
      [minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    % 5x - 28 = 10x - 12, x = -3.2
    [
      [[[5,*,x],-,28],=,[[10,*,x],-,12]],
      [x,=,-3.2],
      [minus_to_plus1,minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[2,*,[x,-,5]],+,x],=,20],
      [x,=,10],
      [minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[4,*,[x,-,3]],+,x],=,27],
      [x,=,7.8],
      [minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[5,*,x],+,[2,*,[[5,*,x],+,2.5]]],=,35],
      [x,=,2],
      [mult_dist1,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [26,=,[[7,*,x],+,[3,*,[x,-,2]]]],
      [x,=,3.2],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,numeric,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_asso1,add_comm,add_comm,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[10,*,x],+,[2,*,[[5,*,x],+,2]]],=,32],
      [x,=,1.4],
      [mult_dist1,numeric,mult_asso2,numeric,add_comm,add_comm,add_comm,add_trans1,add_comm,mult_comm,add_trans2,add_asso2,add_trans1,add_comm,numeric,mult_comm,mult_dist2,numeric,mult_comm,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,[x,+,2]],+,[7,*,x]],=,2],
      [x,=,-0.4],
      [mult_dist1,numeric,add_comm,add_asso1,add_comm,mult_comm,add_trans1,numeric,add_comm,mult_comm,add_comm,mult_dist4,mult_trans1,numeric,numeric,equal_comm,equal_comm]
    ],
    
    [
      [[[21,*,[x,+,2]],-,[6,*,[x,+,1]]],=,6],
      [x,=,-2],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[15,*,[x,-,2]],-,[5,*,[x,+,1]]],=,5],
      [x,=,4],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[7,*,[x,-,1.5]],-,[2,*,[x,+,1]]],=,5],
      [x,=,3.5], 
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    % 5 = x + 19, x = -14
    [
      [5,=,[x,+,19]],
      [x,=,-14],
      []
    ],

    % 2x + 5 = x, x = -5
    [
      [[[2,*,x],+,5],=,x],
      [x,=,-5],
      [add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
      %[add_trans1,minus_to_plus1,numeric]
    ],

    % 3x + 5 = 17, x = 4
    [
      [[[3,*,x],+,5],=,17],
      [x,=,4],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    % 12x - 5 = 55, x = 5
    [
      [[[12,*,x],-,5],=,55],
      [x,=,5],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    % 2x + 5 = x + 19, x = 14
    [
      [[[2,*,x],+,5],=,[x,+,19]],
      [x,=,14],
      [add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
      %[add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,minus_trans2,minus_to_plus1]
    ],

    % 8x - 7 = 4x + 73, x = 20
    [
      [[[8,*,x],-,7],=,[[4,*,x],+,73]],
      [x,=,20],
      [minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
      %[minus_trans1,add_comm,add_asso1,numeric,minus_trans2,minus_to_plus1,mult_asso2,numeric,mult_dist4]
    ],

    % 4x + 25 = 6x + 9, x = 8
    [
      [[[4,*,x],+,25],=,[[6,*,x],+,9]],
      [x,=,8],
      [add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
      %[add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,minus_trans2,minus_to_plus1,mult_asso2,numeric,mult_dist4]

    ],

    % 5x + 28 = 10x - 12, x = 8
    [
      [[[5,*,x],+,28],=,[[10,*,x],-,12]],
      [x,=,8],
      [add_trans2,add_asso1,numeric,equal_comm,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,mult_asso2,mult_dist4,numeric,numeric,mult_trans1,numeric,equal_comm,equal_comm]
      %[add_trans2,add_asso1,numeric,equal_comm,minus_trans2,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,mult_trans1,numeric]

    ],

    [
      [[[2,*,[x,+,5]],+,x],=,19],
      [x,=,3],
      [add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
      %[mult_dist1,numeric,add_asso1,add_comm,add_asso2,mult_dist5,numeric]
      %[mult_dist1,numeric,add_asso1,add_comm,add_asso2,mult_dist5,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[4,*,[x,-,3]],-,x],=,27],
      [x,=,13],
      [minus_to_plus1,mult_dist1,numeric,numeric,minus_to_plus1,add_asso1,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_trans1,add_comm,minus_to_plus1,add_comm,mult_dist4,numeric,minus_to_plus2,mult_trans1,numeric,numeric]
      %[minus_to_plus1,mult_dist1,numeric,numeric,minus_to_plus1,add_asso1,add_comm,add_asso2]
      %[minus_to_plus1,mult_dist1,numeric,numeric,minus_to_plus1,add_asso1,add_comm,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,x],+,[2,*,[[5,*,x],-,2]]],=,35],
      [x,=,3],
      %[minus_to_plus1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso2]
      [minus_to_plus1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [26,=,[[7,*,x],-,[3,*,[x,-,2]]]],
      [x,=,5],
      %[equal_comm,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso2,mult_dist4]
      [equal_comm,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[16,*,x],-,[2,*,[[5,*,x],+,2]]],=,32],
      [x,=,6],
      %[minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,mult_asso2,numeric,mult_asso2,numeric]
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,mult_asso2,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,[x,+,2]],-,[7,*,x]],=,2],
      [x,=,1],
      %[minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_comm,add_asso2]
      [minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_comm,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[21,*,[x,-,2]],-,[4,*,[x,+,1]]],=,5],
      [x,=,3],
      %[minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric]
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[15,*,[x,-,2]],-,[4,*,[x,-,1]]],=,7],
      [x,=,3],
      %[minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric]
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[7,*,[x,-,1.5]],-,[2,*,[x,-,1]]],=,5],
      [x,=,2.7], 
      %[The same as the above example.]
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ]

  ].


test_expr2_big(Expr):-
  Expr = [

    % ================ Org1 ================== %

    
    % 12 = x - 20, x = 32
    [
      [12,=,[x,-,20]],
      [x,=,32],
      []
    ],

    % 3x - 5 = x, x = 2.5
    [
      [[[3,*,x],-,5],=,x],
      [x,=,2.5],
      [minus_to_plus1,numeric,add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
      %[add_trans1,minus_to_plus1,numeric]
    ],

    % -3 * x - 10 = 20, x = -10
    [
      [[[-3,*,x],-,10],=,20],
      [x,=,-10],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    % 12x + (-2.5 * 2) = 55, x = 5
    [
      [[[12,*,x],+,[-2.5,*,2]],=,55],
      [x,=,5],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    % 2x - 5 = x - 19, x = -14
    [
      [[[2,*,x],-,5],=,[x,-,19]],
      [x,=,-14],
      [minus_to_plus1,minus_to_plus1,add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    % 8x + 7 = 4x + 73, x = 16.5
    [
      [[[8,*,x],+,7],=,[[4,*,x],+,73]],
      [x,=,16.5],
      [add_trans1,minus_to_plus1,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    % 4x - 25 = 6x + 9, x = -17
    [
      [[[4,*,x],-,25],=,[[6,*,x],+,9]],
      [x,=,-17],
      [minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    % 5x - 28 = 10x - 12, x = -3.2
    [
      [[[5,*,x],-,28],=,[[10,*,x],-,12]],
      [x,=,-3.2],
      [minus_to_plus1,minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[2,*,[x,-,5]],+,x],=,20],
      [x,=,10],
      [minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[4,*,[x,-,3]],+,x],=,27],
      [x,=,7.8],
      [minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[5,*,x],+,[2,*,[[5,*,x],+,2.5]]],=,35],
      [x,=,2],
      [mult_dist1,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [26,=,[[7,*,x],+,[3,*,[x,-,2]]]],
      [x,=,3.2],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,numeric,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_asso1,add_comm,add_comm,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[10,*,x],+,[2,*,[[5,*,x],+,2]]],=,32],
      [x,=,1.4],
      [mult_dist1,numeric,mult_asso2,numeric,add_comm,add_comm,add_comm,add_trans1,add_comm,mult_comm,add_trans2,add_asso2,add_trans1,add_comm,numeric,mult_comm,mult_dist2,numeric,mult_comm,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,[x,+,2]],+,[7,*,x]],=,2],
      [x,=,-0.4],
      [mult_dist1,numeric,add_comm,add_asso1,add_comm,mult_comm,add_trans1,numeric,add_comm,mult_comm,add_comm,mult_dist4,mult_trans1,numeric,numeric,equal_comm,equal_comm]
    ],
    
    [
      [[[21,*,[x,+,2]],-,[6,*,[x,+,1]]],=,6],
      [x,=,-2],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[15,*,[x,-,2]],-,[5,*,[x,+,1]]],=,5],
      [x,=,4],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[7,*,[x,-,1.5]],-,[2,*,[x,+,1]]],=,5],
      [x,=,3.5], 
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    % 5 = x + 19, x = -14
    [
      [5,=,[x,+,19]],
      [x,=,-14],
      []
    ],

    % 2x + 5 = x, x = -5
    [
      [[[2,*,x],+,5],=,x],
      [x,=,-5],
      [add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
      %[add_trans1,minus_to_plus1,numeric]
    ],

    % 3x + 5 = 17, x = 4
    [
      [[[3,*,x],+,5],=,17],
      [x,=,4],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    % 12x - 5 = 55, x = 5
    [
      [[[12,*,x],-,5],=,55],
      [x,=,5],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    % 2x + 5 = x + 19, x = 14
    [
      [[[2,*,x],+,5],=,[x,+,19]],
      [x,=,14],
      [add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
      %[add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,minus_trans2,minus_to_plus1]
    ],

    % 8x - 7 = 4x + 73, x = 20
    [
      [[[8,*,x],-,7],=,[[4,*,x],+,73]],
      [x,=,20],
      [minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
      %[minus_trans1,add_comm,add_asso1,numeric,minus_trans2,minus_to_plus1,mult_asso2,numeric,mult_dist4]
    ],

    % 4x + 25 = 6x + 9, x = 8
    [
      [[[4,*,x],+,25],=,[[6,*,x],+,9]],
      [x,=,8],
      [add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
      %[add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,minus_trans2,minus_to_plus1,mult_asso2,numeric,mult_dist4]

    ],

    % 5x + 28 = 10x - 12, x = 8
    [
      [[[5,*,x],+,28],=,[[10,*,x],-,12]],
      [x,=,8],
      [add_trans2,add_asso1,numeric,equal_comm,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,mult_asso2,mult_dist4,numeric,numeric,mult_trans1,numeric,equal_comm,equal_comm]
      %[add_trans2,add_asso1,numeric,equal_comm,minus_trans2,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,mult_trans1,numeric]

    ],

    [
      [[[2,*,[x,+,5]],+,x],=,19],
      [x,=,3],
      [add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
      %[mult_dist1,numeric,add_asso1,add_comm,add_asso2,mult_dist5,numeric]
      %[mult_dist1,numeric,add_asso1,add_comm,add_asso2,mult_dist5,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[4,*,[x,-,3]],-,x],=,27],
      [x,=,13],
      [minus_to_plus1,mult_dist1,numeric,numeric,minus_to_plus1,add_asso1,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_trans1,add_comm,minus_to_plus1,add_comm,mult_dist4,numeric,minus_to_plus2,mult_trans1,numeric,numeric]
      %[minus_to_plus1,mult_dist1,numeric,numeric,minus_to_plus1,add_asso1,add_comm,add_asso2]
      %[minus_to_plus1,mult_dist1,numeric,numeric,minus_to_plus1,add_asso1,add_comm,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,x],+,[2,*,[[5,*,x],-,2]]],=,35],
      [x,=,3],
      %[minus_to_plus1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso2]
      [minus_to_plus1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [26,=,[[7,*,x],-,[3,*,[x,-,2]]]],
      [x,=,5],
      %[equal_comm,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso2,mult_dist4]
      [equal_comm,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[16,*,x],-,[2,*,[[5,*,x],+,2]]],=,32],
      [x,=,6],
      %[minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,mult_asso2,numeric,mult_asso2,numeric]
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,mult_asso2,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,[x,+,2]],-,[7,*,x]],=,2],
      [x,=,1],
      %[minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_comm,add_asso2]
      [minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_comm,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[21,*,[x,-,2]],-,[4,*,[x,+,1]]],=,5],
      [x,=,3],
      %[minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric]
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[15,*,[x,-,2]],-,[4,*,[x,-,1]]],=,7],
      [x,=,3],
      %[minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric]
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[7,*,[x,-,1.5]],-,[2,*,[x,-,1]]],=,5],
      [x,=,2.7], 
      %[The same as the above example.]
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],

    % ================ Ex 1 ================== %
    % 2 3 4 5 6 %

    [
      [2,=,[x,-,3]],
      [x,=,ukx],
      []
    ],

    [
      [[[2,*,x],-,3],=,x],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[-2,*,x],-,3],=,4],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,[-3,*,4]],=,5],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],-,3],=,[x,-,4]],
      [x,=,ukx],
      [minus_to_plus1,minus_to_plus1,add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,3],=,[[4,*,x],+,5]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],-,3],=,[[4,*,x],-,5]],
      [x,=,ukx],
      [minus_to_plus1,minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    
    [
      [[[2,*,[x,-,3]],+,x],=,4],
      [x,=,ukx],
      [minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[2,*,x],+,[3,*,[[4,*,x],+,5]]],=,6],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [2,=,[[3,*,x],+,[4,*,[x,-,5]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,numeric,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_asso1,add_comm,add_comm,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,[3,*,[[4,*,x],+,5]]],=,6],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_comm,add_comm,add_comm,add_trans1,add_comm,mult_comm,add_trans2,add_asso2,add_trans1,add_comm,numeric,mult_comm,mult_dist2,numeric,mult_comm,mult_trans1,numeric]
    ],
    
    [
      [[[2,*,[x,+,3]],+,[4,*,x]],=,5],
      [x,=,ukx],
      [mult_dist1,numeric,add_comm,add_asso1,add_comm,mult_comm,add_trans1,numeric,add_comm,mult_comm,add_comm,mult_dist4,mult_trans1,numeric,numeric,equal_comm,equal_comm]
    ],
    
    [
      [[[2,*,[x,+,3]],-,[4,*,[x,+,5]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
     
    [
      [[[2,*,[x,-,3]],-,[4,*,[x,+,5]]],=,6],
      [x,=,ukx], 
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [2,=,[x,+,3]],
      [x,=,ukx],
      []
    ],

    [
      [[[2,*,x],+,3],=,x],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,3],=,4],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],-,3],=,4],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,3],=,[x,+,4]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],-,3],=,[[4,*,x],+,5]],
      [x,=,ukx],
      [minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,3],=,[[4,*,x],+,5]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,3],=,[[4,*,x],-,5]],
      [x,=,ukx],
      [add_trans2,add_asso1,numeric,equal_comm,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,mult_asso2,mult_dist4,numeric,numeric,mult_trans1,numeric,equal_comm,equal_comm]

    ],

    [
      [[[2,*,[x,+,3]],+,x],=,4],
      [x,=,ukx],
      [add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[2,*,[x,-,3]],-,x],=,5],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,minus_to_plus1,add_asso1,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_trans1,add_comm,minus_to_plus1,add_comm,mult_dist4,numeric,minus_to_plus2,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[2,*,x],+,[3,*,[[4,*,x],-,5]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [2,=,[[3,*,x],-,[4,*,[x,-,5]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],-,[3,*,[[4,*,x],+,5]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,mult_asso2,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[2,*,[x,+,3]],-,[4,*,x]],=,5],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_comm,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[2,*,[x,-,3]],-,[4,*,[x,+,5]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[2,*,[x,-,3]],-,[4,*,[x,-,5]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],


    % ================ Ex 2 ================== %
    % 3 2 4 5 6 %

    [
      [3,=,[x,-,2]],
      [x,=,ukx],
      []
    ],

    [
      [[[3,*,x],-,2],=,x],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[-3,*,x],-,2],=,4],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,[-2,*,4]],=,5],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],-,2],=,[x,-,4]],
      [x,=,ukx],
      [minus_to_plus1,minus_to_plus1,add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,2],=,[[4,*,x],+,5]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],-,2],=,[[4,*,x],-,5]],
      [x,=,ukx],
      [minus_to_plus1,minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    
    [
      [[[3,*,[x,-,2]],+,x],=,4],
      [x,=,ukx],
      [minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[3,*,x],+,[2,*,[[4,*,x],+,5]]],=,6],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [3,=,[[2,*,x],+,[4,*,[x,-,5]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,numeric,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_asso1,add_comm,add_comm,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,[2,*,[[4,*,x],+,5]]],=,6],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_comm,add_comm,add_comm,add_trans1,add_comm,mult_comm,add_trans2,add_asso2,add_trans1,add_comm,numeric,mult_comm,mult_dist2,numeric,mult_comm,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,[x,+,2]],+,[4,*,x]],=,5],
      [x,=,ukx],
      [mult_dist1,numeric,add_comm,add_asso1,add_comm,mult_comm,add_trans1,numeric,add_comm,mult_comm,add_comm,mult_dist4,mult_trans1,numeric,numeric,equal_comm,equal_comm]
    ],
    
    [
      [[[3,*,[x,+,2]],-,[4,*,[x,+,5]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
     
    [
      [[[3,*,[x,-,2]],-,[4,*,[x,+,5]]],=,6],
      [x,=,ukx], 
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [3,=,[x,+,2]],
      [x,=,ukx],
      []
    ],

    [
      [[[3,*,x],+,2],=,x],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,2],=,4],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],-,2],=,4],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,2],=,[x,+,4]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],-,2],=,[[4,*,x],+,5]],
      [x,=,ukx],
      [minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,2],=,[[4,*,x],+,5]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,2],=,[[4,*,x],-,5]],
      [x,=,ukx],
      [add_trans2,add_asso1,numeric,equal_comm,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,mult_asso2,mult_dist4,numeric,numeric,mult_trans1,numeric,equal_comm,equal_comm]

    ],

    [
      [[[3,*,[x,+,2]],+,x],=,4],
      [x,=,ukx],
      [add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[3,*,[x,-,2]],-,x],=,5],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,minus_to_plus1,add_asso1,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_trans1,add_comm,minus_to_plus1,add_comm,mult_dist4,numeric,minus_to_plus2,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[3,*,x],+,[2,*,[[4,*,x],-,5]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [3,=,[[2,*,x],-,[4,*,[x,-,5]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],-,[2,*,[[4,*,x],+,5]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,mult_asso2,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,[x,+,2]],-,[4,*,x]],=,5],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_comm,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,[x,-,2]],-,[4,*,[x,+,5]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,[x,-,2]],-,[4,*,[x,-,5]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],


    % ================ Ex 3 ================== %
    % 4 5 2 3 6 %

    [
      [4,=,[x,-,5]],
      [x,=,ukx],
      []
    ],

    [
      [[[4,*,x],-,5],=,x],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[-4,*,x],-,5],=,2],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[4,*,x],+,[-5,*,2]],=,3],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[4,*,x],-,5],=,[x,-,2]],
      [x,=,ukx],
      [minus_to_plus1,minus_to_plus1,add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[4,*,x],+,5],=,[[2,*,x],+,3]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[4,*,x],-,5],=,[[2,*,x],-,3]],
      [x,=,ukx],
      [minus_to_plus1,minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    
    [
      [[[4,*,[x,-,5]],+,x],=,2],
      [x,=,ukx],
      [minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[4,*,x],+,[5,*,[[2,*,x],+,3]]],=,6],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [4,=,[[5,*,x],+,[2,*,[x,-,3]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,numeric,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_asso1,add_comm,add_comm,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[4,*,x],+,[5,*,[[2,*,x],+,3]]],=,6],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_comm,add_comm,add_comm,add_trans1,add_comm,mult_comm,add_trans2,add_asso2,add_trans1,add_comm,numeric,mult_comm,mult_dist2,numeric,mult_comm,mult_trans1,numeric]
    ],
    
    [
      [[[4,*,[x,+,5]],+,[2,*,x]],=,3],
      [x,=,ukx],
      [mult_dist1,numeric,add_comm,add_asso1,add_comm,mult_comm,add_trans1,numeric,add_comm,mult_comm,add_comm,mult_dist4,mult_trans1,numeric,numeric,equal_comm,equal_comm]
    ],
    
    [
      [[[4,*,[x,+,5]],-,[2,*,[x,+,3]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
     
    [
      [[[4,*,[x,-,5]],-,[2,*,[x,+,3]]],=,6],
      [x,=,ukx], 
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [4,=,[x,+,5]],
      [x,=,ukx],
      []
    ],

    [
      [[[4,*,x],+,5],=,x],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[4,*,x],+,5],=,2],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[4,*,x],-,5],=,2],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[4,*,x],+,5],=,[x,+,2]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[4,*,x],-,5],=,[[2,*,x],+,3]],
      [x,=,ukx],
      [minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[4,*,x],+,5],=,[[2,*,x],+,3]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[4,*,x],+,5],=,[[2,*,x],-,3]],
      [x,=,ukx],
      [add_trans2,add_asso1,numeric,equal_comm,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,mult_asso2,mult_dist4,numeric,numeric,mult_trans1,numeric,equal_comm,equal_comm]

    ],

    [
      [[[4,*,[x,+,5]],+,x],=,2],
      [x,=,ukx],
      [add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[4,*,[x,-,5]],-,x],=,2],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,minus_to_plus1,add_asso1,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_trans1,add_comm,minus_to_plus1,add_comm,mult_dist4,numeric,minus_to_plus2,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[4,*,x],+,[5,*,[[2,*,x],-,3]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [4,=,[[5,*,x],-,[2,*,[x,-,3]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[4,*,x],-,[5,*,[[2,*,x],+,3]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,mult_asso2,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[4,*,[x,+,5]],-,[2,*,x]],=,3],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_comm,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[4,*,[x,-,5]],-,[2,*,[x,+,3]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[4,*,[x,-,5]],-,[2,*,[x,-,3]]],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],


    % ================ Ex 4 ================== %
    % 6 5 4 3 2 %

    [
      [6,=,[x,-,5]],
      [x,=,ukx],
      []
    ],

    [
      [[[6,*,x],-,5],=,x],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[-6,*,x],-,5],=,4],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[6,*,x],+,[-5,*,4]],=,3],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[6,*,x],-,5],=,[x,-,4]],
      [x,=,ukx],
      [minus_to_plus1,minus_to_plus1,add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[6,*,x],+,5],=,[[4,*,x],+,3]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[6,*,x],-,5],=,[[4,*,x],-,3]],
      [x,=,ukx],
      [minus_to_plus1,minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    
    [
      [[[6,*,[x,-,5]],+,x],=,4],
      [x,=,ukx],
      [minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[6,*,x],+,[5,*,[[4,*,x],+,3]]],=,2],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [6,=,[[5,*,x],+,[4,*,[x,-,3]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,numeric,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_asso1,add_comm,add_comm,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[6,*,x],+,[5,*,[[4,*,x],+,3]]],=,2],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_comm,add_comm,add_comm,add_trans1,add_comm,mult_comm,add_trans2,add_asso2,add_trans1,add_comm,numeric,mult_comm,mult_dist2,numeric,mult_comm,mult_trans1,numeric]
    ],
    
    [
      [[[6,*,[x,+,5]],+,[4,*,x]],=,3],
      [x,=,ukx],
      [mult_dist1,numeric,add_comm,add_asso1,add_comm,mult_comm,add_trans1,numeric,add_comm,mult_comm,add_comm,mult_dist4,mult_trans1,numeric,numeric,equal_comm,equal_comm]
    ],
    
    [
      [[[6,*,[x,+,5]],-,[4,*,[x,+,3]]],=,2],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
     
    [
      [[[6,*,[x,-,5]],-,[4,*,[x,+,3]]],=,2],
      [x,=,ukx], 
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [6,=,[x,+,5]],
      [x,=,ukx],
      []
    ],

    [
      [[[6,*,x],+,5],=,x],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[6,*,x],+,5],=,4],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[6,*,x],-,5],=,4],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[6,*,x],+,5],=,[x,+,4]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[6,*,x],-,5],=,[[4,*,x],+,3]],
      [x,=,ukx],
      [minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[6,*,x],+,5],=,[[4,*,x],+,3]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[6,*,x],+,5],=,[[4,*,x],-,3]],
      [x,=,ukx],
      [add_trans2,add_asso1,numeric,equal_comm,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,mult_asso2,mult_dist4,numeric,numeric,mult_trans1,numeric,equal_comm,equal_comm]

    ],

    [
      [[[6,*,[x,+,5]],+,x],=,4],
      [x,=,ukx],
      [add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[6,*,[x,-,5]],-,x],=,4],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,minus_to_plus1,add_asso1,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_trans1,add_comm,minus_to_plus1,add_comm,mult_dist4,numeric,minus_to_plus2,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[6,*,x],+,[5,*,[[4,*,x],-,3]]],=,2],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [6,=,[[5,*,x],-,[4,*,[x,-,3]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[6,*,x],-,[5,*,[[4,*,x],+,3]]],=,2],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,mult_asso2,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[6,*,[x,+,5]],-,[4,*,x]],=,3],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_comm,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[6,*,[x,-,5]],-,[4,*,[x,+,3]]],=,2],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[6,*,[x,-,5]],-,[4,*,[x,-,3]]],=,2],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],


    % ================ Ex 5 ================== %
    % 5 6 2 3 4 %

    [
      [5,=,[x,-,6]],
      [x,=,ukx],
      []
    ],

    [
      [[[5,*,x],-,6],=,x],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[-5,*,x],-,6],=,2],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[5,*,x],+,[-6,*,2]],=,3],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[5,*,x],-,6],=,[x,-,2]],
      [x,=,ukx],
      [minus_to_plus1,minus_to_plus1,add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[5,*,x],+,6],=,[[2,*,x],+,3]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[5,*,x],-,6],=,[[2,*,x],-,3]],
      [x,=,ukx],
      [minus_to_plus1,minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    
    [
      [[[5,*,[x,-,6]],+,x],=,2],
      [x,=,ukx],
      [minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[5,*,x],+,[6,*,[[2,*,x],+,3]]],=,4],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [5,=,[[6,*,x],+,[2,*,[x,-,3]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,numeric,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_asso1,add_comm,add_comm,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[5,*,x],+,[6,*,[[2,*,x],+,3]]],=,4],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_comm,add_comm,add_comm,add_trans1,add_comm,mult_comm,add_trans2,add_asso2,add_trans1,add_comm,numeric,mult_comm,mult_dist2,numeric,mult_comm,mult_trans1,numeric]
    ],
    
    [
      [[[5,*,[x,+,6]],+,[2,*,x]],=,3],
      [x,=,ukx],
      [mult_dist1,numeric,add_comm,add_asso1,add_comm,mult_comm,add_trans1,numeric,add_comm,mult_comm,add_comm,mult_dist4,mult_trans1,numeric,numeric,equal_comm,equal_comm]
    ],
    
    [
      [[[5,*,[x,+,6]],-,[2,*,[x,+,3]]],=,4],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
     
    [
      [[[5,*,[x,-,6]],-,[2,*,[x,+,3]]],=,4],
      [x,=,ukx], 
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [5,=,[x,+,6]],
      [x,=,ukx],
      []
    ],

    [
      [[[5,*,x],+,6],=,x],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[5,*,x],+,6],=,2],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[5,*,x],-,6],=,2],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[5,*,x],+,6],=,[x,+,2]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[5,*,x],-,6],=,[[2,*,x],+,3]],
      [x,=,ukx],
      [minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[5,*,x],+,6],=,[[2,*,x],+,3]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[5,*,x],+,6],=,[[2,*,x],-,3]],
      [x,=,ukx],
      [add_trans2,add_asso1,numeric,equal_comm,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,mult_asso2,mult_dist4,numeric,numeric,mult_trans1,numeric,equal_comm,equal_comm]

    ],

    [
      [[[5,*,[x,+,6]],+,x],=,2],
      [x,=,ukx],
      [add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[5,*,[x,-,6]],-,x],=,2],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,minus_to_plus1,add_asso1,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_trans1,add_comm,minus_to_plus1,add_comm,mult_dist4,numeric,minus_to_plus2,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[5,*,x],+,[6,*,[[2,*,x],-,3]]],=,4],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [5,=,[[6,*,x],-,[2,*,[x,-,3]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[5,*,x],-,[6,*,[[2,*,x],+,3]]],=,4],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,mult_asso2,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[5,*,[x,+,6]],-,[2,*,x]],=,3],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_comm,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[5,*,[x,-,6]],-,[2,*,[x,+,3]]],=,4],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[5,*,[x,-,6]],-,[2,*,[x,-,3]]],=,4],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],



    % ================ Ex 1 ================== %
    % 3 5 7 9 11 %

    [
      [3,=,[x,-,5]],
      [x,=,ukx],
      []
    ],

    [
      [[[3,*,x],-,5],=,x],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[-3,*,x],-,5],=,7],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,[-5,*,7]],=,9],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],-,5],=,[x,-,7]],
      [x,=,ukx],
      [minus_to_plus1,minus_to_plus1,add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,5],=,[[7,*,x],+,9]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],-,5],=,[[7,*,x],-,9]],
      [x,=,ukx],
      [minus_to_plus1,minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    
    [
      [[[3,*,[x,-,5]],+,x],=,7],
      [x,=,ukx],
      [minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[3,*,x],+,[5,*,[[7,*,x],+,9]]],=,11],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [3,=,[[5,*,x],+,[7,*,[x,-,9]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,numeric,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_asso1,add_comm,add_comm,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,[5,*,[[7,*,x],+,9]]],=,11],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_comm,add_comm,add_comm,add_trans1,add_comm,mult_comm,add_trans2,add_asso2,add_trans1,add_comm,numeric,mult_comm,mult_dist2,numeric,mult_comm,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,[x,+,5]],+,[7,*,x]],=,9],
      [x,=,ukx],
      [mult_dist1,numeric,add_comm,add_asso1,add_comm,mult_comm,add_trans1,numeric,add_comm,mult_comm,add_comm,mult_dist4,mult_trans1,numeric,numeric,equal_comm,equal_comm]
    ],
    
    [
      [[[3,*,[x,+,5]],-,[7,*,[x,+,9]]],=,11],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
     
    [
      [[[3,*,[x,-,5]],-,[7,*,[x,+,9]]],=,11],
      [x,=,ukx], 
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [3,=,[x,+,5]],
      [x,=,ukx],
      []
    ],

    [
      [[[3,*,x],+,5],=,x],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,5],=,7],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],-,5],=,7],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,5],=,[x,+,7]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],-,5],=,[[7,*,x],+,9]],
      [x,=,ukx],
      [minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,5],=,[[7,*,x],+,9]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],+,5],=,[[7,*,x],-,9]],
      [x,=,ukx],
      [add_trans2,add_asso1,numeric,equal_comm,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,mult_asso2,mult_dist4,numeric,numeric,mult_trans1,numeric,equal_comm,equal_comm]

    ],

    [
      [[[3,*,[x,+,5]],+,x],=,7],
      [x,=,ukx],
      [add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[3,*,[x,-,5]],-,x],=,7],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,minus_to_plus1,add_asso1,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_trans1,add_comm,minus_to_plus1,add_comm,mult_dist4,numeric,minus_to_plus2,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[3,*,x],+,[5,*,[[7,*,x],-,9]]],=,11],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [3,=,[[5,*,x],-,[7,*,[x,-,9]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[3,*,x],-,[5,*,[[7,*,x],+,9]]],=,11],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,mult_asso2,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,[x,+,5]],-,[7,*,x]],=,9],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_comm,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,[x,-,5]],-,[7,*,[x,+,9]]],=,11],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[3,*,[x,-,5]],-,[7,*,[x,-,9]]],=,11],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],


    % ================ Ex 6 ================== %
    % 2 4 6 8 10 %

    [
      [2,=,[x,-,4]],
      [x,=,ukx],
      []
    ],

    [
      [[[2,*,x],-,4],=,x],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[-2,*,x],-,4],=,6],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,[-4,*,6]],=,8],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],-,4],=,[x,-,6]],
      [x,=,ukx],
      [minus_to_plus1,minus_to_plus1,add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,4],=,[[6,*,x],+,8]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],-,4],=,[[6,*,x],-,8]],
      [x,=,ukx],
      [minus_to_plus1,minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    
    [
      [[[2,*,[x,-,4]],+,x],=,6],
      [x,=,ukx],
      [minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[2,*,x],+,[4,*,[[6,*,x],+,8]]],=,10],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [2,=,[[4,*,x],+,[6,*,[x,-,8]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,numeric,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_asso1,add_comm,add_comm,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,[4,*,[[6,*,x],+,8]]],=,10],
      [x,=,ukx],
      [mult_dist1,numeric,mult_asso2,numeric,add_comm,add_comm,add_comm,add_trans1,add_comm,mult_comm,add_trans2,add_asso2,add_trans1,add_comm,numeric,mult_comm,mult_dist2,numeric,mult_comm,mult_trans1,numeric]
    ],
    
    [
      [[[2,*,[x,+,4]],+,[6,*,x]],=,8],
      [x,=,ukx],
      [mult_dist1,numeric,add_comm,add_asso1,add_comm,mult_comm,add_trans1,numeric,add_comm,mult_comm,add_comm,mult_dist4,mult_trans1,numeric,numeric,equal_comm,equal_comm]
    ],
    
    [
      [[[2,*,[x,+,4]],-,[6,*,[x,+,8]]],=,10],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
     
    [
      [[[2,*,[x,-,4]],-,[6,*,[x,+,8]]],=,10],
      [x,=,ukx], 
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [2,=,[x,+,4]],
      [x,=,ukx],
      []
    ],

    [
      [[[2,*,x],+,4],=,x],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,numeric,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,4],=,6],
      [x,=,ukx],
      [add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],-,4],=,6],
      [x,=,ukx],
      [minus_to_plus1,numeric,add_comm,add_trans1,minus_to_plus1,minus_trans2,numeric,equal_comm,mult_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,4],=,[x,+,6]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,numeric,numeric,minus_trans2,minus_to_plus1,add_comm,mult_dist4,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],-,4],=,[[6,*,x],+,8]],
      [x,=,ukx],
      [minus_trans1,add_comm,add_asso1,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,4],=,[[6,*,x],+,8]],
      [x,=,ukx],
      [add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,mult_comm,add_comm,equal_comm,mult_comm,add_trans1,mult_comm,mult_comm,minus_to_plus1,mult_asso2,numeric,mult_dist4,numeric,equal_comm,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],+,4],=,[[6,*,x],-,8]],
      [x,=,ukx],
      [add_trans2,add_asso1,numeric,equal_comm,add_comm,equal_comm,add_trans1,minus_to_plus1,add_comm,equal_comm,mult_asso2,mult_dist4,numeric,numeric,mult_trans1,numeric,equal_comm,equal_comm]

    ],

    [
      [[[2,*,[x,+,4]],+,x],=,6],
      [x,=,ukx],
      [add_comm,add_comm,add_comm,mult_dist1,add_asso1,numeric,add_comm,mult_dist5,numeric,add_trans1,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[2,*,[x,-,4]],-,x],=,6],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,minus_to_plus1,add_asso1,add_comm,add_comm,add_comm,add_asso2,add_comm,add_comm,add_comm,add_trans1,add_comm,minus_to_plus1,add_comm,mult_dist4,numeric,minus_to_plus2,mult_trans1,numeric,numeric]
    ],
    
    [
      [[[2,*,x],+,[4,*,[[6,*,x],-,8]]],=,10],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [2,=,[[4,*,x],-,[6,*,[x,-,8]]]],
      [x,=,ukx],
      [equal_comm,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],

    [
      [[[2,*,x],-,[4,*,[[6,*,x],+,8]]],=,10],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_dist1,numeric,mult_asso2,numeric,mult_asso2,numeric,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[2,*,[x,+,4]],-,[6,*,x]],=,8],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,mult_asso2,numeric,add_asso1,add_comm,add_asso2,add_trans1,numeric,mult_dist4,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[2,*,[x,-,4]],-,[5,*,[x,+,8]]],=,10],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ],
    
    [
      [[[2,*,[x,-,4]],-,[6,*,[x,-,8]]],=,10],
      [x,=,ukx],
      [minus_to_plus1,mult_dist1,numeric,minus_to_plus1,mult_dist1,numeric,minus_to_plus1,add_asso2,add_comm,add_asso1,mult_dist1,numeric,numeric,mult_asso2,numeric,add_asso1,add_asso2,mult_dist4,numeric,numeric,numeric,add_trans1,numeric,mult_trans1,numeric]
    ]



  ].




test_expr3(Expr):-
  Expr = [

    [
      [[d,[x,^,4]],/,[d,x]],
      [4,*,[x,^,3]],
      []
    ],

    [
      [[d,[[x,^,3],^,4]],/,[d,x]],
      [12,*,[x,^,11]],
      []
    ],

    [
      [[d,[[x,^,2],^,0.333333]],/,[d,x]],
      [0.666666,*,[x,^,-0.333334]],
      [dchain1,dpower,dpower,numeric,numeric,power_asso1,numeric,mult_asso1,mult_comm,mult_asso2,mult_asso2,numeric,mult_asso1,power_dist2]
    ],


    % P87 9

    % (3)
    % d(x^1.6) / d(x)
    [
      [[d,[x,^,1.6]],/,[d,x]],
      [1.6,*,[x,^,0.6]],
      []
    ],

    % (4)
    % d(1/x^0.5) / d(x)
    [
      [[d,[1,/,[x,^,0.5]]],/,[d,x]],
      [-0.5,*,[x,^,-1.5]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
    
    % (5)
    % d(1/x^2) / d(x)
    [
      [[d,[1,/,[x,^,2]]],/,[d,x]],
      [-2,*,[x,^,-3]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
    
    % (6)
    % d(x^3 * x^0.2) / d(x)
    [
      [[d,[[x,^,3],*,[x,^,0.2]]],/,[d,x]],
      [3.2,*,[x,^,2.2]],
      [power_dist2]
    ],
    
    % (7)
    % d(x^2 * (x^2)^0.333333 / (x^5)^0.5) / d(x)
    [
      [[d,[[[x,^,2],*,[[x,^,2],^,0.333333]],/,[[x,^,5],^,0.5]]],/,[d,x]],
      [0.166666,*,[x,^,-0.833334]],
      [power_asso1,numeric,power_dist2,numeric,power_asso1,numeric,div_power1,numeric,power_dist2,numeric,dpower,numeric]
    ],

    % P97 2

    % (1)
    [
      [[d,[[[[x,^,3],+,[7,/,[x,^,4]]],-,[2,/,x]],+,12]],/,[d,x]],
      [[[3,*,[x,^,2]],-,[28,*,[x,^,-5]]],+,[2,*,[x,^,-2]]],
      [dplus1,dconst,plus_zero1,minus_to_plus1,dplus1,div_power3,mult_asso2,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dplus1,div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dpower,numeric,plus_to_minus1,mult_asso2,numeric]
    ],
    
    % (2)
    [
      [[d,[[[5,*,[x,^,3]],-,[2,^,x]],+,[3,*,[xexp,^,x]]]],/,[d,x]],
      [[[15,*,[x,^,2]],-,[[2,^,x],*,[xln,2]]],+,[3,*,[xexp,^,x]]],
      [dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,lne,mult_one1,minus_to_plus1,dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,plus_to_minus1,mult_asso2,numeric,mult_comm,mult_one1]
    ],
    
    % (3)
    [
      [[d,[[[2,*,[xtan,x]],+,[xsec,x]],-,1]],/,[d,x]],
      [[xsec,x],*,[[2,*,[xsec,x]],+,[xtan,x]]],
      [minus_to_plus1,dplus1,numeric,dconst,plus_zero1,dplus1,dsec,dmult1,dconst,mult_zero1,plus_zero1,dtan,mult_asso2,mult_comm,mult_dist2]
    ],
    
    % (4)
    [
      [[d,[[xsin,x],*,[xcos,x]]],/,[d,x]],
      [xcos,[2,*,x]],
      [sincos,dmult1,dconst,mult_zero1,plus_zero1,dchain1,dsin,dmult1,dconst,mult_zero1,plus_zero1,div_to_1,numeric,mult_comm,mult_asso1,numeric,mult_one1]
    ],

    % (5)
    [
      [[d,[[x,^,2],*,[xln,x]]],/,[d,x]],
      [[[2,*,x],*,[xln,x]],+,x],
      [dmult1,dln,power_dist2,numeric,dpower,numeric,power1_elim,power1_elim,add_comm,mult_comm]
    ],
    
    
    % (6)
    [
      [[d,[[3,*,[xexp,^,x]],*,[xcos,x]]],/,[d,x]],
      [[3,*,[xexp,^,x]],*,[[xcos,x],-,[xsin,x]]],
      [mult_asso1,dmult1,dconst,mult_zero1,plus_zero1,dmult1,dexp,dcos,lne,mult_one1,add_comm,mult_comm,mult_dist2,mult_asso2,minus_to_plus2]
    ],
    
    
    % (7)
    [
      [[d,[[xln,x],*,[x,^,-1]]],/,[d,x]],
      [[1,-,[xln,x]],*,[x,^,-2]],
      [dmult1,dln,dpower,numeric,power_dist2,numeric,add_comm,mult_comm,add_comm,mult_comm,plus_to_minus1,mult_comm,mult_comm,minus_to_plus1,add_comm,mult_comm,add_comm,mult_comm,mult_asso1,numeric,add_comm,mult_comm,mult_asso2,mult_dist4,add_comm,mult_comm,add_comm,mult_comm,mult_comm,minus_to_plus2]
    ],
    
    
    % (8)
    [
      [[d,[[[xexp,^,x],*,[x,^,-2]],+,1.098612]],/,[d,x]],
      [[xexp,^,x],*,[[x,^,-2],-,[2,*,[x,^,-3]]]],
      [dplus1,dconst,plus_zero1,dmult1,dexp,lne,mult_one1,dpower,numeric,mult_comm,mult_dist2,add_comm,mult_comm,plus_to_minus1,mult_comm,mult_asso2,numeric]
    ]
 
  ].



test_expr3_big(Expr):-
  Expr = [


    % ========= Original ==========%

    [
      [[d,[x,^,4]],/,[d,x]],
      [4,*,[x,^,3]],
      []
    ],

    [
      [[d,[[x,^,3],^,4]],/,[d,x]],
      [12,*,[x,^,11]],
      []
    ],

    [
      [[d,[[x,^,2],^,0.333333]],/,[d,x]],
      [0.666666,*,[x,^,-0.333334]],
      [dchain1,dpower,dpower,numeric,numeric,power_asso1,numeric,mult_asso1,mult_comm,mult_asso2,mult_asso2,numeric,mult_asso1,power_dist2]
    ],

    [
      [[d,[x,^,1.6]],/,[d,x]],
      [1.6,*,[x,^,0.6]],
      []
    ],

    [
      [[d,[1,/,[x,^,0.5]]],/,[d,x]],
      [-0.5,*,[x,^,-1.5]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
    
    [
      [[d,[1,/,[x,^,2]]],/,[d,x]],
      [-2,*,[x,^,-3]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
    
    [
      [[d,[[x,^,3],*,[x,^,0.2]]],/,[d,x]],
      [3.2,*,[x,^,2.2]],
      [power_dist2]
    ],
    
    [
      [[d,[[[x,^,2],*,[[x,^,2],^,0.333333]],/,[[x,^,5],^,0.5]]],/,[d,x]],
      [0.166666,*,[x,^,-0.833334]],
      [power_asso1,numeric,power_dist2,numeric,power_asso1,numeric,div_power1,numeric,power_dist2,numeric,dpower,numeric]
    ],

    [
      [[d,[[[[x,^,3],+,[7,/,[x,^,4]]],-,[2,/,x]],+,12]],/,[d,x]],
      [[[3,*,[x,^,2]],-,[28,*,[x,^,-5]]],+,[2,*,[x,^,-2]]],
      [dplus1,dconst,plus_zero1,minus_to_plus1,dplus1,div_power3,mult_asso2,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dplus1,div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dpower,numeric,plus_to_minus1,mult_asso2,numeric]
    ],
    
    [
      [[d,[[[5,*,[x,^,3]],-,[2,^,x]],+,[3,*,[xexp,^,x]]]],/,[d,x]],
      [[[15,*,[x,^,2]],-,[[2,^,x],*,[xln,2]]],+,[3,*,[xexp,^,x]]],
      [dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,lne,mult_one1,minus_to_plus1,dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,plus_to_minus1,mult_asso2,numeric,mult_comm,mult_one1]
    ],
    
    [
      [[d,[[[2,*,[xtan,x]],+,[xsec,x]],-,1]],/,[d,x]],
      [[xsec,x],*,[[2,*,[xsec,x]],+,[xtan,x]]],
      [minus_to_plus1,dplus1,numeric,dconst,plus_zero1,dplus1,dsec,dmult1,dconst,mult_zero1,plus_zero1,dtan,mult_asso2,mult_comm,mult_dist2]
    ],
    
    [
      [[d,[[xsin,x],*,[xcos,x]]],/,[d,x]],
      [xcos,[2,*,x]],
      [sincos,dmult1,dconst,mult_zero1,plus_zero1,dchain1,dsin,dmult1,dconst,mult_zero1,plus_zero1,div_to_1,numeric,mult_comm,mult_asso1,numeric,mult_one1]
    ],

    [
      [[d,[[x,^,2],*,[xln,x]]],/,[d,x]],
      [[[2,*,x],*,[xln,x]],+,x],
      [dmult1,dln,power_dist2,numeric,dpower,numeric,power1_elim,power1_elim,add_comm,mult_comm]
    ],
    
    
    [
      [[d,[[3,*,[xexp,^,x]],*,[xcos,x]]],/,[d,x]],
      [[3,*,[xexp,^,x]],*,[[xcos,x],-,[xsin,x]]],
      [mult_asso1,dmult1,dconst,mult_zero1,plus_zero1,dmult1,dexp,dcos,lne,mult_one1,add_comm,mult_comm,mult_dist2,mult_asso2,minus_to_plus2]
    ],
    
    
    [
      [[d,[[xln,x],*,[x,^,-1]]],/,[d,x]],
      [[1,-,[xln,x]],*,[x,^,-2]],
      [dmult1,dln,dpower,numeric,power_dist2,numeric,add_comm,mult_comm,add_comm,mult_comm,plus_to_minus1,mult_comm,mult_comm,minus_to_plus1,add_comm,mult_comm,add_comm,mult_comm,mult_asso1,numeric,add_comm,mult_comm,mult_asso2,mult_dist4,add_comm,mult_comm,add_comm,mult_comm,mult_comm,minus_to_plus2]
    ],
    
    [
      [[d,[[[xexp,^,x],*,[x,^,-2]],+,1.098612]],/,[d,x]],
      [[xexp,^,x],*,[[x,^,-2],-,[2,*,[x,^,-3]]]],
      [dplus1,dconst,plus_zero1,dmult1,dexp,lne,mult_one1,dpower,numeric,mult_comm,mult_dist2,add_comm,mult_comm,plus_to_minus1,mult_comm,mult_asso2,numeric]
    ],


    % ========= Extend ==========%
    [
      [[d,[x,^,-5]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      []
    ],

    [
      [[d,[x,^,-3]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      []
    ],


    [
      [[d,[x,^,-2]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      []
    ],


    [
      [[d,[x,^,-1]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      []
    ],


    [
      [[d,[x,^,2]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      []
    ],


    [
      [[d,[x,^,3]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      []
    ],

    [
      [[d,[x,^,5]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      []
    ],



    [
      [[d,[[x,^,1],^,2]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,dpower,numeric]
    ],


    [
      [[d,[[x,^,1],^,3]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,dpower,numeric]
    ],


    [
      [[d,[[x,^,1],^,4]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,dpower,numeric]
    ],


    [
      [[d,[[x,^,2],^,1]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,dpower,numeric]
    ],

    [
      [[d,[[x,^,2],^,4]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,dpower,numeric]
    ],


    [
      [[d,[[x,^,3],^,1]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,dpower,numeric]
    ],

    [
      [[d,[[x,^,3],^,2]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,dpower,numeric]
    ],

    [
      [[d,[1,/,[x,^,2]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
 
    [
      [[d,[1,/,[x,^,2]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
 
    [
      [[d,[1,/,[x,^,3]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
 
    [
      [[d,[1,/,[x,^,4]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
 
    [
      [[d,[1,/,[x,^,3.4]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
 
    [
      [[d,[1,/,[x,^,5]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
 
    [
      [[d,[1,/,[x,^,-1]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
 
    [
      [[d,[1,/,[x,^,-2.5]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
 
    [
      [[d,[1,/,[x,^,-3]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
    
    [
      [[d,[1,/,[x,^,-2.4]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,mult_comm,mult_one1,dpower,numeric]
    ],
    
    [
      [[d,[[x,^,2],*,[x,^,3]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_dist2]
    ],
    
    [
      [[d,[[x,^,2],*,[x,^,4]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_dist2]
    ],
    
    [
      [[d,[[x,^,2],*,[x,^,5]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_dist2]
    ],
   
    [
      [[d,[[x,^,-3],*,[x,^,-3]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_dist2]
    ],
    
    [
      [[d,[[x,^,-3],*,[x,^,-2]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_dist2]
    ],
       
    [
      [[d,[[x,^,-3],*,[x,^,-1]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_dist2]
    ],
    
    [
      [[d,[[x,^,-2],*,[x,^,-3]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_dist2]
    ],
    
    [
      [[d,[[x,^,-2],*,[x,^,-2]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_dist2]
    ],
    
    [
      [[d,[[x,^,-2],*,[x,^,-1]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_dist2]
    ],
              
    [
      [[d,[[[x,^,2],*,[[x,^,3],^,4]],/,[[x,^,5],^,6]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,power_dist2,numeric,power_asso1,numeric,div_power1,numeric,power_dist2,numeric,dpower,numeric]
    ],

   
    [
      [[d,[[[x,^,2],*,[[x,^,3],^,4]],/,[[x,^,6],^,5]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,power_dist2,numeric,power_asso1,numeric,div_power1,numeric,power_dist2,numeric,dpower,numeric]
    ],

   
    [
      [[d,[[[x,^,2],*,[[x,^,3],^,5]],/,[[x,^,4],^,6]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,power_dist2,numeric,power_asso1,numeric,div_power1,numeric,power_dist2,numeric,dpower,numeric]
    ],

   
    [
      [[d,[[[x,^,2],*,[[x,^,3],^,5]],/,[[x,^,6],^,4]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,power_dist2,numeric,power_asso1,numeric,div_power1,numeric,power_dist2,numeric,dpower,numeric]
    ],

   
    [
      [[d,[[[x,^,3],*,[[x,^,2],^,4]],/,[[x,^,5],^,6]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,power_dist2,numeric,power_asso1,numeric,div_power1,numeric,power_dist2,numeric,dpower,numeric]
    ],

   
    [
      [[d,[[[x,^,3],*,[[x,^,2],^,5]],/,[[x,^,4],^,6]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,power_dist2,numeric,power_asso1,numeric,div_power1,numeric,power_dist2,numeric,dpower,numeric]
    ],

   
    [
      [[d,[[[x,^,3],*,[[x,^,2],^,5]],/,[[x,^,6],^,4]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,power_dist2,numeric,power_asso1,numeric,div_power1,numeric,power_dist2,numeric,dpower,numeric]
    ],

   
    [
      [[d,[[[x,^,2],*,[[x,^,4],^,6]],/,[[x,^,8],^,10]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,power_dist2,numeric,power_asso1,numeric,div_power1,numeric,power_dist2,numeric,dpower,numeric]
    ],

   
    [
      [[d,[[[x,^,2],*,[[x,^,4],^,6]],/,[[x,^,3],^,5]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,power_dist2,numeric,power_asso1,numeric,div_power1,numeric,power_dist2,numeric,dpower,numeric]
    ],

   
    [
      [[d,[[[x,^,3],*,[[x,^,5],^,7]],/,[[x,^,9],^,2]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,power_dist2,numeric,power_asso1,numeric,div_power1,numeric,power_dist2,numeric,dpower,numeric]
    ],

   
    [
      [[d,[[[x,^,4],*,[[x,^,2],^,4]],/,[[x,^,3],^,2]]],/,[d,x]],
      [ukx,*,[x,^,ukx]],
      [power_asso1,numeric,power_dist2,numeric,power_asso1,numeric,div_power1,numeric,power_dist2,numeric,dpower,numeric]
    ],

    [
      [[d,[[[[x,^,2],+,[3,/,[x,^,4]]],-,[5,/,x]],+,6]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,[x,^,ukx]]],
      [dplus1,dconst,plus_zero1,minus_to_plus1,dplus1,div_power3,mult_asso2,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dplus1,div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dpower,numeric,plus_to_minus1,mult_asso2,numeric]
    ],
 
    [
      [[d,[[[[x,^,2],+,[3,/,[x,^,4]]],-,[6,/,x]],+,5]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,[x,^,ukx]]],
      [dplus1,dconst,plus_zero1,minus_to_plus1,dplus1,div_power3,mult_asso2,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dplus1,div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dpower,numeric,plus_to_minus1,mult_asso2,numeric]
    ],
 
    [
      [[d,[[[[x,^,2],+,[3,/,[x,^,5]]],-,[4,/,x]],+,6]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,[x,^,ukx]]],
      [dplus1,dconst,plus_zero1,minus_to_plus1,dplus1,div_power3,mult_asso2,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dplus1,div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dpower,numeric,plus_to_minus1,mult_asso2,numeric]
    ],
 
    [
      [[d,[[[[x,^,2],+,[3,/,[x,^,5]]],-,[6,/,x]],+,4]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,[x,^,ukx]]],
      [dplus1,dconst,plus_zero1,minus_to_plus1,dplus1,div_power3,mult_asso2,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dplus1,div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dpower,numeric,plus_to_minus1,mult_asso2,numeric]
    ],
 
    [
      [[d,[[[[x,^,3],+,[2,/,[x,^,4]]],-,[5,/,x]],+,6]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,[x,^,ukx]]],
      [dplus1,dconst,plus_zero1,minus_to_plus1,dplus1,div_power3,mult_asso2,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dplus1,div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dpower,numeric,plus_to_minus1,mult_asso2,numeric]
    ],
 
    [
      [[d,[[[[x,^,3],+,[2,/,[x,^,4]]],-,[6,/,x]],+,5]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,[x,^,ukx]]],
      [dplus1,dconst,plus_zero1,minus_to_plus1,dplus1,div_power3,mult_asso2,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dplus1,div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dpower,numeric,plus_to_minus1,mult_asso2,numeric]
    ],
 
    [
      [[d,[[[[x,^,4],+,[4,/,[x,^,2]]],-,[3,/,x]],+,5]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,[x,^,ukx]]],
      [dplus1,dconst,plus_zero1,minus_to_plus1,dplus1,div_power3,mult_asso2,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dplus1,div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dpower,numeric,plus_to_minus1,mult_asso2,numeric]
    ],
 
    [
      [[d,[[[[x,^,4],+,[3,/,[x,^,2]]],-,[6,/,x]],+,5]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,[x,^,ukx]]],
      [dplus1,dconst,plus_zero1,minus_to_plus1,dplus1,div_power3,mult_asso2,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dplus1,div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dpower,numeric,plus_to_minus1,mult_asso2,numeric]
    ],
 
    [
      [[d,[[[[x,^,4],+,[3,/,[x,^,2]]],-,[5,/,x]],+,6]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,[x,^,ukx]]],
      [dplus1,dconst,plus_zero1,minus_to_plus1,dplus1,div_power3,mult_asso2,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dplus1,div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dpower,numeric,plus_to_minus1,mult_asso2,numeric]
    ],
 
    [
      [[d,[[[[x,^,6],+,[5,/,[x,^,4]]],-,[3,/,x]],+,2]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,[x,^,ukx]]],
      [dplus1,dconst,plus_zero1,minus_to_plus1,dplus1,div_power3,mult_asso2,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dplus1,div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dpower,numeric,plus_to_minus1,mult_asso2,numeric]
    ],
 
    [
      [[d,[[[[x,^,2],+,[4,/,[x,^,6]]],-,[8,/,x]],+,2]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,[x,^,ukx]]],
      [dplus1,dconst,plus_zero1,minus_to_plus1,dplus1,div_power3,mult_asso2,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dplus1,div_power1,numeric,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,dpower,numeric,plus_to_minus1,mult_asso2,numeric]
    ],
              
    [
      [[d,[[[2,*,[x,^,3]],-,[4,^,x]],+,[5,*,[xexp,^,x]]]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[[ukx,^,x],*,[xln,ukx]]],+,[ukx,*,[xexp,^,x]]],
      [dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,lne,mult_one1,minus_to_plus1,dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,plus_to_minus1,mult_asso2,numeric,mult_comm,mult_one1]
    ],
    
    [
      [[d,[[[2,*,[x,^,3]],-,[5,^,x]],+,[4,*,[xexp,^,x]]]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[[ukx,^,x],*,[xln,ukx]]],+,[ukx,*,[xexp,^,x]]],
      [dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,lne,mult_one1,minus_to_plus1,dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,plus_to_minus1,mult_asso2,numeric,mult_comm,mult_one1]
    ],
    
    [
      [[d,[[[3,*,[x,^,2]],-,[4,^,x]],+,[5,*,[xexp,^,x]]]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[[ukx,^,x],*,[xln,ukx]]],+,[ukx,*,[xexp,^,x]]],
      [dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,lne,mult_one1,minus_to_plus1,dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,plus_to_minus1,mult_asso2,numeric,mult_comm,mult_one1]
    ],
    
    [
      [[d,[[[3,*,[x,^,2]],-,[5,^,x]],+,[4,*,[xexp,^,x]]]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[[ukx,^,x],*,[xln,ukx]]],+,[ukx,*,[xexp,^,x]]],
      [dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,lne,mult_one1,minus_to_plus1,dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,plus_to_minus1,mult_asso2,numeric,mult_comm,mult_one1]
    ],
    
    [
      [[d,[[[4,*,[x,^,3]],-,[2,^,x]],+,[3,*,[xexp,^,x]]]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[[ukx,^,x],*,[xln,ukx]]],+,[ukx,*,[xexp,^,x]]],
      [dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,lne,mult_one1,minus_to_plus1,dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,plus_to_minus1,mult_asso2,numeric,mult_comm,mult_one1]
    ],
    
    [
      [[d,[[[2,*,[x,^,4]],-,[6,^,x]],+,[8,*,[xexp,^,x]]]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[[ukx,^,x],*,[xln,ukx]]],+,[ukx,*,[xexp,^,x]]],
      [dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,lne,mult_one1,minus_to_plus1,dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,plus_to_minus1,mult_asso2,numeric,mult_comm,mult_one1]
    ],
    
    [
      [[d,[[[3,*,[x,^,5]],-,[7,^,x]],+,[3,*,[xexp,^,x]]]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[[ukx,^,x],*,[xln,ukx]]],+,[ukx,*,[xexp,^,x]]],
      [dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,lne,mult_one1,minus_to_plus1,dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,plus_to_minus1,mult_asso2,numeric,mult_comm,mult_one1]
    ],
    
    [
      [[d,[[[4,*,[x,^,3]],-,[4,^,x]],+,[3,*,[xexp,^,x]]]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[[ukx,^,x],*,[xln,ukx]]],+,[ukx,*,[xexp,^,x]]],
      [dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,lne,mult_one1,minus_to_plus1,dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,plus_to_minus1,mult_asso2,numeric,mult_comm,mult_one1]
    ],
    
    [
      [[d,[[[6,*,[x,^,3]],-,[7,^,x]],+,[5,*,[xexp,^,x]]]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[[ukx,^,x],*,[xln,ukx]]],+,[ukx,*,[xexp,^,x]]],
      [dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,lne,mult_one1,minus_to_plus1,dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,plus_to_minus1,mult_asso2,numeric,mult_comm,mult_one1]
    ],
    
    [
      [[d,[[[-3,*,[x,^,-3]],-,[2,^,x]],+,[-3,*,[xexp,^,x]]]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[[ukx,^,x],*,[xln,ukx]]],+,[ukx,*,[xexp,^,x]]],
      [dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,lne,mult_one1,minus_to_plus1,dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,plus_to_minus1,mult_asso2,numeric,mult_comm,mult_one1]
    ],
    
    [
      [[d,[[[-5,*,[x,^,-3]],-,[2,^,x]],+,[-2,*,[xexp,^,x]]]],/,[d,x]],
      [[[ukx,*,[x,^,ukx]],-,[[ukx,^,x],*,[xln,ukx]]],+,[ukx,*,[xexp,^,x]]],
      [dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,lne,mult_one1,minus_to_plus1,dplus1,dmult1,dconst,mult_zero1,plus_zero1,dexp,dmult1,dconst,mult_zero1,plus_zero1,dpower,numeric,mult_asso2,numeric,plus_to_minus1,mult_asso2,numeric,mult_comm,mult_one1]
    ],
    
    [
      [[d,[[[2,*,[xtan,x]],+,[xsec,x]],-,1]],/,[d,x]],
      [[xsec,x],*,[[ukx,*,[xsec,x]],+,[xtan,x]]],
      [minus_to_plus1,dplus1,numeric,dconst,plus_zero1,dplus1,dsec,dmult1,dconst,mult_zero1,plus_zero1,dtan,mult_asso2,mult_comm,mult_dist2]
    ],
    
    [
      [[d,[[[3,*,[xtan,x]],+,[xsec,x]],-,1]],/,[d,x]],
      [[xsec,x],*,[[ukx,*,[xsec,x]],+,[xtan,x]]],
      [minus_to_plus1,dplus1,numeric,dconst,plus_zero1,dplus1,dsec,dmult1,dconst,mult_zero1,plus_zero1,dtan,mult_asso2,mult_comm,mult_dist2]
    ],
    
    [
      [[d,[[[2,*,[xtan,x]],+,[xsec,x]],-,2]],/,[d,x]],
      [[xsec,x],*,[[ukx,*,[xsec,x]],+,[xtan,x]]],
      [minus_to_plus1,dplus1,numeric,dconst,plus_zero1,dplus1,dsec,dmult1,dconst,mult_zero1,plus_zero1,dtan,mult_asso2,mult_comm,mult_dist2]
    ],
    
    [
      [[d,[[[5,*,[xtan,x]],+,[xsec,x]],-,3]],/,[d,x]],
      [[xsec,x],*,[[ukx,*,[xsec,x]],+,[xtan,x]]],
      [minus_to_plus1,dplus1,numeric,dconst,plus_zero1,dplus1,dsec,dmult1,dconst,mult_zero1,plus_zero1,dtan,mult_asso2,mult_comm,mult_dist2]
    ],
 
    [
      [[d,[[xsin,x],*,[xcos,x]]],/,[d,x]],
      [xcos,[ukx,*,x]],
      [sincos,dmult1,dconst,mult_zero1,plus_zero1,dchain1,dsin,dmult1,dconst,mult_zero1,plus_zero1,div_to_1,numeric,mult_comm,mult_asso1,numeric,mult_one1]
    ],



    [
      [[d,[[x,^,-3],*,[xln,x]]],/,[d,x]],
      [[[ukx,*,x],*,[xln,x]],+,x],
      [dmult1,dln,power_dist2,numeric,dpower,numeric,power1_elim,power1_elim,add_comm,mult_comm]
    ],
 
    [
      [[d,[[x,^,-2],*,[xln,x]]],/,[d,x]],
      [[[ukx,*,x],*,[xln,x]],+,x],
      [dmult1,dln,power_dist2,numeric,dpower,numeric,power1_elim,power1_elim,add_comm,mult_comm]
    ],
 
    [
      [[d,[[x,^,-2],*,[xln,x]]],/,[d,x]],
      [[[ukx,*,x],*,[xln,x]],+,x],
      [dmult1,dln,power_dist2,numeric,dpower,numeric,power1_elim,power1_elim,add_comm,mult_comm]
    ],
 
    [
      [[d,[[x,^,3],*,[xln,x]]],/,[d,x]],
      [[[ukx,*,x],*,[xln,x]],+,x],
      [dmult1,dln,power_dist2,numeric,dpower,numeric,power1_elim,power1_elim,add_comm,mult_comm]
    ],
 
    [
      [[d,[[x,^,4],*,[xln,x]]],/,[d,x]],
      [[[ukx,*,x],*,[xln,x]],+,x],
      [dmult1,dln,power_dist2,numeric,dpower,numeric,power1_elim,power1_elim,add_comm,mult_comm]
    ],
 

    [
      [[d,[[x,^,5],*,[xln,x]]],/,[d,x]],
      [[[ukx,*,x],*,[xln,x]],+,x],
      [dmult1,dln,power_dist2,numeric,dpower,numeric,power1_elim,power1_elim,add_comm,mult_comm]
    ],
    
      
    [
      [[d,[[10,*,[xexp,^,x]],*,[xcos,x]]],/,[d,x]],
      [[ukx,*,[xexp,^,x]],*,[[xcos,x],-,[xsin,x]]],
      [mult_asso1,dmult1,dconst,mult_zero1,plus_zero1,dmult1,dexp,dcos,lne,mult_one1,add_comm,mult_comm,mult_dist2,mult_asso2,minus_to_plus2]
    ],
    
    
    [
      [[d,[[-3,*,[xexp,^,x]],*,[xcos,x]]],/,[d,x]],
      [[ukx,*,[xexp,^,x]],*,[[xcos,x],-,[xsin,x]]],
      [mult_asso1,dmult1,dconst,mult_zero1,plus_zero1,dmult1,dexp,dcos,lne,mult_one1,add_comm,mult_comm,mult_dist2,mult_asso2,minus_to_plus2]
    ],
    
    
    [
      [[d,[[3,*,[xexp,^,x]],*,[xcos,x]]],/,[d,x]],
      [[ukx,*,[xexp,^,x]],*,[[xcos,x],-,[xsin,x]]],
      [mult_asso1,dmult1,dconst,mult_zero1,plus_zero1,dmult1,dexp,dcos,lne,mult_one1,add_comm,mult_comm,mult_dist2,mult_asso2,minus_to_plus2]
    ],
      
    [
      [[d,[[xln,x],*,[x,^,-5]]],/,[d,x]],
      [[ukx,-,[xln,x]],*,[x,^,ukx]],
      [dmult1,dln,dpower,numeric,power_dist2,numeric,add_comm,mult_comm,add_comm,mult_comm,plus_to_minus1,mult_comm,mult_comm,minus_to_plus1,add_comm,mult_comm,add_comm,mult_comm,mult_asso1,numeric,add_comm,mult_comm,mult_asso2,mult_dist4,add_comm,mult_comm,add_comm,mult_comm,mult_comm,minus_to_plus2]
    ],
    
    [
      [[d,[[xln,x],*,[x,^,3]]],/,[d,x]],
      [[ukx,-,[xln,x]],*,[x,^,ukx]],
      [dmult1,dln,dpower,numeric,power_dist2,numeric,add_comm,mult_comm,add_comm,mult_comm,plus_to_minus1,mult_comm,mult_comm,minus_to_plus1,add_comm,mult_comm,add_comm,mult_comm,mult_asso1,numeric,add_comm,mult_comm,mult_asso2,mult_dist4,add_comm,mult_comm,add_comm,mult_comm,mult_comm,minus_to_plus2]
    ],
    
    
    [
      [[d,[[xln,x],*,[x,^,4]]],/,[d,x]],
      [[ukx,-,[xln,x]],*,[x,^,ukx]],
      [dmult1,dln,dpower,numeric,power_dist2,numeric,add_comm,mult_comm,add_comm,mult_comm,plus_to_minus1,mult_comm,mult_comm,minus_to_plus1,add_comm,mult_comm,add_comm,mult_comm,mult_asso1,numeric,add_comm,mult_comm,mult_asso2,mult_dist4,add_comm,mult_comm,add_comm,mult_comm,mult_comm,minus_to_plus2]
    ],


    
    [
      [[d,[[[xexp,^,x],*,[x,^,5]],+,3]],/,[d,x]],
      [[xexp,^,x],*,[[x,^,ukx],-,[ukx,*,[x,^,ukx]]]],
      [dplus1,dconst,plus_zero1,dmult1,dexp,lne,mult_one1,dpower,numeric,mult_comm,mult_dist2,add_comm,mult_comm,plus_to_minus1,mult_comm,mult_asso2,numeric]
    ],
 
    
    [
      [[d,[[[xexp,^,x],*,[x,^,2]],+,4]],/,[d,x]],
      [[xexp,^,x],*,[[x,^,ukx],-,[ukx,*,[x,^,ukx]]]],
      [dplus1,dconst,plus_zero1,dmult1,dexp,lne,mult_one1,dpower,numeric,mult_comm,mult_dist2,add_comm,mult_comm,plus_to_minus1,mult_comm,mult_asso2,numeric]
    ],
 
    
    [
      [[d,[[[xexp,^,x],*,[x,^,3]],+,5]],/,[d,x]],
      [[xexp,^,x],*,[[x,^,ukx],-,[ukx,*,[x,^,ukx]]]],
      [dplus1,dconst,plus_zero1,dmult1,dexp,lne,mult_one1,dpower,numeric,mult_comm,mult_dist2,add_comm,mult_comm,plus_to_minus1,mult_comm,mult_asso2,numeric]
    ],
 
    
    [
      [[d,[[[xexp,^,x],*,[x,^,5]],+,3]],/,[d,x]],
      [[xexp,^,x],*,[[x,^,ukx],-,[ukx,*,[x,^,ukx]]]],
      [dplus1,dconst,plus_zero1,dmult1,dexp,lne,mult_one1,dpower,numeric,mult_comm,mult_dist2,add_comm,mult_comm,plus_to_minus1,mult_comm,mult_asso2,numeric]
    ]
 
 
  ].




test_expr4(Expr):-
  Expr = [
    
    % P192 2.  

    % (1)    

    [
      [xint,[[x,^,-2],*,[d,x]]],
      [[-1,*,[x,^,-1]],+,sp_c],
      [ipower,numeric,numeric,numeric]
    ],
    
    % (2) 
    
    [
      [xint,[[x,*,[x,^,0.5]],*,[d,x]]],
      [[0.4,*,[x,^,2.5]],+,sp_c],
      [mult_comm,multpowersimp1,numeric,ipower,numeric,numeric,numeric]
    ],
    
    % (3) 
    
    [
      [xint,[[x,^,-0.5],*,[d,x]]],
      [[2,*,[x,^,0.5]],+,sp_c],
      [ipower,numeric,numeric,numeric]
    ],
    
    % (4) 
    
    [
      [xint,[[[x,^,2],*,[x,^,0.333333]],*,[d,x]]],
      [[0.3,*,[x,^,3.333333]],+,sp_c],
      [power_dist2,numeric,ipower,numeric,numeric,numeric]
    ],
    
    % (5) 
    
    [
      [xint,[[[x,^,-2],*,[x,^,-0.5]],*,[d,x]]],
      [[-0.666667,*,[x,^,-1.5]],+,sp_c],
      [power_dist2,numeric,ipower,numeric,numeric,numeric]
    ],
    
    % (6) 
    
    [
      [xint,[[[x,^,n],^,[m,^,-1]],*,[d,x]]],
      [[[m,*,[[m,+,n],^,-1]],*,[x,^,[[m,+,n],*,[m,^,-1]]]],+,sp_c],
      [power_asso1,ipower,sprule1,sprule1,divdiv,mult_comm,mult_one1,div_power3]
    ],
    
    % (7) 
    
    [
      [xint,[[5,*,[x,^,3]],*,[d,x]]],
      [[1.25,*,[x,^,4]],+,sp_c],
      [imultconst,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c]
    ],
    
    % (8) 
    
    [
      [xint,[[[[x,^,2],-,[3,*,x]],+,2],*,[d,x]]],
      [[[[0.333333,*,[x,^,3]],-,[1.5,*,[x,^,2]]],+,[2,*,x]],+,sp_c],
      [minus_to_plus1,iplus,iconst,iplus,mult_asso2,numeric,sprule2,imultconst,ipower,numeric,numeric,numeric,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,plus_to_minus1,mult_asso2,numeric]
    ],
    
    % (9) 
    
    [
      [xint,[[[[2,*,g],*,h],^,-0.5],*,[d,h]]],
      [[[[2,^,0.5],*,[h,^,0.5]],*,[g,^,-0.5]],+,sp_c],
      [power_dist3,imultconst,ipower,numeric,numeric,numeric,mult_dist1,mult_c,power_dist3,mult_comm,mult_asso1,mult_asso2,multpowersimp1,numeric,mult_comm]
    ],
    
    % (10) 
    
    [
      [xint,[[[[x,^,2],+,1],^,2],*,[d,x]]],
      [[[[0.2,*,[x,^,5]],+,[0.666666,*,[x,^,3]]],+,x],+,sp_c],
      [/*(a+b)^2*/square_to_mult1,mult_dist1,mult_comm,mult_dist1,mult_comm,mult_dist1,square_to_mult2,square_to_mult2,add_asso1,mult_comm,add_asso2,mult_two2/*a^2+2ab+b^2*/,mult_one1,square_to_mult1,numeric,power_asso1,numeric,iplus,iplus,ipower,numeric,numeric,numeric,imultconst,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c,iconst,mult_comm,mult_one1,add_comm,add_asso1,add_asso2,c_plus_c,add_asso1,add_comm,add_asso1,add_asso2,c_plus_c,add_comm,add_comm,add_comm,add_comm,add_asso2,add_asso2]
    ],
    
    % P207 2
    
    % (1) 
    
    [
      [xint,[[xexp,^,[5,*,t]],*,[d,t]]],
      [[0.2,*,[xexp,^,[5,*,t]]],+,sp_c],
      [isubsconst,iexp,lne,numeric,power_one,mult_comm,mult_one1,mult_dist1,mult_c]
    ],
    
    % (2) 
    
    [
      [xint,[[[3,-,[2,*,x]],^,3],*,[d,x]]],
      [[-0.125,*,[[3,-,[2,*,x]],^,4]],+,sp_c],
      [isubsconst,isubsminus,ipower,numeric,numeric,numeric,numeric,mult_asso2,numeric,mult_dist1,mult_asso2,numeric,num_mult_c]
    ],
    
    % (3) 
    
    [
      [xint,[[[1,-,[2,*,x]],^,-1],*,[d,x]]],
      [[-0.5,*,[xln,[xabs,[1,-,[2,*,x]]]]],+,sp_c],
      [isubsconst,isubsminus,ipowerneg1,numeric,mult_asso2,numeric,mult_dist1,num_mult_c]
    ],
    
    
    % (4) 
    
    [
      [xint,[[[2,-,[3,*,x]],^,-0.333333],*,[d,x]]],
      [[-0.499999,*,[[2,-,[3,*,x]],^,0.666667]],+,sp_c],
      [isubsconst,isubsminus,ipower,numeric,numeric,numeric,numeric,mult_asso2,numeric,mult_dist1,mult_asso2,numeric,num_mult_c]
    ],
    
    % (5) 
    
    [
      [xint,[[[xsin,[a,*,x]],-,[xexp,^,[x,/,b]]],*,[d,x]]],
      [[[[-1,/,a],*,[xcos,[a,*,x]]],-,[b,*,[xexp,^,[x,/,b]]]],+,sp_c],
      [minus_to_plus1,iplus,isubsconst,isin,check_ground,mult_dist1,mult_c,imultconst,isubsdivconst,iexp,check_ground,lne,power_one,mult_dist1,mult_c,mult_comm,mult_one1,mult_asso2,sprule3,mult_dist1,num_mult_c,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,minus_to_plus2]
    ],
    
    % (6) 
    
    [
      [xint,[[[xsin,[t,^,0.5]],*,[t,^,-0.5]],*,[d,t]]],
      [[-2,*,[xcos,[t,^,0.5]]],+,sp_c],
      [mult_asso1,dsubspower,numeric,numeric,numeric,mult_asso2,mult_comm,imultconst,isin,mult_dist1,num_mult_c,mult_asso2,numeric]
    ],
    
    % (7) 
    
    [
      [xint,[[x,*,[xexp,^,[-1,*,[x,^,2]]]],*,[d,x]]],
      [[-0.5,*,[xexp,^,[-1,*,[x,^,2]]]],+,sp_c],
      [mult_comm,mult_asso1,dsubsx,mult_asso2,mult_comm,imultconst,isubsneg,iexp,lne,power_one,mult_asso2,numeric,mult_dist1,num_mult_c,mult_comm,mult_one1]
    ],
    
    % (8) 
    
    [
      [xint,[[x,*,[xcos,[x,^,2]]],*,[d,x]]],
      [[0.5,*,[xsin,[x,^,2]]],+,sp_c],
      [mult_comm,mult_asso1,dsubsx,mult_asso2,mult_comm,imultconst,icos,mult_dist1,num_mult_c]
    ],

    % P209 E1 E2 E3
  
    % E1
  
    [
      [xint,[[x,*,[xcos,x]],*,[d,x]]],
      [[[x,*,[xsin,x]],+,[xcos,x]],+,sp_c],
      [mult_asso1,dsubscos,intbyparts,isin,minus_to_plus1,mult_dist1,mult_asso2,numeric,num_mult_c,add_asso2,mult_comm,mult_one1]
    ],
    
    % E2
    
    [
      [xint,[[x,*,[xexp,^,x]],*,[d,x]]],
      [[[x,*,[xexp,^,x]],-,[xexp,^,x]],+,sp_c],
      [mult_asso1,dsubsexp,lne,power_one,mult_asso2,mult_one1,intbyparts,iexp,lne,power_one,mult_comm,mult_one1,add_comm,minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso2,minus_to_plus2,num_mult_c]
    ],
    
    % E3
    
    [
      [xint,[[[x,^,2],*,[xexp,^,x]],*,[d,x]]],
      [[[[[x,^,2],*,[xexp,^,x]],-,[2,*,[x,*,[xexp,^,x]]]],+,[2,*,[xexp,^,x]]],+,sp_c],
      [mult_asso1,dsubsexp,lne,power_one,mult_asso2,mult_one1,intbyparts,dextpower,numeric,power_to_mult3,mult_asso2,mult_comm,mult_asso1,imultconst,mult_asso1,dsubsexp,lne,power_one,mult_asso2,mult_one1,intbyparts,iexp,lne,power_one,mult_comm,mult_one1,add_comm,minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso2,minus_to_plus2,num_mult_c,minus_to_plus1,mult_asso2,numeric,minus_to_plus1,mult_dist1,num_mult_c,mult_dist1,mult_asso2,numeric,add_asso1,add_asso2,plus_to_minus1,add_asso2,mult_asso2,numeric]
    ]

  ].





test_expr4_big(Expr):-
  Expr = [
    

    [
      [xint,[[x,^,-4],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [ipower,numeric,numeric,numeric]
    ],
    

    [
      [xint,[[x,^,-3],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [ipower,numeric,numeric,numeric]
    ],
    

    [
      [xint,[[x,^,-2],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [ipower,numeric,numeric,numeric]
    ],
    
          
    [
      [xint,[[x,*,[x,^,0.5]],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [mult_comm,multpowersimp1,numeric,ipower,numeric,numeric,numeric]
    ],
    
 
    [
      [xint,[[x,*,[x,^,2]],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [mult_comm,multpowersimp1,numeric,ipower,numeric,numeric,numeric]
    ],
     
    
    [
      [xint,[[x,*,[x,^,3]],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [mult_comm,multpowersimp1,numeric,ipower,numeric,numeric,numeric]
    ],
      
    [
      [xint,[[x,^,-2],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [ipower,numeric,numeric,numeric]
    ],
    
    [
      [xint,[[x,^,-4],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [ipower,numeric,numeric,numeric]
    ],
    
    
    [
      [xint,[[x,^,-6],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [ipower,numeric,numeric,numeric]
    ],
    
       
    [
      [xint,[[[x,^,3],*,[x,^,3]],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [power_dist2,numeric,ipower,numeric,numeric,numeric]
    ],
    
    
    [
      [xint,[[[x,^,2],*,[x,^,3]],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [power_dist2,numeric,ipower,numeric,numeric,numeric]
    ],
    
    
    [
      [xint,[[[x,^,3],*,[x,^,-1]],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [power_dist2,numeric,ipower,numeric,numeric,numeric]
    ],
    
    
    [
      [xint,[[[x,^,2],*,[x,^,0.333333]],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [power_dist2,numeric,ipower,numeric,numeric,numeric]
    ],
    
    
    [
      [xint,[[[x,^,-2],*,[x,^,-0.5]],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [power_dist2,numeric,ipower,numeric,numeric,numeric]
    ],
      
    [
      [xint,[[[x,^,-2],*,[x,^,-3]],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [power_dist2,numeric,ipower,numeric,numeric,numeric]
    ],
    
    [
      [xint,[[[x,^,-4],*,[x,^,-5]],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [power_dist2,numeric,ipower,numeric,numeric,numeric]
    ],
    
    
    [
      [xint,[[[x,^,n],^,[m,^,-1]],*,[d,x]]],
      [[[m,*,[[m,+,n],^,-1]],*,[x,^,[[m,+,n],*,[m,^,-1]]]],+,sp_c],
      [power_asso1,ipower,sprule1,sprule1,divdiv,mult_comm,mult_one1,div_power3]
    ],
     
    [
      [xint,[[[x,^,v],^,[u,^,-1]],*,[d,x]]],
      [[[u,*,[[u,+,v],^,-1]],*,[x,^,[[u,+,v],*,[u,^,-1]]]],+,sp_c],
      [power_asso1,ipower,sprule1,sprule1,divdiv,mult_comm,mult_one1,div_power3]
    ],
    
      
    [
      [xint,[[10,*,[x,^,-3]],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [imultconst,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c]
    ],
    
    [
      [xint,[[7,*,[x,^,2]],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [imultconst,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c]
    ],
    
    
    [
      [xint,[[5,*,[x,^,3]],*,[d,x]]],
      [[ukx,*,[x,^,ukx]],+,sp_c],
      [imultconst,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c]
    ],
    
        
    [
      [xint,[[[[p,^,2],-,[3,*,p]],+,2],*,[d,p]]],
      [[[[ukx,*,[p,^,ukx]],-,[ukx,*,[p,^,ukx]]],+,[ukx,*,p]],+,sp_c],
      [minus_to_plus1,iplus,iconst,iplus,mult_asso2,numeric,sprule2,imultconst,ipower,numeric,numeric,numeric,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,plus_to_minus1,mult_asso2,numeric]
    ],
    
      
    [
      [xint,[[[[q,^,2],-,[3,*,q]],+,2],*,[d,q]]],
      [[[[ukx,*,[q,^,ukx]],-,[ukx,*,[q,^,ukx]]],+,[ukx,*,q]],+,sp_c],
      [minus_to_plus1,iplus,iconst,iplus,mult_asso2,numeric,sprule2,imultconst,ipower,numeric,numeric,numeric,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,plus_to_minus1,mult_asso2,numeric]
    ],
    
      
    [
      [xint,[[[[x,^,2],-,[3,*,x]],+,2],*,[d,x]]],
      [[[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,x]],+,sp_c],
      [minus_to_plus1,iplus,iconst,iplus,mult_asso2,numeric,sprule2,imultconst,ipower,numeric,numeric,numeric,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,plus_to_minus1,mult_asso2,numeric]
    ],
    
    
    [
      [xint,[[[[x,^,2],-,[4,*,x]],+,5],*,[d,x]]],
      [[[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,x]],+,sp_c],
      [minus_to_plus1,iplus,iconst,iplus,mult_asso2,numeric,sprule2,imultconst,ipower,numeric,numeric,numeric,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,plus_to_minus1,mult_asso2,numeric]
    ],
    
    
    [
      [xint,[[[[x,^,2],-,[2,*,x]],+,3],*,[d,x]]],
      [[[[ukx,*,[x,^,ukx]],-,[ukx,*,[x,^,ukx]]],+,[ukx,*,x]],+,sp_c],
      [minus_to_plus1,iplus,iconst,iplus,mult_asso2,numeric,sprule2,imultconst,ipower,numeric,numeric,numeric,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,plus_to_minus1,mult_asso2,numeric]
    ],
    
     
    [
      [xint,[[[[2,*,u],*,v],^,-0.5],*,[d,v]]],
      [[[[2,^,0.5],*,[v,^,0.5]],*,[u,^,-0.5]],+,sp_c],
      [power_dist3,imultconst,ipower,numeric,numeric,numeric,mult_dist1,mult_c,power_dist3,mult_comm,mult_asso1,mult_asso2,multpowersimp1,numeric,mult_comm]
    ],
    
    [
      [xint,[[[[2,*,g],*,h],^,-0.5],*,[d,h]]],
      [[[[2,^,0.5],*,[h,^,0.5]],*,[g,^,-0.5]],+,sp_c],
      [power_dist3,imultconst,ipower,numeric,numeric,numeric,mult_dist1,mult_c,power_dist3,mult_comm,mult_asso1,mult_asso2,multpowersimp1,numeric,mult_comm]
    ],
    
       
    [
      [xint,[[[[x,^,2],+,1],^,2],*,[d,x]]],
      [[[[ukx,*,[x,^,ukx]],+,[ukx,*,[x,^,ukx]]],+,x],+,sp_c],
      [/*(a+b)^2*/square_to_mult1,mult_dist1,mult_comm,mult_dist1,mult_comm,mult_dist1,square_to_mult2,square_to_mult2,add_asso1,mult_comm,add_asso2,mult_two2/*a^2+2ab+b^2*/,mult_one1,square_to_mult1,numeric,power_asso1,numeric,iplus,iplus,ipower,numeric,numeric,numeric,imultconst,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c,iconst,mult_comm,mult_one1,add_comm,add_asso1,add_asso2,c_plus_c,add_asso1,add_comm,add_asso1,add_asso2,c_plus_c,add_comm,add_comm,add_comm,add_comm,add_asso2,add_asso2]
    ],
    
    
    [
      [xint,[[[[x,^,2],+,3],^,2],*,[d,x]]],
      [[[[ukx,*,[x,^,ukx]],+,[ukx,*,[x,^,ukx]]],+,x],+,sp_c],
      [/*(a+b)^2*/square_to_mult1,mult_dist1,mult_comm,mult_dist1,mult_comm,mult_dist1,square_to_mult2,square_to_mult2,add_asso1,mult_comm,add_asso2,mult_two2/*a^2+2ab+b^2*/,mult_one1,square_to_mult1,numeric,power_asso1,numeric,iplus,iplus,ipower,numeric,numeric,numeric,imultconst,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c,iconst,mult_comm,mult_one1,add_comm,add_asso1,add_asso2,c_plus_c,add_asso1,add_comm,add_asso1,add_asso2,c_plus_c,add_comm,add_comm,add_comm,add_comm,add_asso2,add_asso2]
    ],
    
    
    [
      [xint,[[[[x,^,2],+,5],^,2],*,[d,x]]],
      [[[[ukx,*,[x,^,ukx]],+,[ukx,*,[x,^,ukx]]],+,x],+,sp_c],
      [/*(a+b)^2*/square_to_mult1,mult_dist1,mult_comm,mult_dist1,mult_comm,mult_dist1,square_to_mult2,square_to_mult2,add_asso1,mult_comm,add_asso2,mult_two2/*a^2+2ab+b^2*/,mult_one1,square_to_mult1,numeric,power_asso1,numeric,iplus,iplus,ipower,numeric,numeric,numeric,imultconst,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c,iconst,mult_comm,mult_one1,add_comm,add_asso1,add_asso2,c_plus_c,add_asso1,add_comm,add_asso1,add_asso2,c_plus_c,add_comm,add_comm,add_comm,add_comm,add_asso2,add_asso2]
    ],
    
     
    [
      [xint,[[[[x,^,2],+,7],^,2],*,[d,x]]],
      [[[[ukx,*,[x,^,ukx]],+,[ukx,*,[x,^,ukx]]],+,x],+,sp_c],
      [/*(a+b)^2*/square_to_mult1,mult_dist1,mult_comm,mult_dist1,mult_comm,mult_dist1,square_to_mult2,square_to_mult2,add_asso1,mult_comm,add_asso2,mult_two2/*a^2+2ab+b^2*/,mult_one1,square_to_mult1,numeric,power_asso1,numeric,iplus,iplus,ipower,numeric,numeric,numeric,imultconst,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c,iconst,mult_comm,mult_one1,add_comm,add_asso1,add_asso2,c_plus_c,add_asso1,add_comm,add_asso1,add_asso2,c_plus_c,add_comm,add_comm,add_comm,add_comm,add_asso2,add_asso2]
    ],
    
    
    [
      [xint,[[[[y,^,2],+,7],^,2],*,[d,y]]],
      [[[[ukx,*,[y,^,ukx]],+,[ukx,*,[y,^,ukx]]],+,y],+,sp_c],
      [/*(a+b)^2*/square_to_mult1,mult_dist1,mult_comm,mult_dist1,mult_comm,mult_dist1,square_to_mult2,square_to_mult2,add_asso1,mult_comm,add_asso2,mult_two2/*a^2+2ab+b^2*/,mult_one1,square_to_mult1,numeric,power_asso1,numeric,iplus,iplus,ipower,numeric,numeric,numeric,imultconst,ipower,numeric,numeric,numeric,mult_dist1,mult_asso2,numeric,num_mult_c,iconst,mult_comm,mult_one1,add_comm,add_asso1,add_asso2,c_plus_c,add_asso1,add_comm,add_asso1,add_asso2,c_plus_c,add_comm,add_comm,add_comm,add_comm,add_asso2,add_asso2]
    ],
    
      
    [
      [xint,[[xexp,^,[2,*,t]],*,[d,t]]],
      [[ukx,*,[xexp,^,[ukx,*,t]]],+,sp_c],
      [isubsconst,iexp,lne,numeric,power_one,mult_comm,mult_one1,mult_dist1,mult_c]
    ],
    
    [
      [xint,[[xexp,^,[-3,*,t]],*,[d,t]]],
      [[ukx,*,[xexp,^,[ukx,*,t]]],+,sp_c],
      [isubsconst,iexp,lne,numeric,power_one,mult_comm,mult_one1,mult_dist1,mult_c]
    ],
    
    [
      [xint,[[xexp,^,[5,*,t]],*,[d,t]]],
      [[ukx,*,[xexp,^,[ukx,*,t]]],+,sp_c],
      [isubsconst,iexp,lne,numeric,power_one,mult_comm,mult_one1,mult_dist1,mult_c]
    ],
    
   
    [
      [xint,[[[4,-,[5,*,x]],^,3],*,[d,x]]],
      [[ukx,*,[[ukx,-,[ukx,*,x]],^,ukx]],+,sp_c],
      [isubsconst,isubsminus,ipower,numeric,numeric,numeric,numeric,mult_asso2,numeric,mult_dist1,mult_asso2,numeric,num_mult_c]
    ],
    

    [
      [xint,[[[6,-,[4,*,x]],^,3],*,[d,x]]],
      [[ukx,*,[[ukx,-,[ukx,*,x]],^,ukx]],+,sp_c],
      [isubsconst,isubsminus,ipower,numeric,numeric,numeric,numeric,mult_asso2,numeric,mult_dist1,mult_asso2,numeric,num_mult_c]
    ],
    
   
    [
      [xint,[[[2,-,[3,*,x]],^,3],*,[d,x]]],
      [[ukx,*,[[ukx,-,[ukx,*,x]],^,ukx]],+,sp_c],
      [isubsconst,isubsminus,ipower,numeric,numeric,numeric,numeric,mult_asso2,numeric,mult_dist1,mult_asso2,numeric,num_mult_c]
    ],
    
    
    [
      [xint,[[[1,-,[2,*,x]],^,-1],*,[d,x]]],
      [[-0.5,*,[xln,[xabs,[1,-,[2,*,x]]]]],+,sp_c],
      [isubsconst,isubsminus,ipowerneg1,numeric,mult_asso2,numeric,mult_dist1,num_mult_c]
    ],
     
    [
      [xint,[[[2,-,[3,*,x]],^,-0.333333],*,[d,x]]],
      [[ukx,*,[[ukx,-,[ukx,*,x]],^,ukx]],+,sp_c],
      [isubsconst,isubsminus,ipower,numeric,numeric,numeric,numeric,mult_asso2,numeric,mult_dist1,mult_asso2,numeric,num_mult_c]
    ],
      
    [
      [xint,[[[4,-,[2,*,x]],^,-3],*,[d,x]]],
      [[ukx,*,[[ukx,-,[ukx,*,x]],^,ukx]],+,sp_c],
      [isubsconst,isubsminus,ipower,numeric,numeric,numeric,numeric,mult_asso2,numeric,mult_dist1,mult_asso2,numeric,num_mult_c]
    ],
    
    [
      [xint,[[[5,-,[6,*,x]],^,-2],*,[d,x]]],
      [[ukx,*,[[ukx,-,[ukx,*,x]],^,ukx]],+,sp_c],
      [isubsconst,isubsminus,ipower,numeric,numeric,numeric,numeric,mult_asso2,numeric,mult_dist1,mult_asso2,numeric,num_mult_c]
    ],
    
    
    [
      [xint,[[[3,-,[2,*,x]],^,-3],*,[d,x]]],
      [[ukx,*,[[ukx,-,[ukx,*,x]],^,ukx]],+,sp_c],
      [isubsconst,isubsminus,ipower,numeric,numeric,numeric,numeric,mult_asso2,numeric,mult_dist1,mult_asso2,numeric,num_mult_c]
    ],
    
    [
      [xint,[[[xsin,[a,*,x]],-,[xexp,^,[x,/,b]]],*,[d,x]]],
      [[[[-1,/,a],*,[xcos,[a,*,x]]],-,[b,*,[xexp,^,[x,/,b]]]],+,sp_c],
      [minus_to_plus1,iplus,isubsconst,isin,check_ground,mult_dist1,mult_c,imultconst,isubsdivconst,iexp,check_ground,lne,power_one,mult_dist1,mult_c,mult_comm,mult_one1,mult_asso2,sprule3,mult_dist1,num_mult_c,add_asso1,add_comm,add_asso2,c_plus_c,add_comm,add_asso2,minus_to_plus2]
    ],
    
    
    [
      [xint,[[[xsin,[t,^,0.5]],*,[t,^,-0.5]],*,[d,t]]],
      [[-2,*,[xcos,[t,^,0.5]]],+,sp_c],
      [mult_asso1,dsubspower,numeric,numeric,numeric,mult_asso2,mult_comm,imultconst,isin,mult_dist1,num_mult_c,mult_asso2,numeric]
    ],
    
    
    [
      [xint,[[x,*,[xexp,^,[-1,*,[x,^,2]]]],*,[d,x]]],
      [[-0.5,*,[xexp,^,[-1,*,[x,^,2]]]],+,sp_c],
      [mult_comm,mult_asso1,dsubsx,mult_asso2,mult_comm,imultconst,isubsneg,iexp,lne,power_one,mult_asso2,numeric,mult_dist1,num_mult_c,mult_comm,mult_one1]
    ],
    
    
    [
      [xint,[[x,*,[xcos,[x,^,2]]],*,[d,x]]],
      [[0.5,*,[xsin,[x,^,2]]],+,sp_c],
      [mult_comm,mult_asso1,dsubsx,mult_asso2,mult_comm,imultconst,icos,mult_dist1,num_mult_c]
    ],

    % P209 E1 E2 E3
  
    % E1
  
    [
      [xint,[[x,*,[xcos,x]],*,[d,x]]],
      [[[x,*,[xsin,x]],+,[xcos,x]],+,sp_c],
      [mult_asso1,dsubscos,intbyparts,isin,minus_to_plus1,mult_dist1,mult_asso2,numeric,num_mult_c,add_asso2,mult_comm,mult_one1]
    ],
    
    % E2
    
    [
      [xint,[[x,*,[xexp,^,x]],*,[d,x]]],
      [[[x,*,[xexp,^,x]],-,[xexp,^,x]],+,sp_c],
      [mult_asso1,dsubsexp,lne,power_one,mult_asso2,mult_one1,intbyparts,iexp,lne,power_one,mult_comm,mult_one1,add_comm,minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso2,minus_to_plus2,num_mult_c]
    ],
    
    % E3
    
    [
      [xint,[[[x,^,2],*,[xexp,^,x]],*,[d,x]]],
      [[[[[x,^,2],*,[xexp,^,x]],-,[2,*,[x,*,[xexp,^,x]]]],+,[2,*,[xexp,^,x]]],+,sp_c],
      [mult_asso1,dsubsexp,lne,power_one,mult_asso2,mult_one1,intbyparts,dextpower,numeric,power_to_mult3,mult_asso2,mult_comm,mult_asso1,imultconst,mult_asso1,dsubsexp,lne,power_one,mult_asso2,mult_one1,intbyparts,iexp,lne,power_one,mult_comm,mult_one1,add_comm,minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso2,minus_to_plus2,num_mult_c,minus_to_plus1,mult_asso2,numeric,minus_to_plus1,mult_dist1,num_mult_c,mult_dist1,mult_asso2,numeric,add_asso1,add_asso2,plus_to_minus1,add_asso2,mult_asso2,numeric]
    ],
     
    [
      [xint,[[[p,^,2],*,[xexp,^,p]],*,[d,p]]],
      [[[[[p,^,2],*,[xexp,^,p]],-,[2,*,[p,*,[xexp,^,p]]]],+,[2,*,[xexp,^,p]]],+,sp_c],
      [mult_asso1,dsubsexp,lne,power_one,mult_asso2,mult_one1,intbyparts,dextpower,numeric,power_to_mult3,mult_asso2,mult_comm,mult_asso1,imultconst,mult_asso1,dsubsexp,lne,power_one,mult_asso2,mult_one1,intbyparts,iexp,lne,power_one,mult_comm,mult_one1,add_comm,minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso2,minus_to_plus2,num_mult_c,minus_to_plus1,mult_asso2,numeric,minus_to_plus1,mult_dist1,num_mult_c,mult_dist1,mult_asso2,numeric,add_asso1,add_asso2,plus_to_minus1,add_asso2,mult_asso2,numeric]
    ],

   
    [
      [xint,[[[r,^,2],*,[xexp,^,r]],*,[d,r]]],
      [[[[[r,^,2],*,[xexp,^,r]],-,[2,*,[r,*,[xexp,^,r]]]],+,[2,*,[xexp,^,r]]],+,sp_c],
      [mult_asso1,dsubsexp,lne,power_one,mult_asso2,mult_one1,intbyparts,dextpower,numeric,power_to_mult3,mult_asso2,mult_comm,mult_asso1,imultconst,mult_asso1,dsubsexp,lne,power_one,mult_asso2,mult_one1,intbyparts,iexp,lne,power_one,mult_comm,mult_one1,add_comm,minus_to_plus1,add_comm,add_comm,add_comm,mult_dist1,add_asso2,minus_to_plus2,num_mult_c,minus_to_plus1,mult_asso2,numeric,minus_to_plus1,mult_dist1,num_mult_c,mult_dist1,mult_asso2,numeric,add_asso1,add_asso2,plus_to_minus1,add_asso2,mult_asso2,numeric]
    ]


  ].




