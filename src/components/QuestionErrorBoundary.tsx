import { Component, ReactNode } from "react";
import { toast } from "sonner";
import { AlertTriangle } from "lucide-react";

interface Props {
  children: ReactNode;
  questionId: string;
  onSkip: () => void;
}

interface State {
  hasError: boolean;
}

export class QuestionErrorBoundary extends Component<Props, State> {
  public state: State = {
    hasError: false,
  };

  public static getDerivedStateFromError(_: Error): State {
    return { hasError: true };
  }

  public componentDidCatch(error: Error) {
    console.warn("Question rendering crashed due to malformed data:", this.props.questionId, error);
    toast.error("Malformed question detected. Skipping automatically.");
    
    // Automatically skip the invalid question without crashing the UI
    // Run this in a timeout to avoid updating state of parent while React is reconciling
    setTimeout(() => {
      this.props.onSkip();
    }, 0);
  }

  public componentDidUpdate(prevProps: Props) {
    if (prevProps.questionId !== this.props.questionId) {
      this.setState({ hasError: false });
    }
  }

  public render() {
    if (this.state.hasError) {
      return (
        <div className="flex flex-col items-center justify-center p-8 text-muted-foreground bg-destructive/10 rounded-lg border border-destructive/20">
          <AlertTriangle className="h-8 w-8 mb-4 text-destructive" />
          <p className="font-semibold text-destructive">Malformed Question Data</p>
          <p className="text-sm mt-1">Skipping to the next question...</p>
        </div>
      );
    }

    return this.props.children;
  }
}
