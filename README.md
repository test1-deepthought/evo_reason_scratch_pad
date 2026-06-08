# evo_reason_scratch_pad

**EVO REASON Tier persistent workspace.** This repository stores Prolog knowledge bases for [EVO](https://github.com/machinelearning2014/artificial_mind) (Explicit-assumption Verification Orchestrator) REASON-tier tasks.

## Purpose

REASON tasks (multi-step inference, philosophical analysis, strategic reasoning) build Prolog KBs with observations, assumptions, conclusions, proof traces, and assumption-dependence classifications. This repo persists those KBs across turns, creating a library of reusable reasoning modules.

## Structure

```
kb/
  <topic>/
    setup.pl       # problem_spec, observations, assumptions
    rules.pl       # inference rules
    conclusions.pl # conclusion/1 with prove/2 traces
    harness.pl     # prove/2, active_assumption/1, inconsistent/0, solved/2
```

## How EVO Uses This Repo

### Workflow

1. **R1 Setup:** EVO writes the initial KB to a feature branch
2. **R2 Derive:** EVO derives conclusions via `prolog_exec` in its session
3. **R3 Consistency:** EVO checks `inconsistent/0`
4. **R4 Assumptions:** EVO runs retract/assert dependence tests
5. **R5-R6:** EVO validates and answers, persisting the final KB state

### Branch convention

```
evo/reason-<topic>-<YYYYMMDD-HHMMSS>
```

### validate stage

Dispatches the `swipl-check.yml` workflow which loads every `.pl` file on the branch with `swipl -q -t halt` and reports pass/fail. A KB that fails to load cleanly cannot be used for REASON derivations.

## swipl CI

The CI uses the official SWI-Prolog Docker image. It runs `swipl` on every `.pl` file to verify the KB loads without syntax errors, missing predicates, or initialization failures.
