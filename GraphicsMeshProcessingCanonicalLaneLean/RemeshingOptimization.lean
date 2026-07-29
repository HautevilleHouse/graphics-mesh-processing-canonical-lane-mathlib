import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure RemeshingOptimizationPackage {M : MeshTopologyPackage} where
  elementQualityMeasure : M.vertexSet → ℝ
  targetQuality : ℝ
  optimizationAlgorithm : String
  qualityThreshold : ℝ
  iterationCount : ℕ
  convergeStatus : Bool

structure RemeshingOptimizationEvidence {M : MeshTopologyPackage}
    (R : RemeshingOptimizationPackage M) where
  qualityThresholdClosed : ∀ v, R.elementQualityMeasure v ≥ R.qualityThreshold
  convergeStatusClosed : R.convergeStatus = true

def RemeshingOptimizationClosed {M : MeshTopologyPackage}
    (R : RemeshingOptimizationPackage M) : Prop :=
  (∀ v, R.elementQualityMeasure v ≥ R.qualityThreshold) ∧ R.convergeStatus = true

theorem remeshing_optimization_closed_from_evidence {M : MeshTopologyPackage}
    (R : RemeshingOptimizationPackage M) (E : RemeshingOptimizationEvidence R) :
    RemeshingOptimizationClosed R := by
  exact And.intro E.qualityThresholdClosed E.convergeStatusClosed

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse
