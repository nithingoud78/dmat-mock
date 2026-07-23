export type Json = string | number | boolean | null | { [key: string]: Json | undefined } | Json[];

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "14.5";
  };
  graphql_public: {
    Tables: {
      [_ in never]: never;
    };
    Views: {
      [_ in never]: never;
    };
    Functions: {
      graphql: {
        Args: {
          extensions?: Json;
          operationName?: string;
          query?: string;
          variables?: Json;
        };
        Returns: Json;
      };
    };
    Enums: {
      [_ in never]: never;
    };
    CompositeTypes: {
      [_ in never]: never;
    };
  };
  public: {
    Tables: {
      anon_attempts: {
        Row: {
          accuracy: number | null;
          answers: Json;
          correct_count: number;
          created_at: string;
          duration_seconds: number | null;
          id: string;
          incorrect_count: number;
          mode: Database["public"]["Enums"]["attempt_mode"];
          module: Database["public"]["Enums"]["module_type"] | null;
          question_ids: string[];
          score: number | null;
          core_raw_score?: number | null;
          gam_raw_score?: number | null;
          core_scaled_score?: number | null;
          gam_scaled_score?: number | null;
          total_scaled_score?: number | null;
          core_percentile?: number | null;
          gam_percentile?: number | null;
          total_percentile?: number | null;
          analytics_json?: Json | null;
          session_token: string;
          skipped_count: number;
          started_at: string;
          status: Database["public"]["Enums"]["attempt_status"];
          submitted_at: string | null;
          total_questions: number;
          updated_at: string;
        };
        Insert: {
          accuracy?: number | null;
          answers?: Json;
          correct_count?: number;
          created_at?: string;
          duration_seconds?: number | null;
          id?: string;
          incorrect_count?: number;
          mode: Database["public"]["Enums"]["attempt_mode"];
          module?: Database["public"]["Enums"]["module_type"] | null;
          question_ids?: string[];
          score?: number | null;
          core_raw_score?: number | null;
          gam_raw_score?: number | null;
          core_scaled_score?: number | null;
          gam_scaled_score?: number | null;
          total_scaled_score?: number | null;
          core_percentile?: number | null;
          gam_percentile?: number | null;
          total_percentile?: number | null;
          analytics_json?: Json | null;
          session_token: string;
          skipped_count?: number;
          started_at?: string;
          status?: Database["public"]["Enums"]["attempt_status"];
          submitted_at?: string | null;
          total_questions?: number;
          updated_at?: string;
        };
        Update: {
          accuracy?: number | null;
          answers?: Json;
          correct_count?: number;
          created_at?: string;
          duration_seconds?: number | null;
          id?: string;
          incorrect_count?: number;
          mode?: Database["public"]["Enums"]["attempt_mode"];
          module?: Database["public"]["Enums"]["module_type"] | null;
          question_ids?: string[];
          score?: number | null;
          core_raw_score?: number | null;
          gam_raw_score?: number | null;
          core_scaled_score?: number | null;
          gam_scaled_score?: number | null;
          total_scaled_score?: number | null;
          core_percentile?: number | null;
          gam_percentile?: number | null;
          total_percentile?: number | null;
          analytics_json?: Json | null;
          session_token?: string;
          skipped_count?: number;
          started_at?: string;
          status?: Database["public"]["Enums"]["attempt_status"];
          submitted_at?: string | null;
          total_questions?: number;
          updated_at?: string;
        };
        Relationships: [];
      };
      anon_sessions: {
        Row: {
          created_at: string;
          id: string;
          last_seen_at: string;
          session_token: string;
        };
        Insert: {
          created_at?: string;
          id?: string;
          last_seen_at?: string;
          session_token: string;
        };
        Update: {
          created_at?: string;
          id?: string;
          last_seen_at?: string;
          session_token?: string;
        };
        Relationships: [];
      };
      attempt_answers: {
        Row: {
          answered_at: string | null;
          attempt_id: string;
          created_at: string;
          id: string;
          is_correct: boolean | null;
          marked_for_review: boolean;
          question_id: string;
          selected_option_id: string | null;
          time_spent_seconds: number;
        };
        Insert: {
          answered_at?: string | null;
          attempt_id: string;
          created_at?: string;
          id?: string;
          is_correct?: boolean | null;
          marked_for_review?: boolean;
          question_id: string;
          selected_option_id?: string | null;
          time_spent_seconds?: number;
        };
        Update: {
          answered_at?: string | null;
          attempt_id?: string;
          created_at?: string;
          id?: string;
          is_correct?: boolean | null;
          marked_for_review?: boolean;
          question_id?: string;
          selected_option_id?: string | null;
          time_spent_seconds?: number;
        };
        Relationships: [
          {
            foreignKeyName: "attempt_answers_attempt_id_fkey";
            columns: ["attempt_id"];
            isOneToOne: false;
            referencedRelation: "test_attempts";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "attempt_answers_question_id_fkey";
            columns: ["question_id"];
            isOneToOne: false;
            referencedRelation: "questions";
            referencedColumns: ["id"];
          },
        ];
      };
      feedback: {
        Row: {
          id: string;
          created_at: string;
          name: string | null;
          email: string | null;
          category: string;
          message: string;
          status: string;
        };
        Insert: {
          id?: string;
          created_at?: string;
          name?: string | null;
          email?: string | null;
          category: string;
          message: string;
          status?: string;
        };
        Update: {
          id?: string;
          created_at?: string;
          name?: string | null;
          email?: string | null;
          category?: string;
          message?: string;
          status?: string;
        };
        Relationships: [];
      };
      homepage_content: {
        Row: {
          content: Json;
          id: number;
          updated_at: string;
        };
        Insert: {
          content?: Json;
          id?: number;
          updated_at?: string;
        };
        Update: {
          content?: Json;
          id?: number;
          updated_at?: string;
        };
        Relationships: [];
      };
      mock_sets: {
        Row: {
          created_at: string;
          id: number;
          label: string | null;
          module_breakdown: Json;
          question_ids: string[];
          total_questions: number;
        };
        Insert: {
          created_at?: string;
          id?: number;
          label?: string | null;
          module_breakdown?: Json;
          question_ids?: string[];
          total_questions?: number;
        };
        Update: {
          created_at?: string;
          id?: number;
          label?: string | null;
          module_breakdown?: Json;
          question_ids?: string[];
          total_questions?: number;
        };
        Relationships: [];
      };
      profiles: {
        Row: {
          created_at: string;
          display_name: string | null;
          email: string | null;
          seen_questions: string[];
          id: string;
          updated_at: string;
        };
        Insert: {
          created_at?: string;
          display_name?: string | null;
          email?: string | null;
          id: string;
          seen_questions?: string[];
          updated_at?: string;
        };
        Update: {
          created_at?: string;
          display_name?: string | null;
          email?: string | null;
          id?: string;
          seen_questions?: string[];
          updated_at?: string;
        };
        Relationships: [];
      };
      questions: {
        Row: {
          correct_option_id: string;
          created_at: string;
          difficulty: Database["public"]["Enums"]["difficulty_level"];
          explanation_text: string;
          id: string;
          image_url: string | null;
          module: Database["public"]["Enums"]["module_type"];
          options: Json;
          prompt_text: string;
          source_id: string;
          tags: string[];
          time_estimate_seconds: number;
          updated_at: string;
          visual_data: Json | null;
          subtopic: string | null;
          question_type: string | null;
          content_hash: string | null;
          imported_from: string | null;
          verified: boolean | null;
          approved: boolean | null;
          internal_notes: string | null;
          solution_steps: Json | null;
        };
        Insert: {
          correct_option_id: string;
          created_at?: string;
          difficulty?: Database["public"]["Enums"]["difficulty_level"];
          explanation_text?: string;
          id?: string;
          image_url?: string | null;
          module: Database["public"]["Enums"]["module_type"];
          options?: Json;
          prompt_text?: string;
          source_id: string;
          tags?: string[];
          time_estimate_seconds?: number;
          updated_at?: string;
          visual_data?: Json | null;
          subtopic?: string | null;
          question_type?: string | null;
          content_hash?: string | null;
          imported_from?: string | null;
          verified?: boolean | null;
          approved?: boolean | null;
          internal_notes?: string | null;
          solution_steps?: Json | null;
        };
        Update: {
          correct_option_id?: string;
          created_at?: string;
          difficulty?: Database["public"]["Enums"]["difficulty_level"];
          explanation_text?: string;
          id?: string;
          image_url?: string | null;
          module?: Database["public"]["Enums"]["module_type"];
          options?: Json;
          prompt_text?: string;
          source_id?: string;
          tags?: string[];
          time_estimate_seconds?: number;
          updated_at?: string;
          visual_data?: Json | null;
          subtopic?: string | null;
          question_type?: string | null;
          content_hash?: string | null;
          imported_from?: string | null;
          verified?: boolean | null;
          approved?: boolean | null;
          internal_notes?: string | null;
          solution_steps?: Json | null;
        };
        Relationships: [
          {
            foreignKeyName: "questions_source_id_fkey";
            columns: ["source_id"];
            isOneToOne: false;
            referencedRelation: "sources";
            referencedColumns: ["id"];
          },
        ];
      };
      sources: {
        Row: {
          created_at: string;
          edition: string | null;
          id: string;
          license_note: string | null;
          name: string;
          note: string | null;
          page: string | null;
          publisher: string | null;
          question_type: string | null;
          updated_at: string;
          url: string | null;
          year: string | null;
        };
        Insert: {
          created_at?: string;
          edition?: string | null;
          id?: string;
          license_note?: string | null;
          name: string;
          note?: string | null;
          page?: string | null;
          publisher?: string | null;
          question_type?: string | null;
          updated_at?: string;
          url?: string | null;
          year?: string | null;
        };
        Update: {
          created_at?: string;
          edition?: string | null;
          id?: string;
          license_note?: string | null;
          name?: string;
          note?: string | null;
          page?: string | null;
          publisher?: string | null;
          question_type?: string | null;
          updated_at?: string;
          url?: string | null;
          year?: string | null;
        };
        Relationships: [];
      };
      site_content: {
        Row: {
          id: string;
          page: string;
          section: string;
          key: string;
          content: string;
          updated_at: string | null;
        };
        Insert: {
          id?: string;
          page: string;
          section: string;
          key: string;
          content: string;
          updated_at?: string | null;
        };
        Update: {
          id?: string;
          page?: string;
          section?: string;
          key?: string;
          content?: string;
          updated_at?: string | null;
        };
        Relationships: [];
      };
      tab_switch_events: {
        Row: {
          attempt_id: string;
          duration_away_seconds: number;
          id: string;
          occurred_at: string;
        };
        Insert: {
          attempt_id: string;
          duration_away_seconds?: number;
          id?: string;
          occurred_at?: string;
        };
        Update: {
          attempt_id?: string;
          duration_away_seconds?: number;
          id?: string;
          occurred_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: "tab_switch_events_attempt_id_fkey";
            columns: ["attempt_id"];
            isOneToOne: false;
            referencedRelation: "test_attempts";
            referencedColumns: ["id"];
          },
        ];
      };
      test_attempts: {
        Row: {
          accuracy: number | null;
          correct_count: number;
          created_at: string;
          duration_seconds: number | null;
          id: string;
          incorrect_count: number;
          mode: Database["public"]["Enums"]["attempt_mode"];
          module: Database["public"]["Enums"]["module_type"] | null;
          question_ids: string[];
          score: number | null;
          core_raw_score?: number | null;
          gam_raw_score?: number | null;
          core_scaled_score?: number | null;
          gam_scaled_score?: number | null;
          total_scaled_score?: number | null;
          core_percentile?: number | null;
          gam_percentile?: number | null;
          total_percentile?: number | null;
          analytics_json?: Json | null;
          skipped_count: number;
          started_at: string;
          status: Database["public"]["Enums"]["attempt_status"];
          submitted_at: string | null;
          total_questions: number;
          updated_at: string;
          user_id: string;
        };
        Insert: {
          accuracy?: number | null;
          correct_count?: number;
          created_at?: string;
          duration_seconds?: number | null;
          id?: string;
          incorrect_count?: number;
          mode: Database["public"]["Enums"]["attempt_mode"];
          module?: Database["public"]["Enums"]["module_type"] | null;
          question_ids?: string[];
          score?: number | null;
          core_raw_score?: number | null;
          gam_raw_score?: number | null;
          core_scaled_score?: number | null;
          gam_scaled_score?: number | null;
          total_scaled_score?: number | null;
          core_percentile?: number | null;
          gam_percentile?: number | null;
          total_percentile?: number | null;
          analytics_json?: Json | null;
          skipped_count?: number;
          started_at?: string;
          status?: Database["public"]["Enums"]["attempt_status"];
          submitted_at?: string | null;
          total_questions?: number;
          updated_at?: string;
          user_id: string;
        };
        Update: {
          accuracy?: number | null;
          correct_count?: number;
          created_at?: string;
          duration_seconds?: number | null;
          id?: string;
          incorrect_count?: number;
          mode?: Database["public"]["Enums"]["attempt_mode"];
          module?: Database["public"]["Enums"]["module_type"] | null;
          question_ids?: string[];
          score?: number | null;
          core_raw_score?: number | null;
          gam_raw_score?: number | null;
          core_scaled_score?: number | null;
          gam_scaled_score?: number | null;
          total_scaled_score?: number | null;
          core_percentile?: number | null;
          gam_percentile?: number | null;
          total_percentile?: number | null;
          analytics_json?: Json | null;
          skipped_count?: number;
          started_at?: string;
          status?: Database["public"]["Enums"]["attempt_status"];
          submitted_at?: string | null;
          total_questions?: number;
          updated_at?: string;
          user_id?: string;
        };
        Relationships: [];
      };
      user_roles: {
        Row: {
          created_at: string;
          id: string;
          role: Database["public"]["Enums"]["app_role"];
          user_id: string;
        };
        Insert: {
          created_at?: string;
          id?: string;
          role: Database["public"]["Enums"]["app_role"];
          user_id: string;
        };
        Update: {
          created_at?: string;
          id?: string;
          role?: Database["public"]["Enums"]["app_role"];
          user_id?: string;
        };
        Relationships: [];
      };
    };
    Views: {
      [_ in never]: never;
    };
    Functions: {
      has_role: {
        Args: {
          _role: Database["public"]["Enums"]["app_role"];
          _user_id: string;
        };
        Returns: boolean;
      };
    };
    Enums: {
      app_role: "admin" | "user";
      attempt_mode: "practice" | "timed_section" | "complete_mock";
      attempt_status: "in_progress" | "submitted" | "expired";
      difficulty_level: "easy" | "medium" | "hard";
      module_type: "figure_sequence" | "math_equation" | "latin_square" | "general_academic";
    };
    CompositeTypes: {
      [_ in never]: never;
    };
  };
};

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">;

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">];

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals;
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R;
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] & DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R;
      }
      ? R
      : never
    : never;

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    keyof DefaultSchema["Tables"] | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals;
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I;
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I;
      }
      ? I
      : never
    : never;

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    keyof DefaultSchema["Tables"] | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals;
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U;
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U;
      }
      ? U
      : never
    : never;

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    keyof DefaultSchema["Enums"] | { schema: keyof DatabaseWithoutInternals },
  EnumName extends (DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never) = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals;
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never;

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    keyof DefaultSchema["CompositeTypes"] | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends (PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals;
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never) = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals;
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never;

export const Constants = {
  graphql_public: {
    Enums: {},
  },
  public: {
    Enums: {
      app_role: ["admin", "user"],
      attempt_mode: ["practice", "timed_section", "complete_mock"],
      attempt_status: ["in_progress", "submitted", "expired"],
      difficulty_level: ["easy", "medium", "hard"],
      module_type: ["figure_sequence", "math_equation", "latin_square", "general_academic"],
    },
  },
} as const;
