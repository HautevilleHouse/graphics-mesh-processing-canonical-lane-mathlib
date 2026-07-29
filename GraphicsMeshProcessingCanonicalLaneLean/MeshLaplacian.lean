import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure CotanWeight where
  edge : (Nat × Nat)
  weight : Float
  valid : Prop

structure MeshLaplacian where
  cotangentWeights : List CotanWeight
  areaWeights : List Float
  lumpedMassMatrix : Bool
  positiveSemidefinite : Prop
  eigenvalueBound : Prop
  positiveSemidefiniteTerm : positiveSemidefinite
  eigenvalueBoundTerm : eigenvalueBound

structure MeshLaplacianEvidence (L : MeshLaplacian) where
  weightsComputed : ∀ w ∈ L.cotangentWeights, w.valid
  massMatrixConsistent : L.lumpedMassMatrix
  laplacianClosed : L.positiveSemidefinite ∧ L.eigenvalueBound

def MeshLaplacianClosed (L : MeshLaplacian) : Prop :=
  (∀ w ∈ L.cotangentWeights, w.valid) ∧
  L.lumpedMassMatrix ∧
  L.positiveSemidefinite ∧
  L.eigenvalueBound

theorem mesh_laplacian_closed_from_evidence (L : MeshLaplacian) (E : MeshLaplacianEvidence L) : MeshLaplacianClosed L := by
  refine And.intro E.weightsComputed (And.intro E.massMatrixConsistent (And.intro E.laplacianClosed ?_))
  exact E.laplacianClosed

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse