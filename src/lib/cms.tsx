import React, { createContext, useContext, useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";

export type CMSContentMap = Record<string, Record<string, string>>; // section -> key -> content

interface CMSContextState {
  content: CMSContentMap;
  loading: boolean;
}

const CMSContext = createContext<CMSContextState>({
  content: {},
  loading: true,
});

export function CMSProvider({ page, children }: { page: string; children: React.ReactNode }) {
  const [content, setContent] = useState<CMSContentMap>({});
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    let mounted = true;
    
    async function fetchContent() {
      try {
        const { data, error } = await supabase
          .from("site_content")
          .select("section, key, content")
          .eq("page", page);
          
        if (error) throw error;
        
        if (mounted && data) {
          const map: CMSContentMap = {};
          data.forEach(row => {
            if (!map[row.section]) map[row.section] = {};
            map[row.section][row.key] = row.content;
          });
          setContent(map);
        }
      } catch (err) {
        console.error("Failed to fetch CMS content:", err);
      } finally {
        if (mounted) setLoading(false);
      }
    }
    
    fetchContent();
    
    return () => { mounted = false; };
  }, [page]);

  return (
    <CMSContext.Provider value={{ content, loading }}>
      {children}
    </CMSContext.Provider>
  );
}

/**
 * Returns a function `get(key, defaultValue)` that retrieves the string from the CMS.
 * If the value is missing (or if loading), it safely returns the defaultValue.
 */
export function useCMS(section: string) {
  const { content } = useContext(CMSContext);
  
  const get = (key: string, defaultValue: string) => {
    const sectionData = content[section];
    if (sectionData && sectionData[key] !== undefined && sectionData[key].trim() !== "") {
      return sectionData[key];
    }
    return defaultValue;
  };
  
  return { get };
}
