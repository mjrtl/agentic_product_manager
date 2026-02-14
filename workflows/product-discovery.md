# Product discovery workflow

This workflow covers **product discovery** from a new initiative idea through validated opportunities and tested assumptions. It follows **Continuous Discovery Habits (CDH)** principles (continuous interviewing, weekly touchpoints, evidence over opinion) while staying pragmatic for Keyrock.

## Where this lives

- **Initiative workspace:** `initiatives/[name]/`
- **Intake/scoping outputs:** `initiatives/[name]/0-intake-and-scoping/`
- **Discovery outputs:** `initiatives/[name]/1-discovery/`

## Discovery pipeline (pragmatic sequence)

```
Setup → Interviews → Snapshots → Synthesis → Opportunities (OST) → Solutions → Assumptions & tests
```

## Stage 0: Setup initiative (ODD + gate + scaffold)

**Skill:** `/setup-initiative`  
**Primary outputs:**
- `0-intake-and-scoping/0.1-odd/opportunity-discovery-doc.md` (ODD)
- `0-intake-and-scoping/0.3-exec-summary.md` (gate verdict + what’s next)
- `1-discovery/1.1-discovery-context-and-plan/discovery_context.md` (JTBD + problem snapshot + process pointer)
- `00-stage-map.md` (numbered “what’s next”)

**Entry criteria:** A new initiative idea (can be vague)  
**Exit criteria:** ODD exists, gate verdict reached (PROCEED/REFINE), initiative scaffolded

**Notes on structure (pragmatic defaults):**
- Keep supporting docs in `1-discovery/1.6-evidence/` (avoid generic `reference/` naming).
- Use `00-stage-map.md` to make “what happens next” obvious for humans.

## Stage 1: Conduct interviews and create snapshots

**Skill:** `/interview-snapshot`  
**Output:** `1-discovery/1.2-user-interviews/snapshots/snapshot-[participant]-[date].md`

**Entry criteria:** Research goal defined; participants recruited  
**Exit criteria:** 3–5+ interview snapshots

**Best-practice guardrails (CDH, simplified):**
- Focus on **concrete behaviour** (what they did, when, with what workarounds).
- Capture **quotes** and specific moments (surprise, frustration, risk).
- Keep a weekly cadence: at least **1 touchpoint per week** with users/stakeholders.

## Stage 2: Synthesize patterns

**Skill:** `/synthesize-interviews`  
**Output:** `1-discovery/1.2-user-interviews/synthesis/synthesis-[initiative]-v[N].md`

**Entry criteria:** 3–5+ snapshots  
**Exit criteria:** Synthesis doc with patterns, experience map, and research gaps

**Best-practice guardrails:**
- Synthesis is incremental; don’t rewrite history—version it.
- Separate **signals** (what we observed) from **interpretation** (what we think it means).

## Stage 3: Create opportunities (OST)

**Skill:** `/create-opportunities`  
**Output:** `1-discovery/1.3-opportunities/[topic]/opportunities-[topic]-v[N].md`

**Entry criteria:** Snapshots or synthesis  
**Exit criteria:** Prioritized opportunities with a target opportunity selected

**Best-practice guardrails:**
- Keep opportunities **problem-shaped**, not solution-shaped.
- Use explicit comparison criteria (impact, confidence, ease/constraints, strategic alignment).

## Stage 4: Generate solutions (exploration)

**Skill:** `/generate-solutions`  
**Output:** `1-discovery/1.4-solutions/[topic]/solutions-[topic]-v[N].md`

**Entry criteria:** Clear target opportunity  
**Exit criteria:** Top 3 candidate solution directions + rationale

**Best-practice guardrails:**
- Generate diversity first; converge later.
- Make “no-build / process / policy” options explicit where relevant.

## Stage 5: Identify and test assumptions

**Skill:** `/test-assumptions`  
**Output:** `1-discovery/1.5-assumptions-and-tests/[topic]/assumptions-[opportunity]-v[N].md`

**Entry criteria:** Target opportunity + solution directions  
**Exit criteria:** Max 3 Leap-of-Faith assumptions with test cards and results

**Best-practice guardrails:**
- Test the **riskiest** assumptions first (viability/feasibility often dominate in internal tooling).
- Prefer the smallest viable simulation with clear pass/fail criteria.

## Optional: Scope refinement

If the initiative is still fuzzy after the ODD, run scoping explicitly.

**Skill:** `/scope-problem`  
**Outputs:** Updates the ODD; may create scoping artifacts under `0-intake-and-scoping/0.2-scoping-artifacts/`

## Exec checkpoint (recommended)

To keep discovery exec-ready, maintain:

- `0-intake-and-scoping/0.3-exec-summary.md` (gate verdict + what’s next)
- `1-discovery/00-exec-summary.md` (what we learned, decisions, what’s next)
- `1-discovery/1.6-evidence/` (problem statement, risk analysis, business case, discovery plan)

