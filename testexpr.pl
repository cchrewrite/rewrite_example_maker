
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

    % ==============TRY=============== %

    
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

    % ================================ %

    % 3x + 5 = 17, x = 4
    [
      [[[3,*,x],+,5],=,17],
      [x,=,4],
      []
    ],

    % 12x - 5 = 55, x = 5
    [
      [[[12,*,x],-,5],=,55],
      [x,=,5],
      []
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
      [add_trans1,minus_to_plus1,add_asso1,minus_to_plus2,numeric,mult_comm]
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
    ]/*,


    % (5)
    [
      [[d,[[x,^,2],*,[xln,x]]],/,[d,x]],
      [x,*,[[2,*,[xln,x]],+,1]],
      []
    ],
    
    
    % (6)
    [
      [[d,[[3,*,[xexp,^,x]],*,[xcos,x]]],/,[d,x]],
      [[3,*,[xexp,x]],*,[[xcos,x],-,[xsin,x]]],
      []
    ],
    
    
    % (7)
    [
      [[d,[[xln,x],/,[x]]],/,[d,x]],
      [[1,-,[xln,x]],*,[x,^,-2]],
      []
    ],
    
    
    % (8)
    [
      [[d,[[[xexp,^,x],/,[x,^,2]],+,1.098612]],/,[d,x]],
      [[[xexp,^,x],*,[x,-,2]],*,[x,^,3]],
      []
    ]*/

 
  ].


test_expr4(Expr):-
  Expr = [
    [
      [[d,[x,^,4]],/,[d,x]],
      [4,*,[x,^,3]],
      []
    ]
  ].




