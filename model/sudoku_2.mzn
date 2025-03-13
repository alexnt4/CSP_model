include "alldifferent.mzn";

% Standard Sudoku Init
int: Base = 3;
int: N = Base * Base;


set of int: Domain = 1..N;
set of int: Brackets = 1..Base;


set of int: Tiles = 1..N*N;
int: digs = ceil(log(10.0,int2float(N))); % digits for output

array[Domain, Domain] of 0..N: pre;
array[Domain, Domain] of var Domain: board;


 
 
% Standard Sudoku constraints
constraint forall(i,j in Domain)(if pre[i,j] > 0 then board[i,j] = pre[i,j] else true endif );
constraint forall (i in Domain) (alldifferent( [ board[i,j] | j in Domain ]) ); 
constraint forall (j in Domain) (alldifferent( [ board[i,j] | i in Domain ]) ); 
constraint forall (yi, yj in Brackets)
            (alldifferent([ board[(yi-1)*Base + xi, (yj-1)*Base + xj]|xi, xj in Brackets ]));




%solve :: int_search(board, first_fail, complete) satisfy;
%solve :: int_search(board, smallest, complete) satisfy;
%solve :: int_search(board, input_order, complete) satisfy;

