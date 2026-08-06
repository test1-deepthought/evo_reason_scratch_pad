% Test Prolog KB for reason_scratch_pad validation
problem_spec('REASON scratch pad test').
observation('reason_scratch_pad', 'write', 'tested').
conclusion(c1) :- observation('reason_scratch_pad', 'write', 'tested').
conclusion_text(c1, 'reason_scratch_pad write stage succeeded.').
