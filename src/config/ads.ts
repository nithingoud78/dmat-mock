export const adsConfig = {
  // Master switch for all ad placements (set to true to enable placeholders)
  adsEnabled: true,
  
  // Monetag integration (Vignette Banner / In-Page Push)
  monetagEnabled: true,
  
  // Switch to true ONLY after Google AdSense approves the domain
  adsenseEnabled: false,
  
  // Replace with actual Publisher ID upon approval (e.g., 'ca-pub-XXXXXXXXXXXXXXXX')
  publisherId: 'ca-pub-placeholder',
  
  // Whether to run ads in test mode
  testMode: true,

  // Allowed placements
  placements: {
    TopBanner: "top-banner",
    ContentTop: "content-top",
    ContentMiddle: "content-middle",
    ContentBottom: "content-bottom",
    Sidebar: "sidebar",
    Footer: "footer",
  }
} as const;

export type AdPlacement = typeof adsConfig.placements[keyof typeof adsConfig.placements];
