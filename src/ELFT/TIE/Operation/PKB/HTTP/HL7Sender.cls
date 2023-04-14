Class ELFT.TIE.Operation.PKB.HTTP.HL7Sender Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Property AccessToken As %String(MAXLEN = 100);

Parameter INVOCATION = "Queue";

// Parameter SETTINGS = "AccessToken";

Method SendHL7Message(pRequest As Ens.StringRequest, pResponse As EnsLib.HL7.Message) As %Status
{
	Set tHTTPRequest = ##class(%Net.HttpRequest).%New(), tHTTPResponse = ""
	Set pResponse = ##class(Ens.Response).%New()
	//Set tURL = "https://sandbox.patientsknowbest.com:7443/services/hl7"
	Set tURL = "https://"_..Adapter.HTTPServer_":"_..Adapter.HTTPPort_..Adapter.URL
	
	Set tString = pRequest.StringValue
	$$$TRACE("URL is "_tURL)
	//Do pRequest.Stream.Rewind()
	
	Do tHTTPRequest.EntityBody.Write(pRequest.StringValue)
	Set tHTTPRequest.ContentType = "text/xml"
	Set tHTTPRequest.Username = ..Adapter.%CredentialsObj.Username
	Set tHTTPRequest.Password= ..Adapter.%CredentialsObj.Password
	Set tStatus = ..Adapter.SendFormDataArray(.tHTTPResponse,"POST",tHTTPRequest,"","",tURL)
	//$$$TRACE("Status of Response is "_tStatus)
	If $$$ISERR(tStatus)
	{
		$$$TRACE(##class(%SYSTEM.Status).GetErrorText(tStatus))
	}
	
	Quit:($$$ISERR(tStatus) || tHTTPResponse = "") tStatus
	If (tHTTPResponse.StatusCode '= 200) && (tHTTPResponse.StatusCode '= 201)
	{
		$$$TRACE(tHTTPResponse.StatusCode)
		Set tSize = tHTTPResponse.Data.Size
		$$$TRACE(tHTTPResponse.Data.Read(tSize))
		Set tStatus = ##Class(%SYSTEM.Status).Error($$$GeneralError,tHTTPResponse.ReasonPhrase)
		$$$TRACE(tHTTPResponse.ReasonPhrase)
	}
	ElseIF (tHTTPResponse.StatusCode = 200)
	{
		Set tRequest = ##class(ELFT.TIE.Wrapper.PKB.Response.Envelope).%New()
		Set pResponse= ##class(EnsLib.HL7.Message).%New()
		Set tSize = tHTTPResponse.Data.Size
		Set tTotalString = tHTTPResponse.Data.Read(tSize)
		Set tHL7String = $P($P(tTotalString,"<return>",2),"</return>",1)
		Set pResponse= ##class(EnsLib.HL7.Message).ImportFromString(tHL7String,.tStatus)
		Set pResponse.DocType = "2.4:ACK"
	}
	
	$$$TRACE("Response Status Code is "_tHTTPResponse.StatusCode)
	Quit tStatus
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Ens.StringRequest">
    <Method>SendHL7Message</Method>
  </MapItem>
</MapItems>
}

}
