# Scope problem — facilitation reference

Detailed process descriptions for each facilitation technique available in `/scope-problem`. The agent uses this reference to guide conversations. All techniques are adapted from the Ideas Centre methodology for use in a text-based conversational format.

Source materials: `references/idea_centre/scoping/` and `references/idea_centre/problem/`.

---

## Key adaptations from workshop to agent

These apply to all techniques:

- **Physical diagrams become markdown.** Cause maps, bootlace diagrams, and boundary tables are rendered as indented lists or tables in markdown.
- **"Don't let the Problem Owner take the pen."** The agent leads the divergent phase, presenting provocations and suggestions rather than passively waiting for the user to drive. The agent holds the structure.
- **Phase transitions are named explicitly.** The agent says "We're now moving from divergent mapping to convergent selection" so the user understands the shift.
- **Energy management becomes pacing.** In a workshop the facilitator reads body language. In text, the agent monitors for short/disengaged answers and responds by offering provocations, changing angle, or summarising progress.
- **The Problem Owner is always ultimately correct.** The agent challenges, but defers. The user selects the real issue.

---

## Technique 1: Multiple-Cause Analysis (default)

**Source:** `references/idea_centre/scoping/A Simple Guide to Multiple-Cause Analysis.pdf`
**Duration:** ~20 minutes
**Best for:** Finding root causes. Revealing that the "true" problem is fundamentally different from the initial issue.

### Process

**Step 1 — Establish the issue.**
Take the opportunity statement from the ODD or ask the user to state the problem. Frame it neutrally. Write it as the starting point of the cause map.

**Step 2 — Map causes downward.**
Ask: "What are the problems that sit below and contribute to this?"

For each cause:
- Write it into the cause map
- Treat it as a fresh effect — ask what sits below it
- Repeat for 2-3 levels deep

Guardrails:
- Include all suggested factors, even ones the Problem Owner doubts. Challenging set patterns is critical.
- If the user stalls, offer provocations: "Could [X] be a factor? What about the way [Y] works today?"
- Keep the map visible — present the growing hierarchy after each round.

**Step 3 — Map causes upward.**
Ask: "Is there a higher-order issue above the initial one? What if this problem is itself a symptom of something larger?"

The original focus becomes a cause of a higher-order effect. Explore what that effect is.

**Step 4 — Review.**
Present the complete cause map. Name the transition: "We've finished mapping. Let's look at the full picture and decide where the real leverage is."

**Step 5 — Converge.**
Ask: "Which of these is the most significant or real issue? If you could only address one, which would make the others easier or irrelevant?"

The Problem Owner selects. The agent challenges if they disagree ("I'd push back — [cause X] seems to underpin several of the others. What's your reasoning?") but the user's choice stands.

**Step 6 — Reframe.**
Write a refined problem statement based on the selected issue. Update the ODD.

### Example

Initial issue: "We need to increase trader adoption of the new platform."

Cause map:
```
Higher-order: Platform ROI is below target
└── Traders aren't adopting the new platform
    ├── Onboarding is confusing
    │   ├── Documentation is outdated
    │   └── No guided setup flow
    ├── Key workflows are slower than the old system
    │   └── Latency in order placement
    ├── Traders don't trust the new platform's reliability
    └── No incentive to switch — old platform still works
```

Selected real issue: **Key workflows are slower than the old system** — if fixed, trust and adoption follow.

---

## Technique 2: Boundary Examination

**Source:** `references/idea_centre/problem/A Simple Guide to Boundary Examination.pdf`
**Duration:** ~20-25 minutes
**Best for:** Reframing problems by examining hidden assumptions in the language used to describe them. Surfaces blindspots in how the problem is framed.

### Process

**Step 1 — State the problem.**
Ask the user to express the problem as a simple sentence starting with "How do...?" Aim for ~8 words. Watch for "and" (suggests two problems) or "by" (suggests a partial solution is already embedded).

**Step 2 — Identify key words.**
Underline/highlight the key words in the problem statement (ignoring "How" and "do"). Present them to the user.

**Step 3 — Brainstorm around each word.**
For each key word, brainstorm alternative meanings, synonyms, related concepts, and provocative substitutions — in isolation, ignoring the problem context. This is divergent thinking. Include odd words that trigger new thinking.

Present as a table:

| Key word | Alternatives |
|----------|-------------|
| [word 1] | [alt 1], [alt 2], [alt 3], ... |
| [word 2] | [alt 1], [alt 2], [alt 3], ... |

**Step 4 — Show how the problem changes.**
Demonstrate how substituting words from the brainstorm lists creates entirely different problems. Show 3-5 variants.

**Step 5 — Redefine.**
Ask the user to redefine using the format: "In what way might I...?" This phrasing avoids patterning and invites future thinking. Push them beyond "the world of what is" into "the world of what might be" — make it powerful, challenging, unconstrained by current reality.

**Step 6 — Challenge and confirm.**
Test the redefinition. Others (or the agent) challenge, but the Problem Owner has final say. The fresh definition becomes the "Problem as Understood."

---

## Technique 3: Boot-Lace Analysis

**Source:** `references/idea_centre/problem/A Simple Guide to Boot-Lace Analysis.pdf`
**Duration:** ~10-20 minutes
**Best for:** Deep 1-on-1 problem scoping through progressive abstraction. Reveals that the real issue may be several levels above the stated problem.

### Process

**Step 1 — State the core issue.**
Write the problem at the bottom of the "bootlace."

**Step 2 — Propose an intermediate impossible.**
The agent proposes a novel, even absurd, solution that would definitely solve the problem if it were possible. This is the agent's role — suspension of judgment. Example: "What if every trader had a dedicated AI that already knew their preferences?"

**Step 3 — Identify the main problem with that solution.**
Ask: "What's the main problem with this solution?" The user applies judgment. Write it on the left side of the bootlace.

**Step 4 — Repeat.**
The new problem becomes the starting point. Propose another intermediate impossible for it. Ask what's wrong with that. Continue for 6+ cycles, increasing in abstraction.

**Step 5 — Review the bootlace.**
Present the full chain of problems and impossible solutions. The pattern reveals the real issue — usually several levels above the original.

Present as an alternating list:
```
Problem: [highest-level problem identified]
  Impossible solution: [proposed solution]
Problem: [next problem]
  Impossible solution: [proposed solution]
...
Problem: [original stated problem]
```

**Step 6 — Select the real issue.**
The user identifies which level represents the real problem to solve. Reframe as "How can...?" format.

### Key dynamics

- **Left side (problems):** The user leads. This is judgment — evaluating what's wrong.
- **Right side (impossible solutions):** The agent leads. This is suspension of judgment — creative, even absurd.
- The alternation between judgment and creativity is what drives the progressive abstraction.

---

## Technique 4: Multiple-Questioning

**Source:** `references/idea_centre/problem/Multiple-Questioning - Guides.pdf`
**Duration:** ~20 minutes
**Best for:** Systematic clarification of a problem from five dimensional perspectives. Good when the problem is stated but poorly understood.

### Process

Walk through five dimensions, asking 2-3 questions per dimension. Adapt based on the problem — not every question applies to every problem.

**Substantive — What is being affected?**
- Is this about more or less of something? (Dig for substance: sales? profit? efficiency? satisfaction?)
- Is it an attitude, a behaviour, or a deed? (Deed = tangible action; attitude = intangible; behaviour = manifestation)
- Are we describing ends or means? (People express problems by means — "more marketing" — when they want ends — "more revenue")

**Spatial — Where is it?**
- Is this local or distant? (On your doorstep = understanding/control; distant = control issue)
- Is it a particular location, or widespread?

**Temporal — When is it?**
- Is this long-standing or recent? (Long-standing = conventional thinking has failed, need creative approaches)
- Is it constant or does it ebb and flow?

**Quantitative — How much?**
- Is it a singular problem or multiple intertwined elements?
- How many people are involved? (More people = more complexity)
- Is the issue described generically or specifically? (Generic expressions hide specifics)

**Qualitative — What kind?**
- Is this a matter of survival or enrichment? (Vital vs. nice-to-have)
- What values are being violated, and how severely?
- Is this visible or invisible? (Open manifestation vs. hidden perception)

After all five dimensions, summarise the refined understanding and write a clearer problem statement.
