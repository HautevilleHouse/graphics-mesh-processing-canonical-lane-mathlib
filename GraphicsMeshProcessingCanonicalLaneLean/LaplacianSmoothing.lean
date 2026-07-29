import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphicsMeshProcessingCanonicalLaneLean.MeshTopology

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure LaplacianSmoothingPackage where
  mesh : MeshTopologyPackage
  laplacianMatrix : Type u
  smoothingIterations : Nat
  convergenceRate : Prop
  volumePreservation : Prop
  fairingCondition : Prop
  laplacianComputed : Prop
  smoothingConverges : Prop
  volumePreserved : Prop
  fairingSatisfied : Prop

structure LaplacianSmoothingEvidence (L : LaplacianSmoothingPackage) where
  laplacianComputedClosed : L.laplacianComputed
  smoothingConvergesClosed : L.smoothingConverges
  volumePreservedClosed : L.volumePreserved
  fairingSatisfiedClosed : L.fairingSatisfied

def LaplacianSmoothingClosed (L : LaplacianSmoothingPackage) : Prop :=
  L.laplacianComputed ∧ L.smoothingConverges ∧ L.volumePreserved ∧ L.fairingSatisfied

theorem laplacian_smoothing_closed_from_evidence (L : LaplacianSmoothingPackage) (E : LaplacianSmoothingEvidence L) : LaplacianSmoothingClosed L := by
  exact And.intro E.laplacianComputedClosed
    (And.intro E.smoothingConvergesClosed
      (And.intro E.volumePreservedClosed E.fairingSatisfiedClosed))

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse