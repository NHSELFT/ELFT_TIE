/// 
Class ELFT.TIE.Process.RIOProcess Extends Ens.BusinessProcessBPL [ ClassType = persistent, ProcedureBlock ]
{

Method ContinuedOrders(pHL7Message As EnsLib.HL7.Message) As %Status
{
	
	Set tStatus=$$$OK
	Try
	{
		If (pHL7Message.DocType="2.3:RDS_O01") 	//Check DocType
		{
			Set tOrders=""
			For i=1:1:pHL7Message.GetValueAt("ORCgrp(*)") //No of Orders
		{
		Set tOrderType=pHL7Message.GetValueAt("ORCgrp("_i_").ORC:1")
		Set tOrders=tOrderType_","_tOrders
		Set ^Check(1)=tOrders
		}	
	
			If ($Find(tOrders,"NW,")||$Find(tOrders,"XO,")||$Find(tOrders,"MR,"))	//Check if Ordertype is Active
			{
			Set tStatus= 1	
			}
			Else
			{
			Set tStatus= 0
			$$$LOGINFO("Inactive Orders Are Not Allowed")
			}
		}
		Else 
		{
			Set tStatus= 0
			$$$LOGINFO("Message Type Not Allowed")
		}
	}
		Catch tException
		{
			Set tStatus = tException.AsStatus()
			Set tErrorText=$System.Status.GetErrorText(tStatus)
			$$$LOGERROR(tErrorText)
		}
	Quit tStatus
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='DischargeMedication' type='ELFT.TIE.Wrapper.RIO.Request.DischargeMedication' instantiate='0' />
</context>
<sequence xend='200' yend='700' >
<if name='If any Active Orders' condition='process.ContinuedOrders(request)' xpos='200' ypos='250' xend='200' yend='600' >
<true>
<transform name='DischargeMedication' class='ELFT.TIE.Transform.JACToRioDischargeMedication' source='request' target='context.DischargeMedication' xpos='335' ypos='400' />
<call name='Call Rio' target='To_RIO_SOAP_DischargeMed' async='1' xpos='335' ypos='500' >
<request type='ELFT.TIE.Wrapper.RIO.Request.DischargeMedication' >
<assign property="callrequest" value="context.DischargeMedication" action="set" />
</request>
<response type='Ens.Response' />
</call>
</true>
</if>
</sequence>
</process>
}

}
