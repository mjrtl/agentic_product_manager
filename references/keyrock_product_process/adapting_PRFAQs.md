From PR-FAQs to Opportunity Briefs + Product Definitions

It's not a secret: PR-FAQs are sometimes a clunky match for what we do. What can we change?
+ We want to record the value outcome we want to effect
+ We want to keep the working backwards approach and have a definition of the final output
- We do not want clunky language that only suits external products
- We do not want to reduce definitions to a PRD style set of static features / data / performance requirements

---------------------------------
From Static to Behavioural:

Traditional PRD Requirement

"The system must have a 'Save' button that triggers a success notification."
"Users must be able to filter search results by date and category."


I call these remote-control development. They are explicit in their design instruction and, as a previous developer, I would say   - don't tell me the solution. Tell me the outcome. If you don't, I might create a save button that notifies the user, but doesn't save anything. Or a filter that filters by 20 non-optional categories you must select. Ok maybe not - but you get the point.

Behaviour-Led User Story

"To prevent data loss, a user needs their progress saved automatically or via a clear action, with immediate confirmation that their work is secure."
"To find relevant information quickly, a user needs to narrow down large datasets based on when they were created and what they relate to."


structure:
To [get outcome], a user needs [state change, user communication, and abstract 'effect' - what do we want done/known]



Why this works
Context:

 The team (PM/DM/Eng/Architects/QA) understands why the feature exists (e.g., preventing data loss).
Flexibility: It allows designers to suggest "Auto-save" instead of just a "Save" button. It gives Engineering flexibility to think and experiment around the problem
Validation: Success is measured by the user feeling "secure," [an effect] - not just by a button existing.


 this outcome will be perceived as a flexible scope for engineering and will result in good, evolving product design. It will communicate what to test for QA, and why something is proposed to architecture.

----------------------------------------------------------
Structuring Opportunity from Product Behaviour

Opp-Brief
- OST / Proposed product outlines / Miro
- User research
- Product Definition (Hypothesis)
- - Product Behaviours (addendums increase as time goes on)

Buy documenting the Opportunity separately, we will have covered the problem-space. We can attached an opportunity solution tree, or a strategic initiative, from Product Marketing, for example.
Underneath this document we can record the Product Definition - the content here will be identical to the structure of the PR-FAQ but we should add further behaviour / feature-outline documents as time goes on and we need to make changes.8 repliesKushal  [10:20 AM]
Sometimes people think docs are all over the place - but remember, you can cross-link docs from another team's (e.g. Architecture) area into a page in this file heirarchy.
Miquel Lopez  [10:39 AM]
My 2 cents on this (as you know already)

Naming
People might call those Opp Briefs PRDs. We call them product overviews in platform, happy to rename. But modern PRDs are focused on outcome, user value, etc. so the R (requirement) in PRD loses meaning but people still call it that.

I think Linear had a funny name for those @Ronak?

A key tool to align and glue other docs
Those docs become mega powerful when used together in go/no-go sessions. All key stakeholders (your users, your team, architecture, whoever) are there and leave with a shared understanding on why/what are we solving and a first idea on the how.

They also help linking to other docs (say architectural proposal, schema details, whatever).

I'd love to have a x-BU session where we all share what we do btw  I.e: I borrowed part of Strat MM's lifecycle document as it was covering 80% of what we do with subtle differences.
Kushal  [10:57 AM]
Those docs become mega powerful when used together in go/no-go sessions.
Ronak  [1:23 PM]
we called them Opportunity Discovery Docs (ODDs) because we used to run "Betting Tables" to prioritise things and I found myself funny.

Open to calling them whatever makes sense though.
[1:24 PM]we are still using Opportunity Discovery Docs and they are a stripped back version of PRFAQs - but let's align / use the same thing
Miquel Lopez  [1:26 PM]
Odd! 
Ronak  [1:30 PM]
could we discuss

what are the ceremonies people are using to build / keep these up to date
how regularly are they reviewed / in which forum and by which stakeholders


to me this is the more difficult part of succeeding to implement these as a standard process, once the team size scales
Miquel Lopez  [4:02 PM]
+1

The aim shouldn't be to standardise every specific or force a naming conventions. The key is simply sharing what we do... what works and, more importantly, what doesn't.

If we learn from each other, things will likely unify naturally. We'll end up adopting the wins and killing off what fails.
And once that happens it'll create predictability.