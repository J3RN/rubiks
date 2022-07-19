solve([Hd | Tl], Count, Available, Matrix) :-
    Count > 0,
    member(Hd, Available),
    rotate(Hd, Matrix, Rotated),
    NewCount is Count - 1,
    allowed(Hd, NextAvailable),
    solve(Tl, NewCount, NextAvailable, Rotated).
solve([], Count, _, Matrix) :-
    Count >= 0,
    solved(Matrix).

solved([[A, A, A, A], [B, B, B, B], [C, C, C, C], [D, D, D, D], [E, E, E, E], [F, F, F, F]]).

allowed(a_cw,  [a_cw, b_cw, b_ccw, c_cw, c_ccw]).
allowed(a_ccw, [a_ccw, b_cw, b_ccw, c_cw, c_ccw]).
allowed(b_cw,  [a_cw, a_ccw, b_cw, c_cw, c_ccw]).
allowed(b_ccw, [a_cw, a_ccw, b_ccw, c_cw, c_ccw]).
allowed(c_cw,  [a_cw, a_ccw, b_cw, b_ccw, c_cw]).
allowed(c_ccw, [a_cw, a_ccw, b_cw, b_ccw, c_ccw]).

rotate(a_cw,
       [[A1, A2, A3, A4], [B1, B2, B3, B4], [C1, C2, C3, C4], [D1, D2, D3, D4], [E1, E2, E3, E4], F],
       [[A4, A1, A2, A3], [C1, C2, B3, B4], [D1, D2, C3, C4], [E1, E2, D3, D4], [B1, B2, E3, E4], F]).
rotate(a_ccw,
       [[A1, A2, A3, A4], [B1, B2, B3, B4], [C1, C2, C3, C4], [D1, D2, D3, D4], [E1, E2, E3, E4], F],
       [[A2, A3, A4, A1], [E1, E2, B3, B4], [B1, B2, C3, C4], [C1, C2, D3, D4], [D1, D2, E3, E4], F]).
rotate(b_cw,
       [[A1, A2, A3, A4], [B1, B2, B3, B4], [C1, C2, C3, C4], D, [E1, E2, E3, E4], [F1, F2, F3, F4]],
       [[E3, A2, A3, E2], [B4, B1, B2, B3], [A1, C2, C3, A4], D, [E1, F4, F1, E4], [C1, F2, F3, C4]]).
rotate(b_ccw,
       [[A1, A2, A3, A4], [B1, B2, B3, B4], [C1, C2, C3, C4], D, [E1, E2, E3, E4], [F1, F2, F3, F4]],
       [[C1, A2, A3, C4], [B2, B3, B4, B1], [F1, C2, C3, F4], D, [E1, A4, A1, E4], [E3, F2, F3, E2]]).
rotate(c_cw,
       [[A1, A2, A3, A4], [B1, B2, B3, B4], [C1, C2, C3, C4], [D1, D2, D3, D4], E, [F1, F2, F3, F4]],
       [[A1, A2, B2, B3], [B1, F1, F2, B4], [C4, C1, C2, C3], [A4, D2, D3, A3], E, [D4, D1, F4, F3]]).
rotate(c_ccw,
       [[A1, A2, A3, A4], [B1, B2, B3, B4], [C1, C2, C3, C4], [D1, D2, D3, D4], E, [F1, F2, F3, F4]],
       [[A1, A2, D4, D1], [B1, A3, A4, B4], [C2, C3, C4, C1], [F2, D2, D3, F1], E, [B2, B3, F3, F4]]).
