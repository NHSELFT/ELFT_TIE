Class ELFT.TIE.Transform.PKB.SIU.RiOA11ToPKBS15 Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.4_TIE:ADT_A01' targetDocType='2.4_TIE:SIU_S12' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='"SIU"' property='target.{MSH:MessageType.messagetype}' action='set' />
<assign value='"S15"' property='target.{MSH:MessageType.triggerevent}' action='set' />
<assign value='source.{PID}' property='target.{PIDgrp(1).PID}' action='set' />
<assign value='source.{PV1}' property='target.{PIDgrp(1).PV1}' action='set' />
<assign value='source.{PV1:VisitNumber.ID}' property='target.{SCH:PlacerAppointmentID.entityidentifier}' action='set' />
</transform>
}

}
