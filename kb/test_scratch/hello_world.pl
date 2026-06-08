%% --- Test KB: Hello World for REASON tier scratch pad ---
:- dynamic active_assumption/1.

prove(Goal, proved(Goal)) :- call(Goal).

observation('The sky appears blue during a clear day.').
observation('The grass is green in a healthy field.').

active_assumption(assumption_light).
assumption(assumption_light, 'Light from the sun contains all visible wavelengths, and Rayleigh scattering makes the sky appear blue.').

conclusion('The sky is blue') :-
    observation('The sky appears blue during a clear day.').

conclusion('The grass is green') :-
    observation('The grass is green in a healthy field.').

contradictory_pair(X, Y) :- false.

inconsistent :-
    contradictory_pair(_, _).

solved(Name, Status) :-
    conclusion(Conclusion),
    prove(conclusion(Conclusion), _Proof),
    fulfills(Conclusion, Name, Status).

main :-
    prove(observation(_), _),
    write('=== REASON Scratch Pad Test ==='), nl,
    findall(Answer-Proof,
            (conclusion(Answer), prove(conclusion(Answer), Proof)),
            Results),
    length(Results, N),
    write('Derived '), write(N), write(' conclusion(s):'), nl,
    forall(member(Answer-Proof, Results),
           (write('  - '), write(Answer), nl,
            write('    Proof: '), write(Proof), nl)),
    (inconsistent ->
        write('KB IS INCONSISTENT'), nl
    ;
        write('KB IS CONSISTENT'), nl),
    write('=== Done ==='), nl.

:- main.
