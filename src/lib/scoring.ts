/**
 * dMAT Scoring Engine Module
 * 
 * Separates the platform's simulated scoring from the official proprietary
 * dMAT scoring algorithm, providing an interface for future official plugins.
 */

// Error function approximation for Cumulative Distribution Function (CDF)
function erf(x: number): number {
  const sign = x >= 0 ? 1 : -1;
  x = Math.abs(x);

  const a1 =  0.254829592;
  const a2 = -0.284496736;
  const a3 =  1.421413741;
  const a4 = -1.453152027;
  const a5 =  1.061405429;
  const p  =  0.3275911;

  const t = 1.0 / (1.0 + p * x);
  const y = 1.0 - (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * Math.exp(-x * x);

  return sign * y;
}

function normalCdf(z: number): number {
  return 0.5 * (1 + erf(z / Math.sqrt(2)));
}

export interface ScoreConfig {
  expectedMeanPercentage: number;
  expectedSdPercentage: number;
  scaledMean: number;
  scaledSd: number;
}

const DEFAULT_CONFIG: ScoreConfig = {
  expectedMeanPercentage: 0.5,
  expectedSdPercentage: 0.15,
  scaledMean: 100,
  scaledSd: 33.3,
};

export interface RawScore {
  correct: number;
  incorrect: number;
  skipped: number;
  total: number;
  accuracy: number;
}

export interface ScaledResult {
  rawScore: number;
  totalQuestions: number;
  scaledScore: number;
  percentile: number;
}

export interface CompleteMockResult {
  core: ScaledResult;
  gam: ScaledResult;
  total: ScaledResult;
}

/**
 * Interface defining how any scoring engine (approximated or official) must behave.
 */
export interface ScoringEngine {
  calculateScaledScore(rawScore: number, totalQuestions: number, moduleType: 'core' | 'gam' | 'total'): ScaledResult;
  aggregateMockResults(coreResult: ScaledResult, gamResult: ScaledResult): CompleteMockResult;
}

/**
 * Our internal statistical approximation of the dMAT scoring algorithm.
 * Note: This produces an ESTIMATED score, not an official dMAT score.
 */
export class ApproximationScoringEngine implements ScoringEngine {
  calculateScaledScore(rawScore: number, totalQuestions: number, moduleType: 'core' | 'gam' | 'total'): ScaledResult {
    if (totalQuestions === 0) {
      return { rawScore: 0, totalQuestions: 0, scaledScore: 0, percentile: 0 };
    }

    let config = DEFAULT_CONFIG;
    if (moduleType === 'total') {
      config = {
        ...DEFAULT_CONFIG,
        scaledMean: 200,
        scaledSd: 66.6,
      };
    }

    const expectedMeanRaw = totalQuestions * config.expectedMeanPercentage;
    const expectedSdRaw = totalQuestions * config.expectedSdPercentage;
    
    let zScore = 0;
    if (expectedSdRaw > 0) {
      zScore = (rawScore - expectedMeanRaw) / expectedSdRaw;
    }

    let scaledScore = Math.round(config.scaledMean + (zScore * config.scaledSd));
    const maxScore = moduleType === 'total' ? 400 : 200;
    scaledScore = Math.max(0, Math.min(maxScore, scaledScore));

    let percentile = Math.floor(normalCdf(zScore) * 100);
    percentile = Math.max(0, Math.min(99, percentile));

    return {
      rawScore,
      totalQuestions,
      scaledScore,
      percentile,
    };
  }

  aggregateMockResults(coreResult: ScaledResult, gamResult: ScaledResult): CompleteMockResult {
    const totalRaw = coreResult.rawScore + gamResult.rawScore;
    const totalQs = coreResult.totalQuestions + gamResult.totalQuestions;
    
    const totalResult = this.calculateScaledScore(totalRaw, totalQs, 'total');

    return {
      core: coreResult,
      gam: gamResult,
      total: totalResult
    };
  }
}

export type ScoreEngineMode = 'approximation' | 'official_plugin' | 'experimental';

/**
 * Factory to get the active scoring engine based on configuration.
 */
export function getScoringEngine(mode: ScoreEngineMode = 'approximation'): ScoringEngine {
  if (mode === 'approximation' || mode === 'experimental') {
    return new ApproximationScoringEngine();
  }
  // Fallback to approximation until an official plugin is provided
  return new ApproximationScoringEngine();
}

/**
 * Utility for basic raw score calculations (used across engines).
 */
export function calculateRawScore(answers: Record<string, string>, correctAnswers: Record<string, string>): RawScore {
  let correct = 0;
  let incorrect = 0;
  let skipped = 0;
  const total = Object.keys(correctAnswers).length;

  for (const [id, correctOpt] of Object.entries(correctAnswers)) {
    const ans = answers[id];
    if (!ans) {
      skipped++;
    } else if (ans === correctOpt) {
      correct++;
    } else {
      incorrect++;
    }
  }

  return {
    correct,
    incorrect,
    skipped,
    total,
    accuracy: total > 0 ? (correct / total) * 100 : 0,
  };
}
