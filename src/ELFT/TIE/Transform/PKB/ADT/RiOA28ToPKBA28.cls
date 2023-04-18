Class ELFT.TIE.Transform.PKB.ADT.RiOA28ToPKBA28 Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.4_TIE:ADT_A05' targetDocType='2.4_TIE:ADT_A05' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='source.{EVN}' property='target.{EVN}' action='set' />
<assign value='source.{MSH:DateTimeOfMessage.timeofanevent}' property='target.{EVN:RecordedDateTime}' action='set' />
<assign value='source.{MSH:MessageType}' property='target.{EVN:EventTypeCode}' action='set' />
<assign value='source.{PID}' property='target.{PID}' action='set' />
<assign value='source.{AL1()}' property='target.{AL1()}' action='set' />
<assign value='source.{DG1()}' property='target.{DG1()}' action='set' />
<assign value='source.{ZRX}' property='target.{ZRX}' action='set' />
<assign value='source.{ZTM}' property='target.{ZTM}' action='set' />
</transform>
}

}
