import { type FC } from "react";
import { Question } from "@/lib/types";
import { QuestionDisplay } from "./QuestionDisplay";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";

interface ReviewQuestionDialogProps {
  question: Question;
  userAnswer: string | null;
  children: React.ReactNode;
}

export const ReviewQuestionDialog: FC<ReviewQuestionDialogProps> = ({
  question,
  userAnswer,
  children,
}) => {
  return (
    <Dialog>
      <DialogTrigger asChild>{children}</DialogTrigger>
      <DialogContent className="max-h-[90vh] max-w-4xl overflow-y-auto">
        <DialogHeader>
          <DialogTitle>Question Review</DialogTitle>
        </DialogHeader>

        <div className="mt-4">
          <div className="rounded-xl border border-border bg-card p-6 shadow-sm">
            <QuestionDisplay
              question={question}
              selectedOptionId={userAnswer}
              correctOptionId={question.correct_option_id}
              showFeedback={true}
              disabled={true}
            />
          </div>

          {question.explanation_text && (
            <div className="mt-6 rounded-lg bg-blue-50 p-6 dark:bg-blue-950/20">
              <h4 className="mb-2 font-semibold text-blue-900 dark:text-blue-100">
                Explanation
              </h4>
              <p className="text-sm leading-relaxed text-blue-800 dark:text-blue-200">
                {question.explanation_text}
              </p>
            </div>
          )}
        </div>
      </DialogContent>
    </Dialog>
  );
};
