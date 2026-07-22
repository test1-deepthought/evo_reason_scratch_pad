%% Model Knowledge: LLM Architecture and Capabilities relative to AGI
%% Acquired via model_knowledge capability (R2)
%% Date: 2026-07-22

acquired_fact(model_knowledge,
    'LLMs are autoregressive next-token predictors trained on text corpora via self-supervised learning. Core architecture: Transformer with self-attention (Vaswani et al. 2017).').

acquired_fact(model_knowledge,
    'LLMs operate via pattern matching on statistical regularities in training data, not via logical deduction or causal reasoning. Training objective: token-prediction cross-entropy with no explicit truth or consistency signal.').

acquired_fact(model_knowledge,
    'LLMs have no native persistent memory architecture. Context windows (even at 1M+ tokens) simulate working memory but are bounded, lossy across long sequences, and reset between sessions. No incremental knowledge accumulation across deployments.').

acquired_fact(model_knowledge,
    'LLMs have no native planning or search capability. Chain-of-thought prompting and reasoning models simulate planning via sequential token generation with RL-based process rewards, but this is not equivalent to classical AI planning with state-space search, goal regression, or hierarchical task decomposition.').

acquired_fact(model_knowledge,
    'LLMs lack symbolic grounding (Harnad 1990). Tokens are embedded in a vector space where similarity reflects distributional co-occurrence, not referential connection to objects, states, or events in the physical world. Multi-modal LLMs tokenize images/audio but process them through the same distributional interface.').

acquired_fact(model_knowledge,
    'LLMs exhibit compositional generalization failures (Lake and Baroni 2018). When tested on novel combinations of known primitives, performance degrades, revealing pattern matching rather than systematic compositional grammar.').

acquired_fact(model_knowledge,
    'Scaling laws (Kaplan et al. 2020, Hoffmann et al. 2022 Chinchilla) show cross-entropy loss improves as a power law with model size, dataset size, and compute. However, these laws describe next-token prediction loss, not reasoning capability, truthfulness, or general intelligence. Improvement on downstream benchmarks often shows different scaling behavior.').

acquired_fact(model_knowledge,
    'Post-2024 evidence indicates diminishing returns from scaling. The slope of improvement on reasoning benchmarks has flattened compared to the GPT-2 to GPT-4 era. New data is increasingly synthetic or lower-quality, and compute costs grow super-linearly.').

acquired_fact(model_knowledge,
    'Reasoning models (OpenAI o1/o3, DeepSeek-R1, Gemini Deep Think) represent architectural innovation: test-time compute scaling via reinforcement learning on chain-of-thought traces. This is distinct from training-time scaling and represents a new axis of the scaling paradigm. However, it remains within the autoregressive token-prediction framework.').

acquired_fact(model_knowledge,
    'The ARC (Abstraction and Reasoning Corpus) benchmark, created by Francois Chollet, measures core general intelligence via few-shot visual reasoning tasks requiring no prior knowledge. Until o3, LLMs scored near zero. o3 achieved high scores via test-time program search over token sequences, but this required millions of tokens per task, making it computationally infeasible for real-time general intelligence.').

%% Capability fulfillment tracking
capability_fulfilled(model_knowledge, acquired) :-
    findall(F, acquired_fact(model_knowledge, F), Facts),
    length(Facts, N),
    N >= 10.
