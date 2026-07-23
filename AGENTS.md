# AGENTS.md

# dMAT Practice Pro

## Mission

Build the most accurate, reliable, and comprehensive dMAT preparation platform for APS India applicants preparing for Master's admission in Germany.

The highest priority is:

1. Official accuracy
2. Educational quality
3. Stability
4. Maintainability

NOT feature count.

---

# Current Phase

CONTENT INTEGRATION PHASE

Feature development is considered complete unless explicitly requested.

Do NOT invent new features.

Improve content.

Improve question quality.

Improve explanations.

Improve accuracy.

---

# Golden Rule

Every change must improve one of these:

- Accuracy
- Learning value
- Stability
- Performance

If it doesn't...

Do NOT implement it.

---

# Source Priority

Always prioritize sources in this order.

## Level 1 (Highest)

Official dMAT

Official APS India

Official g.a.s.t.

Official Preparatory Materials

Official Affected Fields PDF

Official Sample Questions

Official Videos

Official FAQs

These sources define:

- Exam rules
- Timing
- Instructions
- Eligibility
- Scoring
- Structure
- Navigation
- Exam behaviour

Never contradict official information.

---

## Level 2

University publications

German university documentation

TestDaF Institute documentation

Academic publications

---

## Level 3

Educational references

Logical reasoning references

Mathematics references

Engineering references

General academic references

Use only to create ORIGINAL educational content.

---

# Never Assume

If official documentation does not specify something,

DO NOT invent it.

Mark it as

"Not specified by official documentation."

---

# UI Rules

Do NOT redesign the application.

Do NOT change layouts.

Do NOT replace components.

Do NOT rename routes.

Do NOT modify navigation.

Do NOT add animations.

Do NOT change colors.

Do NOT redesign cards.

Only change UI when explicitly requested.

---

# Routing Rules

Never modify routes unless fixing a bug.

Never break existing URLs.

Never rename pages.

---

# Authentication Rules

Never bypass authentication.

Never bypass admin guards.

Never hardcode admin.

Never disable RLS.

---

# Database Rules

Never rename existing tables.

Never rename columns.

Never remove migrations.

Never break existing data.

Only extend schema when necessary.

Always create forward-only migrations.

---

# Question Bank

This project must contain a very large ORIGINAL practice question bank.

Every question must include:

- ID
- Module
- Topic
- Subtopic
- Difficulty
- Question
- Options
- Correct answer
- Explanation
- Estimated solving time
- Tags
- Metadata

---

# Question Standards

Every question must:

Be technically correct.

Be logically valid.

Have exactly one correct answer.

Have plausible distractors.

Be free from ambiguity.

Be checked before insertion.

---

# Difficulty Levels

Easy

Medium

Hard

Expert

Difficulty should increase naturally.

---

# Explanations

Every question requires an explanation.

Never leave explanations blank.

Explain:

- Why the correct answer is correct.
- Why other options are incorrect.
- Faster solving strategy.
- Common mistakes.

---

# Question Metadata

Store:

Module

Section

Topic

Subtopic

Difficulty

Estimated Time

Source Type

Status

Created Date

Last Reviewed

Verified

---

# Official Content

Official information belongs in:

Homepage

Instructions

FAQs

Preparation

Exam Rules

Timing

Scoring

Eligibility

Never mix official information with personal advice.

---

# Practice Content

Practice content belongs in:

Question Bank

Mocks

Hints

Strategies

Solutions

Explanations

Clearly distinguish it from official information.

---

# Mock Tests

Mocks should simulate the real examination.

Respect:

Module order

Time limits

Navigation

Instructions

Result calculation

Question randomization

Question distribution

Difficulty balancing

---

# Performance

Always prefer:

Memoization

Lazy loading

Stable rendering

Avoid:

Infinite re-renders

Layout shifts

Duplicate queries

Unnecessary state

---

# Code Quality

Prefer:

Readable code

Small components

Reusable logic

Clear naming

Strong typing

Avoid:

Magic numbers

Unused files

Duplicate logic

Dead code

---

# Debugging Rules

When fixing bugs:

Do NOT redesign.

Do NOT refactor unrelated code.

Find:

Root cause

Exact file

Exact line

Fix only the failing logic.

Verify manually.

---

# Content Integration Workflow

For every new document:

Read completely.

Extract information.

Categorize it.

Identify where it belongs.

Update only relevant sections.

Avoid duplication.

Preserve official wording where appropriate.

---

# Verification Checklist

Before completing any task verify:

✅ No unrelated files modified

✅ No UI regressions

✅ No routing regressions

✅ No authentication regressions

✅ No database regressions

✅ No TypeScript errors

✅ No console errors

✅ Existing functionality still works

---

# Reporting

Every completed task must include:

Root cause (if bug)

Files modified

Reason for modification

Database changes

Content added

Content replaced

Verification steps

Any assumptions made

---

# Forbidden Actions

Never:

- Invent official information.
- Replace official rules with assumptions.
- Bypass security.
- Hardcode permissions.
- Break backwards compatibility.
- Delete working features.
- Redesign without request.
- Modify unrelated files.

---

# Philosophy

This project is an educational platform.

Accuracy is more important than aesthetics.

Correctness is more important than speed.

Quality is more important than quantity.

Every change should make the application a better preparation platform without making it a different application.

