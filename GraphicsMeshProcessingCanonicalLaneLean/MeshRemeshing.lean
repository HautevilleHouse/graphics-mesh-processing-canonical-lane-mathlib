import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure RemeshingStrategy where
  vertexInsertion : Prop
  edgeFlip : Prop
  regularization : Prop

structure RemeshingEvidence (R : RemeshingStrategy) where
  vertexInsertionClosed : R.vertexInsertion
  edgeFlipClosed : R.edgeFlip
  regularizationClosed : R.regularization

def RemeshingClosed (R : RemeshingStrategy) : Prop :=
  R.vertexInsertion ∧ R.edgeFlip ∧ R.regularization

theorem remeshing_closed_from_evidence (R : RemeshingStrategy) (E : RemeshingEvidence R) :
    RemeshingClosed R := by
  exact And.intro E.vertexInsertionClosed (And.intro E.edgeFlipClosed E.regularizationClosed)

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse