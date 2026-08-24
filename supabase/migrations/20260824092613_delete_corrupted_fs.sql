-- Delete the 20 incorrectly imported Figure Sequence questions from dmatexamprep
DELETE FROM public.questions
WHERE module = 'figure_sequence'
  AND 'dmatexamprep' = ANY(tags);
