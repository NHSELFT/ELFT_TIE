Class ELFT.TIE.Transform.JACToRioDischargeMedication Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, ELFT.TIE.Wrapper.RIO.Request.DischargeMedication) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='ELFT.TIE.Wrapper.RIO.Request.DischargeMedication' sourceDocType='2.3:RDS_O01' create='new' language='objectscript' >
<assign value='source.{MSH:DateTimeofMessage.timeofanevent}' property='target.DateTimeOfMessage' action='set' />
<foreach property='source.{PIDgrp.PID:PatientIDInternalID()}' key='k2' >
<assign value='source.{PIDgrp.PID:PatientIDInternalID(k2).ID}' property='target.HospitalNo' action='set' />
</foreach>
<foreach property='source.{PIDgrp.AL1()}' key='k3'  expanded='false' >
<assign value='source.{PIDgrp.AL1(k3):AllergyCodeMnemonicDescripti.text}' property='target.Allergies.(k3).AllergyDesc' action='set' />
<assign value='source.{PIDgrp.AL1(k3):AllergyType}' property='target.Allergies.(k3).AllergyType' action='set' />
<assign value='source.{PIDgrp.AL1(k3):AllergyReaction}' property='target.Allergies.(k3).AllergyReaction' action='set' />
</foreach>
<assign value='1' property='tCounter' action='set' />
<foreach property='source.{ORCgrp()}' key='k1' >
<if condition='(source.{ORCgrp(k1).ORC:1}="NW") || (source.{ORCgrp(k1).ORC:1}="XO") || (source.{ORCgrp(k1).ORC:1}="MR")' >
<true>
<assign value='source.{ORCgrp(k1).RXD:DispenseGiveCode.text}' property='target.Medications.(tCounter).DrugName' action='set' />
<assign value='source.{ORCgrp(k1).RXD:DispenseNotes().identifier}' property='target.Medications.(tCounter).Frequency' action='set' />
<assign value='source.{ORCgrp(k1).RXD:ActualDispenseAmount}_source.{ORCgrp(k1).RXD:ActualDispenseUnits.text}' property='target.Medications.(tCounter).Dose' action='set' />
<assign value='source.{ORCgrp(k1).RXD:NumberofRefillsRemaining}' property='target.Medications.(tCounter).NoOfDaysSupplied' action='set' />
<assign value='source.{ORCgrp(k1).RXD:PharmacyTreatmentSuppliersSp().text}' property='target.Medications.(tCounter).GPToContinuePrescribing' action='set' />
<foreach property='source.{PIDgrp.NTE()}' key='k4' >
<if condition='source.{PIDgrp.NTE(k4):SetIDNotesandComments}=source.{ORCgrp(k1).RXD:PrescriptionNumber}' >
<true>
<assign value='source.{PIDgrp.NTE(k4):3.2}' property='target.Medications.(tCounter).DrugNote' action='set' />
</true>
</if>
</foreach>
<foreach property='source.{ORCgrp(k1).RXR()}' key='k5' >
<assign value='source.{ORCgrp(k1).RXR(k5):Route.text}' property='target.Medications.(tCounter).Route' action='set' />
</foreach>
<assign value='tCounter+1' property='tCounter' action='set' />
</true>
</if>
</foreach>
</transform>
}

}
