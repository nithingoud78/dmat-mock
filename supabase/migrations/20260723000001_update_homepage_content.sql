-- ==============================================================================
-- Migration: Update Homepage Content with Official dMAT Information
-- Description: Syncs homepage_content table with official APS dMAT rules, timing, 
-- eligibility, and FAQs provided in the comprehensive July 2026 report.
-- ==============================================================================

UPDATE public.homepage_content
SET content = '{
  "hero": {
    "title": "dMAT Practice Pro",
    "subtitle": "Realistic timed mocks, section drills, and analytics for the g.a.s.t. dMAT used in Germany''s APS process.",
    "primary_cta": {"label": "Start Complete Mock", "href": "/mock/complete"},
    "secondary_cta": {"label": "Practice by Section", "href": "/practice/figure-sequences"}
  },
  "what_is_dmat": {
    "title": "What is the dMAT?",
    "body": "The Digital Master Assessment Test (dMAT) is a standardized academic aptitude test for Master''s applicants from India, introduced as an additional element in the APS (Academic Evaluation Service) documentation process starting from 2026. It is administered by g.a.s.t. and evaluated at the TestDaF Institute in Germany."
  },
  "aps_relevance": {
    "title": "Who needs to take the dMAT?",
    "body": "The dMAT is mandatory for Master''s applicants from India (for Summer Semester 2027 intake onwards) whose previous degrees are in Engineering, Commerce, Accounting, Finance, Economics, Business, or Management. PhD applicants, Bachelor''s applicants, and specific exchange program participants are exempt."
  },
  "exam_pattern": {
    "title": "Exam Pattern",
    "rows": [
      {"section": "Core Module: Figure Sequences", "questions": "20", "time": "25 minutes"},
      {"section": "Core Module: Mathematical Equations", "questions": "20", "time": "25 minutes"},
      {"section": "Core Module: Latin Squares", "questions": "20", "time": "25 minutes"},
      {"section": "Subject Module: General Academic", "questions": "Text-based", "time": "90 minutes"},
      {"section": "Full exam", "questions": "Multiple-choice", "time": "Approx 3.5 hours"}
    ],
    "caption": "The Core Module subtests have short 2-minute transitions. A 30-minute break separates the Core Module and the Subject Module. All tasks are single-choice MCQs.",
    "scoring_note": "Scores are scaled from 0-200. German universities independently decide how to use the score and percentile rank."
  },
  "prep_tips": {
    "title": "Preparation Tips",
    "items": [
      "Familiarize yourself with the visual pattern rules: movement, rotation, color change, and boundaries for Figure Sequences.",
      "Master substitution and elimination methods for Mathematical Equations (letters represent integers 1-20).",
      "Develop a systematic approach to grid filling and deductive logic for Latin Squares (5x5 grids).",
      "Note-taking is strictly prohibited throughout the entire exam, so build mental math speed.",
      "Guessing is explicitly encouraged if you are unsure, as there is absolutely no negative marking."
    ]
  },
  "faq": {
    "title": "Frequently Asked Questions",
    "items": [
      {"q": "Is there negative marking?", "a": "No, there is no negative marking. Unanswered and incorrect questions score the same, so guessing is explicitly encouraged."},
      {"q": "Can I use rough sheets or a calculator?", "a": "No note-taking and no calculators are allowed during the entire exam."},
      {"q": "Is the dMAT adaptive?", "a": "No, the dMAT is non-adaptive (fixed format). All candidates receive the same test structure."},
      {"q": "What is the test fee and where do I register?", "a": "The test fee is \u20ac150. Registration is conducted exclusively through the official g.a.s.t. portal."},
      {"q": "Can I revisit questions within a subtest?", "a": "You must manage your time within each subtest''s fixed window (e.g., 25 minutes for Figure Sequences). Once a subtest ends, you cannot return to it."}
    ]
  },
  "official_links": {
    "title": "Official Links",
    "items": [
      {"label": "Official dMAT website (d-mat.de)", "url": "https://www.d-mat.de/en/"},
      {"label": "g.a.s.t. Registration Portal", "url": "https://www.gast.de/portal/center-search/center-search/dmat/exams/worldwide?lang=en"},
      {"label": "APS India dMAT Information", "url": "https://aps-india.de/dmat/"},
      {"label": "Official Affected Fields List (PDF)", "url": "https://aps-india.de/wp-content/uploads/2026/06/dMAT_India_Affected_Fields_List.pdf"},
      {"label": "General Academic Preparatory Materials (PDF)", "url": "https://www.d-mat.de/wp-content/uploads/2026/07/260716_dMAT_General-Academic-Module_Preparatoy-Materials_EN.pdf"}
    ]
  }
}'::jsonb
WHERE id = 1;
