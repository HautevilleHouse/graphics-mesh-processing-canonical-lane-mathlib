import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure DeformationModel where
  elasticEnergy : Prop
  bendingEnergy : Prop
  isometryConstraint : Prop

structure DeformationEvidence (D : DeformationModel) where
  elasticEnergyClosed : D.elasticEnergy
  bendingEnergyClosed : D.bendingEnergy
  isometryConstraintClosed : D.isometryConstraint

def DeformationClosed (D : DeformationModel) : Prop :=
  D.elasticEnergy ∧ D.bendingEnergy ∧ D.isometryConstraint

theorem deformation_closed_from_evidence (D : DeformationModel) (E : DeformationEvidence D) :
    DeformationClosed D := by
  exact And.intro E.elasticEnergyClosed (And.intro E.bendingEnergyClosed E.isometryConstraintClosed)

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse