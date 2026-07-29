import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure DecimationSimplificationPackage {M : MeshTopologyPackage} where
  simplificationAlgorithm : String
  targetVertexCount : ℕ
  originalVertexCount : ℕ
  resultingVertexCount : ℕ
  errorMetric : M.vertexSet → M.vertexSet → ℝ
  maxError : ℝ
  topologyPreserved : Bool

structure DecimationSimplificationEvidence {M : MeshTopologyPackage}
    (D : DecimationSimplificationPackage M) where
  vertexReductionClosed : D.resultingVertexCount = D.targetVertexCount
  errorBoundClosed : ∀ v, D.errorMetric v v ≤ D.maxError
  topologyPreservedClosed : D.topologyPreserved = true

def DecimationSimplificationClosed {M : MeshTopologyPackage}
    (D : DecimationSimplificationPackage M) : Prop :=
  D.resultingVertexCount = D.targetVertexCount ∧
  (∀ v, D.errorMetric v v ≤ D.maxError) ∧
  D.topologyPreserved = true

theorem decimation_simplification_closed_from_evidence {M : MeshTopologyPackage}
    (D : DecimationSimplificationPackage M) (E : DecimationSimplificationEvidence D) :
    DecimationSimplificationClosed D := by
  exact And.intro E.vertexReductionClosed (And.intro E.errorBoundClosed E.topologyPreservedClosed)

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse
