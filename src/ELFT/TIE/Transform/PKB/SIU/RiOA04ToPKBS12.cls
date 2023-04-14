Class ELFT.TIE.Transform.PKB.SIU.RiOA04ToPKBS12 Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.4_TIE:ADT_A01' targetDocType='2.4:SIU_S12' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='"SIU"' property='target.{MSH:MessageType.messagetype}' action='set' />
<assign value='"S12"' property='target.{MSH:MessageType.triggerevent}' action='set' />
<assign value='source.{PID}' property='target.{PIDgrp(1).PID}' action='set' />
<assign value='source.{PV1}' property='target.{PIDgrp(1).PV1}' action='set' />
<assign value='source.{PV1:VisitNumber.ID}' property='target.{SCH:PlacerAppointmentID.entityidentifier}' action='set' />
<assign value='source.{PV1:AdmitDateTime}' property='target.{SCH:AppointmentTimingQuantity(1).startdatetime}' action='set' />
<assign value='source.{ZU3:8}' property='target.{SCH:AppointmentType}' action='set' />

<assign value='source.{PV1:ConsultingDoctor(1).familyname}' property='target.{RGSgrp(1).AIPgrp(1).AIP:PersonnelResourceID(1).familyname}' action='set' />
<assign value='source.{PV1:ConsultingDoctor(1).givenname}' property='target.{RGSgrp(1).AIPgrp(1).AIP:PersonnelResourceID(1).givenname}' action='set' />
<assign value='source.{PV1:ConsultingDoctor(1).IDnumberST}' property='target.{RGSgrp(1).AIPgrp(1).AIP:PersonnelResourceID(1).IDnumberST}' action='set' />
<assign value='source.{PV1:ConsultingDoctor(1).prefix}' property='target.{RGSgrp(1).AIPgrp(1).AIP:PersonnelResourceID(1).prefix}' action='set' />
<assign value='source.{PV1:ConsultingDoctor(1).suffix}' property='target.{RGSgrp().AIPgrp(1).AIP:PersonnelResourceID(1).suffix}' action='set' />
<assign value='source.{PV1:ConsultingDoctor(1).secondandfurthergivennamesor}' property='target.{RGSgrp(1).AIPgrp(1).AIP:PersonnelResourceID(1).secondandfurthergivennamesor}' action='set' />
</transform>
}

}
