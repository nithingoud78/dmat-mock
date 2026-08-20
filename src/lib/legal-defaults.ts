export const LEGAL_DEFAULTS: Record<string, string> = {
  about: `
<p><em>Last Updated: 23 July 2026</em></p>

<h2>What is dMAT Practice Pro?</h2>
<p><strong>dMAT Practice Pro</strong> is an independent, non-commercial educational platform built specifically for students preparing for the <strong>Digital Master Assessment Test (dMAT)</strong> — a prerequisite examination for Indian students applying to Master&rsquo;s programmes at German universities through the Academic Evaluation Centre (APS India).</p>
<p>Our platform provides algorithmically generated and hand-crafted practice questions across all four sections of the dMAT, designed to closely emulate the structure, difficulty, and format of the official examination.</p>

<h2>Our Mission</h2>
<p>The dMAT is a rigorous, time-pressured examination with limited official preparation materials available to students. Our mission is to bridge that gap — providing high-quality, structured, and accessible practice tools so that every applicant can prepare with confidence.</p>
<ul>
  <li>Provide the most accurate and comprehensive dMAT practice available online.</li>
  <li>Make preparation accessible to all students, regardless of location or background.</li>
  <li>Simulate the real exam environment with authentic timing and question formats.</li>
  <li>Build a free resource that grows and improves with the community.</li>
</ul>

<h2>What We Offer</h2>
<ul>
  <li><strong>Figure Sequences:</strong> 20 algorithmically generated visual reasoning questions per mock, emulating the official format.</li>
  <li><strong>Mathematical Equations:</strong> 20 algebra, arithmetic, ratio, and applied maths questions at exam difficulty.</li>
  <li><strong>Latin Squares:</strong> 20 constraint-based grid puzzles requiring logical elimination and pattern recognition.</li>
  <li><strong>General Academic Module:</strong> 25 passage-based comprehension and reasoning questions across academic disciplines.</li>
  <li><strong>Complete Mock Test:</strong> A full 4-section simulation with official timing (25 + 25 + 25 min core + 90 min subject), a scheduled 30-minute break, and an estimated scaled score.</li>
</ul>

<h2>How We Build Questions</h2>
<p>Our practice questions are built through careful curation and manual crafting by subject-matter experts. Each question is reviewed for technical accuracy, logical validity, and alignment with the official dMAT format described in publicly available preparatory materials from g.a.s.t.</p>
<p>Questions are tagged with difficulty, subtopic, estimated solving time, and explanations. We never copy or reproduce official examination content.</p>

<h2>Independent Platform</h2>
<p>dMAT Practice Pro is an <strong>independent educational tool</strong>. We are <strong>not affiliated with, endorsed by, or in any way connected to</strong> APS India, APS Germany, g.a.s.t. (Gesellschaft f&uuml;r Akademische Studienvorbereitung und Testentwicklung e. V.), the TestDaF Institute, or the official dMAT examination.</p>
<p>All trademarks referenced on this platform (including &ldquo;dMAT&rdquo;, &ldquo;APS&rdquo;, &ldquo;g.a.s.t.&rdquo;) belong to their respective owners. We use these terms solely for the purpose of accurately describing the examination this platform is designed to prepare students for.</p>

<h2>Privacy &amp; Data</h2>
<p>We take your privacy seriously. We collect minimal, anonymised data to improve the platform. We do not sell your data or require account registration to use our core practice features. Please read our <a href="/privacy-policy">Privacy Policy</a> for full details.</p>

<h2>Contact</h2>
<p>Have a question, found an error in a question, or want to give feedback? We welcome your input.</p>
<p><a href="/feedback">Contact Us</a></p>
  `,
  "privacy-policy": `
<p><em>Last Updated: 23 July 2026</em></p>

<h2>1. Introduction</h2>
<p>Welcome to <strong>dMAT Practice Pro</strong> (&ldquo;we&rdquo;, &ldquo;us&rdquo;, or &ldquo;our&rdquo;). We are committed to protecting your personal information and your right to privacy. This Privacy Policy explains what information we collect, how we use it, and what rights you have in relation to it when you visit our website at <strong>dmatmock.vercel.app</strong> (the &ldquo;Site&rdquo;).</p>
<p>Please read this policy carefully. If you have any questions, please use the Contact link at the bottom of this page.</p>

<h2>2. Information We Collect</h2>
<p>We may collect the following types of information:</p>
<ul>
  <li><strong>Usage Data:</strong> Anonymised information about how you navigate and use the Site (pages visited, time spent, questions attempted).</li>
  <li><strong>Session Data:</strong> A randomly generated, non-identifiable session token stored in your browser to preserve your practice progress within a single visit.</li>
  <li><strong>Account Data (optional):</strong> If you choose to create an account, we collect your email address and a hashed password, managed securely by Supabase Auth.</li>
  <li><strong>Feedback Submissions:</strong> Text you voluntarily submit through the Feedback form.</li>
</ul>
<p>We do <strong>not</strong> collect your name, phone number, payment details, or any sensitive personal data.</p>

<h2>3. How We Use Your Information</h2>
<ul>
  <li>To provide and maintain the practice platform and its features.</li>
  <li>To track your anonymous practice session and display your progress within that session.</li>
  <li>To respond to feedback and improve the quality of content.</li>
  <li>To understand aggregate usage patterns and improve the platform.</li>
  <li>To serve non-personalised or interest-based advertisements via Google AdSense (when enabled).</li>
</ul>

<h2>4. Cookies and Tracking Technologies</h2>
<p>We use cookies and similar tracking technologies to enhance your experience. These include:</p>
<ul>
  <li><strong>Strictly Necessary Cookies:</strong> Required for authentication and session management.</li>
  <li><strong>Analytics Cookies:</strong> Used to understand how visitors interact with the Site (e.g., Google Analytics, if enabled).</li>
  <li><strong>Advertising Cookies:</strong> Google AdSense may place cookies to serve relevant advertisements. You can manage your preferences via Google&rsquo;s Ad Settings or your browser settings.</li>
</ul>
<p>Please refer to our <a href="/cookie-policy">Cookie Policy</a> for full details.</p>

<h2>5. Legal Basis for Processing (GDPR)</h2>
<p>Where applicable under the General Data Protection Regulation (GDPR), we process your data on the following legal bases:</p>
<ul>
  <li><strong>Legitimate Interests:</strong> To operate and improve the platform.</li>
  <li><strong>Consent:</strong> For non-essential cookies and advertising.</li>
  <li><strong>Contract:</strong> To provide the services you have requested (e.g., creating an account).</li>
</ul>

<h2>6. Data Retention</h2>
<p>Anonymous session data is temporary and expires at the end of your browser session. Account data is retained for as long as your account remains active. Feedback submissions are retained indefinitely for platform improvement purposes. You may request deletion of your data at any time.</p>

<h2>7. Third-Party Services</h2>
<p>We use the following third-party services which may process your data according to their own privacy policies:</p>
<ul>
  <li><strong>Supabase:</strong> Database and authentication (supabase.com/privacy)</li>
  <li><strong>Vercel:</strong> Hosting and deployment (vercel.com/legal/privacy-policy)</li>
  <li><strong>Google AdSense:</strong> Advertising (policies.google.com/privacy)</li>
</ul>
<p>We encourage you to review the privacy policies of these third-party services.</p>

<h2>8. Data Security</h2>
<p>We implement appropriate technical and organisational measures to protect your information against unauthorised access, alteration, disclosure, or destruction. However, no method of transmission over the internet is 100% secure.</p>

<h2>9. Your Rights</h2>
<p>Depending on your location, you may have the following rights regarding your personal data:</p>
<ul>
  <li>Right to access and receive a copy of your data</li>
  <li>Right to correction of inaccurate data</li>
  <li>Right to erasure (&ldquo;right to be forgotten&rdquo;)</li>
  <li>Right to restrict or object to processing</li>
  <li>Right to data portability</li>
  <li>Right to withdraw consent at any time</li>
</ul>

<h2>10. Children&rsquo;s Privacy</h2>
<p>Our Site is not directed at children under 13 years of age. We do not knowingly collect personal information from children. If you believe we have inadvertently collected such information, please contact us immediately.</p>

<h2>11. Changes to This Policy</h2>
<p>We may update this Privacy Policy periodically to reflect changes in our practices or for legal, operational, or regulatory reasons. We will update the &ldquo;Last Updated&rdquo; date at the top of this page. Continued use of the Site after changes constitutes your acceptance of the revised policy.</p>

<h2>12. Contact</h2>
<p>If you have any privacy-related questions, concerns, or requests regarding your personal information, please use our Contact page.</p>
<p><a href="/feedback">Contact Us</a></p>
  `,
  "terms-and-conditions": `
<p><em>Last Updated: 23 July 2026</em></p>

<h2>1. Agreement to Terms</h2>
<p>By accessing or using <strong>dMAT Practice Pro</strong> (the &ldquo;Site&rdquo; or &ldquo;Service&rdquo;), you agree to be bound by these Terms and Conditions and our <a href="/privacy-policy">Privacy Policy</a>. If you do not agree to any part of these terms, you must not use our Service. These terms apply to all visitors, users, and others who access or use the Service.</p>

<h2>2. Description of Service</h2>
<p>dMAT Practice Pro is a free, independent educational platform providing practice questions, mock examinations, and preparation materials for students preparing for the Digital Master Assessment Test (dMAT). The Service is provided on an &ldquo;as is&rdquo; and &ldquo;as available&rdquo; basis.</p>

<h2>3. No Official Affiliation</h2>
<p>dMAT Practice Pro is an <strong>independent platform</strong>. We are not affiliated with, authorised by, endorsed by, or in any way officially connected to APS India, APS Germany, g.a.s.t. (Gesellschaft f&uuml;r Akademische Studienvorbereitung und Testentwicklung e. V.), the TestDaF Institute, or any German university. All referenced trademarks belong to their respective owners.</p>

<h2>4. Intellectual Property</h2>
<p>All original content on this Site &mdash; including algorithmically generated practice questions, explanations, interface design, and platform code &mdash; is the intellectual property of dMAT Practice Pro and is protected by applicable copyright law.</p>
<p>You are granted a limited, non-exclusive, non-transferable licence to access and use the Site for personal, non-commercial educational purposes only. You may not:</p>
<ul>
  <li>Reproduce, copy, or redistribute any content without written permission.</li>
  <li>Sell, sublicense, or otherwise commercialise any part of the Service.</li>
  <li>Systematically extract data from the platform (scraping, automated queries).</li>
  <li>Reverse-engineer, decompile, or attempt to extract source code.</li>
</ul>

<h2>5. Acceptable Use</h2>
<p>You agree to use the Service only for lawful purposes and in a manner that does not infringe the rights of others. You must not:</p>
<ul>
  <li>Use the Site in any way that disrupts, damages, or impairs the platform.</li>
  <li>Attempt to gain unauthorised access to any part of the Service or its infrastructure.</li>
  <li>Submit false, misleading, or harmful content through the feedback system.</li>
  <li>Use the Service in violation of any applicable local, national, or international law or regulation.</li>
</ul>

<h2>6. Educational Purpose &amp; Accuracy</h2>
<p>All practice materials are designed for educational preparation purposes only. While we strive for accuracy and alignment with the official dMAT format, we make no warranty that practice questions are identical to official examination content. We do not guarantee any specific score on the official dMAT or admission to any university programme. Academic results depend on a wide range of individual factors beyond practice performance.</p>

<h2>7. User Accounts</h2>
<p>Account registration is optional. If you create an account, you are responsible for maintaining the confidentiality of your credentials and for all activities that occur under your account. You may delete your account at any time by contacting us via the Feedback page.</p>

<h2>8. Third-Party Services and Links</h2>
<p>The Site may contain links to third-party websites. These links are provided for convenience only. We have no control over the content of those sites and accept no responsibility for them or for any loss or damage that may arise from your use of them.</p>

<h2>9. Advertisements</h2>
<p>dMAT Practice Pro may display advertisements served by Google AdSense and other third-party advertising networks. These are clearly distinguished from editorial content. Advertisements are not displayed during active mock examination sessions.</p>

<h2>10. Disclaimers and Limitation of Liability</h2>
<p>To the maximum extent permitted by applicable law, dMAT Practice Pro shall not be liable for any indirect, incidental, special, consequential, or punitive damages, including loss of data, profits, or goodwill, arising out of or in connection with your use of the Service.</p>
<p>The Service is provided without warranties of any kind, either express or implied, including but not limited to implied warranties of merchantability, fitness for a particular purpose, or non-infringement.</p>

<h2>11. Changes to Terms</h2>
<p>We reserve the right to modify these Terms at any time. Changes will be posted on this page with an updated &ldquo;Last Updated&rdquo; date. Your continued use of the Service after any changes constitutes your acceptance of the new terms.</p>

<h2>12. Governing Law</h2>
<p>These Terms shall be governed by and construed in accordance with applicable law. Any disputes arising under these Terms shall be subject to the exclusive jurisdiction of the competent courts.</p>

<h2>13. Contact</h2>
<p>If you have any questions about these Terms and Conditions, please reach out to us through our Contact page.</p>
<p><a href="/feedback">Contact Us</a></p>
  `,
  disclaimer: `
<p><em>Last Updated: 23 July 2026</em></p>

<h2>1. Independent Educational Platform</h2>
<p><strong>dMAT Practice Pro</strong> is an independent, non-official preparation platform. We are <strong>NOT affiliated with, associated with, authorized by, endorsed by, or in any way officially connected</strong> to:</p>
<ul>
  <li>APS India (Academic Evaluation Centre, India)</li>
  <li>APS Germany</li>
  <li>g.a.s.t. (Gesellschaft f&uuml;r Akademische Studienvorbereitung und Testentwicklung e. V.)</li>
  <li>The TestDaF Institute</li>
  <li>The official dMAT examination</li>
  <li>Any German university</li>
</ul>
<p>The official dMAT examination is managed solely by g.a.s.t. and APS India. For official registration, rules, syllabus, and authoritative guidance, you must refer to the official APS India website.</p>

<h2>2. Trademarks</h2>
<p>All trademarks, service marks, and company names mentioned on this platform (including but not limited to &ldquo;dMAT&rdquo;, &ldquo;APS&rdquo;, and &ldquo;g.a.s.t.&rdquo;) are the property of their respective owners. Their use on this website is strictly for identification and descriptive purposes only, to indicate the examination for which this platform provides preparation materials.</p>

<h2>3. Educational Purposes Only</h2>
<p>The practice questions, mock examinations, analytics, and other materials provided by dMAT Practice Pro are for <strong>educational purposes only</strong>. Our algorithmically generated questions are designed to emulate the structure and difficulty of the official exam pattern based on publicly available information, but they are not official past papers or leaked materials. We do not reproduce copyrighted official examination content.</p>

<h2>4. No Guarantee of Results</h2>
<p>Practicing on this platform <strong>does not guarantee</strong> any specific score, outcome, or success on the actual dMAT examination. Furthermore, we make no guarantees regarding APS certification or admission to any university programme. Success on the official test depends on a wide variety of personal factors beyond practice performance.</p>

<h2>5. Accuracy of Information</h2>
<p>While we strive to keep the information on this website accurate and up-to-date, we make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability, or availability with respect to the website or the information, products, services, or related graphics contained on the website for any purpose. Any reliance you place on such information is therefore strictly at your own risk.</p>

<h2>6. Contact</h2>
<p>If you have any questions about this disclaimer, please reach out to us through our Contact page.</p>
<p><a href="/feedback">Contact Us</a></p>
  `,
  "cookie-policy": `
<p><em>Last Updated: 23 July 2026</em></p>

<h2>1. What Are Cookies?</h2>
<p>Cookies are small text files that are placed on your computer or mobile device when you visit a website. They are widely used by website owners in order to make their websites work, or to work more efficiently, as well as to provide reporting information.</p>
<p>Cookies set by the website owner (in this case, dMAT Practice Pro) are called &ldquo;first-party cookies&rdquo;. Cookies set by parties other than the website owner are called &ldquo;third-party cookies&rdquo;. Third-party cookies enable third-party features or functionality to be provided on or through the website (e.g. advertising, interactive content and analytics).</p>

<h2>2. How We Use Cookies</h2>
<p>We use first-party and third-party cookies for several reasons. Some cookies are required for technical reasons in order for our Website to operate, and we refer to these as &ldquo;essential&rdquo; or &ldquo;strictly necessary&rdquo; cookies. Other cookies also enable us to track and target the interests of our users to enhance the experience on our Website.</p>

<h2>3. Types of Cookies We Use</h2>
<ul>
  <li><strong>Essential Cookies:</strong> These cookies are strictly necessary to provide you with services available through our Website and to use some of its features, such as maintaining your authentication state (login session) via Supabase.</li>
  <li><strong>Performance and Functionality Cookies:</strong> These cookies are used to enhance the performance and functionality of our Website but are non-essential to their use. However, without these cookies, certain functionality may become unavailable.</li>
  <li><strong>Analytics and Customization Cookies:</strong> These cookies collect information that is used either in aggregate form to help us understand how our Website is being used or how effective our marketing campaigns are.</li>
  <li><strong>Advertising Cookies:</strong> When Google AdSense is enabled on this site, third-party vendors, including Google, will use cookies to serve ads based on your prior visits to this website or other websites.</li>
</ul>

<h2>4. Managing Cookies</h2>
<p>You have the right to decide whether to accept or reject cookies. You can exercise your cookie rights by setting your preferences in your web browser. If you choose to reject cookies, you may still use our website though your access to some functionality and areas of our website may be restricted.</p>
<p>For more information on how to manage cookies via your browser settings, please refer to your browser's official documentation.</p>

<h2>5. Updates to this Policy</h2>
<p>We may update this Cookie Policy from time to time in order to reflect changes to the cookies we use or for other operational, legal, or regulatory reasons. Please therefore re-visit this Cookie Policy regularly to stay informed about our use of cookies and related technologies.</p>

<h2>6. Contact</h2>
<p>If you have any privacy-related questions, concerns, or requests regarding your personal information, please use our Contact page.</p>
<p><a href="/feedback">Contact Us</a></p>
  `,
};
