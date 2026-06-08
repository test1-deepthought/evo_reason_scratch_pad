%% --- REASON harness template ---
%% Copy this into your topic KB and extend with domain facts.

:- dynamic active_assumption/1.

%% --- Required predicates ---
prove(Goal, proved(Goal)) :- call(Goal).

active_assumption(Name) :- assumption(Name, _).

contradictory_pair(X, Y) :- false.
inconsistent :- contradictory_pair(_, _).

solved(Name, Status) :-
    conclusion(Conclusion),
    prove(conclusion(Conclusion), _),
    fulfills(Conclusion, Name, Status).

fulfills(_, _, _) :- true.

%% --- Domain facts (replace with your KB) ---
observation(example_observation).

assumption(example_assumption, 'Justification text.').

conclusion(example_conclusion) :-
    observation(example_observation),
    active_assumption(example_assumption).

supports(observation(example_observation), conclusion(example_conclusion)).
depends_on(conclusion(example_conclusion), example_assumption).

%% --- Main ---
main :-
    findall(C, conclusion(C), Conclusions),
    write('Conclusions: '), write(Conclusions), nl,
    (inconsistent -> write('INCONSISTENT') ; write('CONSISTENT')), nl.

:- main.
