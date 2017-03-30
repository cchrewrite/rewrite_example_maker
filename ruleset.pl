
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

    % X - Y => X + (-Y)
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

    % d(A^X)/d(X) => e^X
    [dexp,[xdiv,[xder,[xpower,A,X]],[xder,X]],[xmult,[xpower,A,X],[xln,A]]],

    % d(sin(X))/d(X) => cos(X)
    [dsin,[xdiv,[xder,[xsin,X]],[xder,X]],[xcos,X]],

    % d(tan(X))/d(X) => sec(X) * sec(X)
    [dtan,[xdiv,[xder,[xtan,X]],[xder,X]],[xmult,[xsec,X],[xsec,X]]],

    % d(sec(X))/d(X) => sec(X) * tan(X)
    [dsec,[xdiv,[xder,[xsec,X]],[xder,X]],[xmult,[xsec,X],[xtan,X]]],

    % d(Y)/d(X) => (d(Y)/d(U))*(d(U)/d(X))
    [dchain1,[xdiv,[xder,Y],[xder,X]],[xmult,[xdiv,[xder,Y],[xder,U]],[xdiv,[xder,U],[xder,X]]]]

  ].


