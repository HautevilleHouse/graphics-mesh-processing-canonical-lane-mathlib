import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphicsMeshProcessingCanonicalLaneLean.MeshTopology

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure RemeshingPackage where
  inputMesh : MeshTopologyPackage
  outputMesh : MeshTopologyPackage
  vertexCountTarget : Nat
  edgeCountTarget : Nat
  surfaceApproximationError : Prop
  featurePreservation : Prop
  topologyPreservation : Prop
  targetVertexCountReached : Prop
  targetEdgeCountReached : Prop
  approximationErrorBound : Prop
  featuresPreserved : Prop
  topologyPreserved : Prop

structure RemeshingEvidence (R : RemeshingPackage) where
  targetVertexCountReachedClosed : R.targetVertexCountReached
  targetEdgeCountReachedClosed : R.targetEdgeCountReached
  approximationErrorBoundClosed : R.approximationErrorBound
  featuresPreservedClosed : R.featuresPreserved
  topologyPreservedClosed : R.topologyPreserved

def RemeshingClosed (R : RemeshingPackage) : Prop :=
  R.targetVertexCountReached ∧ R.targetEdgeCountReached ∧
  R.approximationErrorBound ∧ R.featuresPreserved ∧ R.topologyPreserved

theorem remeshing_closed_from_evidence (R : RemeshingPackage) (E : RemeshingEvidence R) : RemeshingClosed R := by
  exact And.intro E.targetVertexCountReachedClosed
    (And.intro E.targetEdgeCountReachedClosed
      (And.intro E.approximationErrorBoundClosed
        (And.intro E.featuresPreservedClosed E.topologyPreservedClosed)))

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse