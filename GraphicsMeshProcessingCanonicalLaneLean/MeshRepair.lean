import GraphicsMeshProcessingCanonicalLaneLean.MeshAdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure RepairPackage where
  holeFilling : Prop
  nonManifoldResolution : Prop
  orientationConsistency : Prop
  repairClosed : Prop

structure RepairEvidence (R : RepairPackage) where
  holeFillingClosed : R.holeFilling
  nonManifoldResolutionClosed : R.nonManifoldResolution
  orientationConsistencyClosed : R.orientationConsistency

def RepairClosed (R : RepairPackage) : Prop :=
  R.holeFilling ∧ R.nonManifoldResolution ∧ R.orientationConsistency

theorem repair_closed_from_evidence (R : RepairPackage)
    (E : RepairEvidence R) : RepairClosed R := by
  exact And.intro E.holeFillingClosed
    (And.intro E.nonManifoldResolutionClosed E.orientationConsistencyClosed)

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse
