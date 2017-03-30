
rule_set2(RuleSet):-
  RuleSet = [

    % Numeric Simplifier.
    [numeric,[nsnsnsnsns],[snsnsnsnsn]],

    % By Auto.
    [auto,[bababababa],[ababababab]],

    % X = Y => X - Y = 0
    %[move_all_to_left,[xequal,X,Y],[xequal,[xminus,X,Y],0]],

    % Poly Form.
    %[all_to_polynominal,pfpfpfpfpfpf,fpfpfpfpfpfp],

    % X + Y => Y + X
    [add_comm,[xplus,X,Y],[xplus,Y,X]],

    % (X + Y) + Z => X + (Y + Z)
    [add_asso1,[xplus,[xplus,X,Y],Z],[xplus,X,[xplus,Y,Z]]],
    [add_asso2,[xplus,X,[xplus,Y,Z]],[xplus,[xplus,X,Y],Z]],

    % X + Y = Z => X = Z - Y
    [add_trans1,[xequal,[xplus,X,Y],Z],[xequal,X,[xminus,Z,Y]]],
    [add_trans2,[xequal,X,[xminus,Z,Y]],[xequal,[xplus,X,Y],Z]],

    % X - Y => X + (-Y)
    [minus_to_plus1,[xminus,X,Y],[xplus,X,[xmult,[xnum,-1],Y]]],
    [minus_to_plus2,[xplus,X,[xmult,[xnum,-1],Y]],[xminus,X,Y]],

    % --X => X
    %[neg_neg_to_pos,[xneg,[xneg,X]],X],
    %[neg_neg_to_pos,X,[xneg,[xneg,X]]],

    % X = Y => Y = X
    [equal_comm,[xequal,X,Y],[xequal,Y,X]],

    % X * Y => Y * X
    [mult_comm,[xmult,X,Y],[xmult,Y,X]],

    % (X * Y) * Z => X * (Y * Z)
    [mult_asso1,[xmult,[xmult,X,Y],Z],[xmult,X,[xmult,Y,Z]]],
    [mult_asso2,[xmult,X,[xmult,Y,Z]],[xmult,[xmult,X,Y],Z]],

    % X * (Y + Z) => X * Y + X * Z
    [mult_dist1,[xmult,X,[xplus,Y,Z]],[xplus,[xmult,X,Y],[xmult,X,Z]]],
    [mult_dist2,[xplus,[xmult,X,Y],[xmult,X,Z]],[xmult,X,[xplus,Y,Z]]],

    % (X + Y) * Z => X * Z + Y * Z
    [mult_dist3,[xmult,[xplus,X,Y],Z],[xplus,[xmult,X,Z],[xmult,Y,Z]]],
    [mult_dist4,[xplus,[xmult,X,Z],[xmult,Y,Z]],[xmult,[xplus,X,Y],Z]],

    % X * Z + Z => (X + 1) * Z
    [mult_dist5,[xplus,[xmult,X,Z],Z],[xmult,[xplus,X,[xnum,1]],Z]],

    % X * Y = Z => Y = Z / X
    [mult_trans1,[xequal,[xmult,X,Y],Z],[xequal,Y,[xdiv,Z,X]]],
    [mult_trans2,[xequal,Y,[xdiv,Z,X]],[xequal,[xmult,X,Y],Z]],

    % X - Y = Z => X = Y + Z
    [minus_trans1,[xequal,[xminus,X,Y],Z],[xequal,X,[xplus,Y,Z]]],
    [minus_trans2,[xequal,X,[xplus,Y,Z]],[xequal,[xminus,X,Y],Z]]

    % X = Z / Y => X * Y = Z


  ].


rule_set3(RuleSet):-
  RuleSet = [

    % numeric simplifier
    [numeric,nsnsnsnsns,snsnsnsnsn],

    % By Auto
    [auto,bababababa,ababababab],

    % X/X => 1
    [div_to_1,[xdiv,X,X],[xnum,1]],

    % X + 0 => X
    [plus_zero1,[xplus,X,[xnum,0]],X],

    % X * 0 => 0
    [mult_zero1,[xmult,X,[xnum,0]],[xnum,0]],

    % X * 1 => X
    [mult_one1,[xmult,X,[xnum,1]],X],

    % X + Y => Y + X
    [add_comm,[xplus,X,Y],[xplus,Y,X]],

    % X * Y => Y * X
    [mult_comm,[xmult,X,Y],[xmult,Y,X]],

    % (X * Y) * Z => X * (Y * Z)
    [mult_asso1,[xmult,[xmult,X,Y],Z],[xmult,X,[xmult,Y,Z]]],
    [mult_asso2,[xmult,X,[xmult,Y,Z]],[xmult,[xmult,X,Y],Z]],


    % X * (Y + Z) => X * Y + X * Z
    [mult_dist1,[xmult,X,[xplus,Y,Z]],[xplus,[xmult,X,Y],[xmult,X,Z]]],
    [mult_dist2,[xplus,[xmult,X,Y],[xmult,X,Z]],[xmult,X,[xplus,Y,Z]]],

    % (X + Y) * Z => X * Z + Y * Z
    [mult_dist3,[xmult,[xplus,X,Y],Z],[xplus,[xmult,X,Z],[xmult,Y,Z]]],
    [mult_dist4,[xplus,[xmult,X,Z],[xmult,Y,Z]],[xmult,[xplus,X,Y],Z]],


    % X - Y => X + (-Y)
    [minus_to_plus1,[xminus,X,Y],[xplus,X,[xmult,[xnum,-1],Y]]],
    [minus_to_plus2,[xplus,X,[xmult,[xnum,-1],Y]],[xminus,X,Y]],




    % X + Y => X - (-Y)
    [plus_to_minus1,[xplus,X,Y],[xminus,X,[xmult,[xnum,-1],Y]]],

    % X / Y ^ A => X * Y ^ (-A)
    [div_power1,[xdiv,X,[xpower,Y,A]],[xmult,X,[xpower,Y,[xminus,[xnum,0],A]]]],
    %[div_power2,[xmult,X,[xpower,Y,[xminus,[xnum,0],A]]],[xdiv,X,[xpower,Y,A]]],
    
    % X / Y => X * Y ^ (-1)
    [div_power3,[xdiv,X,Y],[xmult,X,[xpower,Y,[xnum,-1]]]],


    % (X ^ A) ^ B => X ^ (A * B)
    [power_asso1,[xpower,[xpower,X,A],B],[xpower,X,[xmult,A,B]]],
    [power_asso2,[xpower,X,[xmult,A,B]],[xpower,[xpower,X,A],B]],

 
    % X ^ (A + B) => (X ^ A) * (X ^ B)
    [power_dist1,[xpower,X,[xplus,A,B]],[xmult,[xpower,X,A],[xpower,X,B]]],
    [power_dist2,[xmult,[xpower,X,A],[xpower,X,B]],[xpower,X,[xplus,A,B]]],

    % X ^ 1 => X
    [power1_elim,[xpower,X,[xnum,1]],X],

    % sin(X) * cos(X) => 0.5 * sin(2 * X)
    [sincos,[xmult,[xsin,X],[xcos,X]],[xmult,[xnum,0.5],[xsin,[xmult,[xnum,2],X]]]],

    % d(C)/d(X) => 0, C is constant.
    [dconst,[xdiv,[xder,[xnum,_]],[xder,X]],[xnum,0]],

    % d(U+V)/d(X) => d(U)/d(X) + d(V)/d(X)
    [dplus1,[xdiv,[xder,[xplus,U,V]],[xder,X]],[xplus,[xdiv,[xder,U],[xder,X]],[xdiv,[xder,V],[xder,X]]]],

    % d(U*V)/d(X) => U * d(V)/d(X) + V * d(U)/d(X)
    [dmult1,[xdiv,[xder,[xmult,U,V]],[xder,X]],[xplus,[xmult,U,[xdiv,[xder,V],[xder,X]]],[xmult,V,[xdiv,[xder,U],[xder,X]]]]],

    % d(X^A)/d(X) => A*X^(A-1)
    [dpower,[xdiv,[xder,[xpower,X,A]],[xder,X]],[xmult,A,[xpower,X,[xminus,A,[xnum,1]]]]],

    % ln(e) => 1
    [lne,[xln,xexp],[xnum,1]],

    % d(ln(X))/d(X) => X ^ (-1)
    [dln,[xdiv,[xder,[xln,X]],[xder,x]],[xpower,X,[xnum,-1]]],

    % d(A^X)/d(X) => e^X
    [dexp,[xdiv,[xder,[xpower,A,X]],[xder,X]],[xmult,[xpower,A,X],[xln,A]]],

    % d(sin(X))/d(X) => cos(X)
    [dsin,[xdiv,[xder,[xsin,X]],[xder,X]],[xcos,X]],

    % d(cos(X))/d(X) => -sin(X)
    [dcos,[xdiv,[xder,[xcos,X]],[xder,X]],[xmult,[xnum,-1],[xsin,X]]],


    % d(tan(X))/d(X) => sec(X) * sec(X)
    [dtan,[xdiv,[xder,[xtan,X]],[xder,X]],[xmult,[xsec,X],[xsec,X]]],

    % d(sec(X))/d(X) => sec(X) * tan(X)
    [dsec,[xdiv,[xder,[xsec,X]],[xder,X]],[xmult,[xsec,X],[xtan,X]]],

    % d(Y)/d(X) => (d(Y)/d(U))*(d(U)/d(X))
    [dchain1,[xdiv,[xder,Y],[xder,X]],[xmult,[xdiv,[xder,Y],[xder,U]],[xdiv,[xder,U],[xder,X]]]]

  ].


rule_set4(RuleSet):-
  RuleSet = [

    % numeric simplifier
    [numeric,nsnsnsnsns,snsnsnsnsn],

    % By Auto
    [auto,bababababa,ababababab],

    % Check Ground
    [check_ground,cgcgcgcgcg,gcgcgcgcgc],

    % X + Y => Y + X
    [add_comm,[xplus,X,Y],[xplus,Y,X]],


    % (X + Y) + Z => X + (Y + Z)
    [add_asso1,[xplus,[xplus,X,Y],Z],[xplus,X,[xplus,Y,Z]]],
    [add_asso2,[xplus,X,[xplus,Y,Z]],[xplus,[xplus,X,Y],Z]],




    % X - Y => X + (-Y)
    [minus_to_plus1,[xminus,X,Y],[xplus,X,[xmult,[xnum,-1],Y]]],
    [minus_to_plus2,[xplus,X,[xmult,[xnum,-1],Y]],[xminus,X,Y]],

    % X + Y => X - (-Y)
    [plus_to_minus1,[xplus,X,Y],[xminus,X,[xmult,[xnum,-1],Y]]],


    % X * Y => Y * X
    [mult_comm,[xmult,X,Y],[xmult,Y,X]],

    % X * 1 => X
    [mult_one1,[xmult,X,[xnum,1]],X],

    % (X * Y) * Z => X * (Y * Z)
    [mult_asso1,[xmult,[xmult,X,Y],Z],[xmult,X,[xmult,Y,Z]]],
    [mult_asso2,[xmult,X,[xmult,Y,Z]],[xmult,[xmult,X,Y],Z]],


    % X * (Y + Z) => X * Y + X * Z
    [mult_dist1,[xmult,X,[xplus,Y,Z]],[xplus,[xmult,X,Y],[xmult,X,Z]]],
    [mult_dist2,[xplus,[xmult,X,Y],[xmult,X,Z]],[xmult,X,[xplus,Y,Z]]],



    % P / (X / Y) => P * Y / X
    [divdiv,[xdiv,P,[xdiv,X,Y]],[xdiv,[xmult,P,Y],X]],

    % I(K * d(X)) => K * X + C.
    [iconst,[xint,[xmult,K,[xder,X]]],[xplus,[xmult,K,X],sp_c]],

    % I((U + V) * d(X)) => I(U * d(X)) + I(V * d(X)).
    [iplus,[xint,[xmult,[xplus,U,V],[xder,X]]],[xplus,[xint,[xmult,U,[xder,X]]],[xint,[xmult,V,[xder,X]]]]],

    % I(K * U * d(X)) => K * I(U * d(X)).
    [imultconst,[xint,[xmult,[xmult,K,U],[xder,X]]],[xmult,K,[xint,[xmult,U,[xder,X]]]]],

    % I(X ^ U * d(X)) => 1 / (U + 1) * X ^ (U + 1)
    [ipower,[xint,[xmult,[xpower,X,U],[xder,X]]],[xplus,[xmult,[xdiv,[xnum,1],[xplus,U,[xnum,1]]],[xpower,X,[xplus,U,[xnum,1]]]],sp_c]],

    % I(A ^ X * d(X)) => A ^ X / ln(A)
    [iexp,[xint,[xmult,[xpower,A,X],[xder,X]]],[xplus,[xmult,[xpower,[xln,A],[xnum,-1]],[xpower,A,X]],sp_c]],

    % I(X ^ -1 * d(X)) => ln(abs(X))
    [ipowerneg1,[xint,[xmult,[xpower,X,[xnum,-1]],[xder,X]]],[xplus,[xln,[xabs,X]],sp_c]],

    % I(sin(X) * d(X)) => -1 * cos(X)
    [isin,[xint,[xmult,[xsin,X],[xder,X]]],[xplus,[xmult,[xnum,-1],[xcos,X]],sp_c]],

    % I(cos(X) * d(X)) => sin(X)
    [icos,[xint,[xmult,[xcos,X],[xder,X]]],[xplus,[xsin,X],sp_c]],


    % ln(e) => 1
    [lne,[xln,xexp],[xnum,1]],

    % I(U * d(X)) => 1 / K * I(U * d(K * X))
    [isubsconst,[xint,[xmult,U,[xder,X]]],[xmult,[xdiv,[xnum,1],K],[xint,[xmult,U,[xder,[xmult,K,X]]]]]],

    % I(U * d(X)) => K * I(U * d(X / K))
    [isubsdivconst,[xint,[xmult,U,[xder,X]]],[xmult,K,[xint,[xmult,U,[xder,[xdiv,X,K]]]]]],



    % I(U * d(X)) => -1 * I(U * d(C - X))
    [isubsminus,[xint,[xmult,U,[xder,X]]],[xmult,[xnum,-1],[xint,[xmult,U,[xder,[xminus,_,X]]]]]],

    % I(U * d(X)) => -1 * I(U * d(-1 * X))
    [isubsneg,[xint,[xmult,U,[xder,X]]],[xmult,[xnum,-1],[xint,[xmult,U,[xder,[xmult,[xnum,-1],X]]]]]],

    % I(U * d(V)) => U * V - I(V * d(U))
    [intbyparts,[xint,[xmult,U,[xder,V]]],[xminus,[xmult,U,V],[xint,[xmult,V,[xder,U]]]]],

    % d(X^A) => A*X^(A-1) * d(X)
    [dextpower,[xder,[xpower,X,A]],[xmult,[xmult,A,[xpower,X,[xminus,A,[xnum,1]]]],[xder,X]]],

    % X ^ U * d(X) => 1 / (U + 1) * d(X ^ (U + 1))
    [dsubspower,[xmult,[xpower,X,U],[xder,X]],[xmult,[xdiv,[xnum,1],[xplus,U,[xnum,1]]],[xder,[xpower,X,[xplus,U,[xnum,1]]]]]],

    
    % A ^ X * d(X) => d(A ^ X) / ln(A)
    [dsubsexp,[xmult,[xpower,A,X],[xder,X]],[xmult,[xpower,[xln,A],[xnum,-1]],[xder,[xpower,A,X]]]],

    % X ^ d(X) => 0.5 * d(X ^ 2)
    [dsubsx,[xmult,X,[xder,X]],[xmult,[xnum,0.5],[xder,[xpower,X,[xnum,2]]]]],

    % cos(X) * d(X) => d(sin(X))
    [dsubscos,[xmult,[xcos,X],[xder,X]],[xder,[xsin,X]]],



    % X ^ U * X => X ^ (U + 1)
    [multpowersimp1,[xmult,[xpower,X,U],X],[xpower,X,[xplus,U,[xnum,1]]]],

    % 1 ^ A => 1
    [power_one,[xpower,[xnum,1],_],[xnum,1]],

    % (X ^ A) ^ B => X ^ (A * B)
    [power_asso1,[xpower,[xpower,X,A],B],[xpower,X,[xmult,A,B]]],
    %[power_asso2,[xpower,X,[xmult,A,B]],[xpower,[xpower,X,A],B]],


    % X ^ (A + B) => (X ^ A) * (X ^ B)
    %[power_dist1,[xpower,X,[xplus,A,B]],[xmult,[xpower,X,A],[xpower,X,B]]],
    [power_dist2,[xmult,[xpower,X,A],[xpower,X,B]],[xpower,X,[xplus,A,B]]],

    % (X * Y) ^ A => X ^ A * Y * A
    [power_dist3,[xpower,[xmult,X,Y],A],[xmult,[xpower,X,A],[xpower,Y,A]]],

    % X / Y ^ A => X * Y ^ (-A)
    [div_power1,[xdiv,X,[xpower,Y,A]],[xmult,X,[xpower,Y,[xminus,[xnum,0],A]]]],
    %[div_power2,[xmult,X,[xpower,Y,[xminus,[xnum,0],A]]],[xdiv,X,[xpower,Y,A]]],

    % X / Y => X * Y ^ (-1)
    [div_power3,[xdiv,X,Y],[xmult,X,[xpower,Y,[xnum,-1]]]],

    % X ^ 2 => X * X
    [square_to_mult1,[xpower,X,[xnum,2]],[xmult,X,X]],
    [square_to_mult2,[xmult,X,X],[xpower,X,[xnum,2]]],

    % X ^ A => X ^ (A - 1) * X
    %[power_to_mult1,[xpower,X,A],[xmult,[xpower,X,[xminus,A,[xnum,1]]],X]],
    %[power_to_mult2]

    % X ^ 1 => X
    [power_to_mult3,[xpower,X,[xnum,1]],X],

    % 2 * X => X + X
    %[mult_two1],
    [mult_two2,[xplus,X,X],[xmult,[xnum,2],X]],

    % Special Rule 1
    [sprule1,[xplus,[xmult,N,[xpower,M,[xnum,-1]]],[xnum,1]],[xdiv,[xplus,M,N],M]],
    [sprule2,[xmult,[xnum,X],Y],[xmult,[xnum,X],[xpower,Y,[xnum,1]]]],
    [sprule3,[xmult,[xdiv,[xnum,1],X],[xnum,-1]],[xdiv,[xnum,-1],X]],


    % Sp Const Rule
    [mult_c,[xmult,_,sp_c],sp_c],
    [num_mult_c,[xmult,[xnum,_],sp_c],sp_c],
    [c_plus_c,[xplus,sp_c,sp_c],sp_c]

  ].

