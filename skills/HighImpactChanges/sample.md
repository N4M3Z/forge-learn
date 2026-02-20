# Sample: /HighImpactChanges

## Basic Usage

```
/HighImpactChanges Review the Q3 product brief before I send it to the board
```

## With Audience Context

```
/HighImpactChanges Review [[Project Plan]] — audience is the CTO and VP Engineering, they need to approve headcount
```

## Multi-Document Review

```
/HighImpactChanges Go over the design doc, research findings, and recommendation — these go to the full leadership team tomorrow
```

## Example Output

```
### 10 High-Impact Changes

**1. Add cost estimate** (Design Doc, Implementation Plan)
The plan asks for 3-4 engineers over 3 phases but never states the total investment.
Finance can't approve what they can't price. Add: "~$Xm over 2 years, breakeven ~18 months."

**2. Flag the privacy trade-off as a CEO decision** (Design Doc, MoR section)
The MoR option is presented as a technical choice, but it means a third party sees
customer purchase data. For a privacy company, this is an existential brand question.
Add an explicit "requires values decision at CEO level" callout.

...8 more changes...
```
