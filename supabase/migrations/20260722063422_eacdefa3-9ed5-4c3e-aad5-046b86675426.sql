
CREATE POLICY "question-images public read" ON storage.objects FOR SELECT USING (bucket_id = 'question-images');
CREATE POLICY "question-images admin insert" ON storage.objects FOR INSERT TO authenticated WITH CHECK (bucket_id = 'question-images' AND public.has_role(auth.uid(), 'admin'));
CREATE POLICY "question-images admin update" ON storage.objects FOR UPDATE TO authenticated USING (bucket_id = 'question-images' AND public.has_role(auth.uid(), 'admin'));
CREATE POLICY "question-images admin delete" ON storage.objects FOR DELETE TO authenticated USING (bucket_id = 'question-images' AND public.has_role(auth.uid(), 'admin'));
