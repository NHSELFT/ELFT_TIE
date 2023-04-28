/// 
Class ELFT.TIE.Process.PKB.Hl7Packager Extends (Ens.BusinessProcessBPL, ELFT.TIE.Helper.Util) [ ClassType = persistent, ProcedureBlock ]
{

Method ConstructSOAP(pHL7Message As EnsLib.HL7.Message) As Ens.StringRequest
{
	Set tRoot = ##class(ELFT.TIE.Wrapper.PKB.Request.Envelope).%New()
	Set tBody = ##class(ELFT.TIE.Wrapper.PKB.Request.Body).%New()
	Set tAcceptMessage = ##class(ELFT.TIE.Wrapper.PKB.Request.acceptMessage).%New() 
	Set tAcceptMessage.arg0 = ##class(ELFT.TIE.Helper.Util).ConvertHL7ToString(pHL7Message)
	Set tBody.acceptMessage = tAcceptMessage
	Set tRoot.Body = tBody
	Set tStatus = tRoot.XMLExportToString(.tString)
	Set tMessage = ##class(Ens.StringRequest).%New() 
	Set tMessage.StringValue = tString
	Quit tMessage
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='EnsLib.HL7.Message' height='2000' width='2000' >
<context>
<property name='HL7Soap' type='Ens.StringRequest' instantiate='0' />
</context>
<sequence xend='200' yend='450' >
<assign name="Get SOAP Payload" property="context.HL7Soap" value="process.ConstructSOAP(request)" action="set" xpos='200' ypos='250' />
<call name='Post HL7 Message' target='To_PKB_ALL_HTTP' async='1' xpos='200' ypos='350' >
<request type='Ens.StringRequest' >
<assign property="callrequest" value="context.HL7Soap" action="set" />
</request>
<response type='EnsLib.HL7.Message' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</sequence>
</process>
}

}
