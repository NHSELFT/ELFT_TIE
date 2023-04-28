Class ELFT.TIE.Test.Base.TestCase Extends (%UnitTest.TestCase, ELFT.TIE.Test.Base.Runner, ELFT.TIE.Test.Data.Host)
{

Property Protocol As %String [ InitialExpression = "TCP" ];

Property Production As %String [ InitialExpression = "ELFT.TIE.Production.DevIE" ];

Property IPAddress As %String [ InitialExpression = "127.0.0.1" ];

Property Socket As %String [ InitialExpression = "Port" ];

Method SendRequestToEnsemble(pProcessName As %String, pRequest As %RegisteredObject, ByRef pSessionId As %String, ByRef pResponse As %RegisteredObject) As %Status
{
	Quit $ClassMethod(..Hook,..HookAPI,pProcessName,pRequest,.pResponse,.pSessionId,1)
}

Method SendRequestToRouter(pServiceName As %String, pProcessName As %String, pRequest As %RegisteredObject, ByRef pSessionId As %String, ByRef pResponse As %RegisteredObject) As %Status
{
	Set tStatus = ##class(Ens.Director).CreateBusinessService(pServiceName, .tService)  Quit:$$$ISERR(tStatus)
	Set tStatus = tService.SendRequestSync(pProcessName,pRequest,.pResponse)
	Set pSessionId = tService.%SessionId
	Quit tStatus
}

Method SendRequestToService(pIPAddress As %String, pSocket As %String, pMessage As %String) As %Status
{
	//Set pSocket = 8000
	Set tSocket = "|"_..Protocol_"|"_pSocket, tStatus = $$$OK
	
	Write !!, pIPAddress_":"_tSocket
    Open tSocket:(pIPAddress:pSocket:"PSTE"):1 Else  Quit ##class(%SYSTEM.Status).Error(11,"TCP Connection Failed")
    Try
    {
   		Use tSocket
    	Write pMessage
    	Close tSocket
    }
    Catch Exception
    {
	    Set tStatus = ##class(%SYSTEM.Error).FromException(Exception)
    }
    Quit tStatus
}

Method UpdateConfigSettings(pItemName As %String, pSettingsValue As %String, pSettingsName As %String) As %Status
{
	Set tStatus = $$$OK

	&SQL(Select ID into :tID from Ens_Config.Item Where Name = :pItemName)

	Set tItemSettings = ##Class(Ens.Config.Item).%OpenId(tID)
	For tI=1:1:tItemSettings.Settings.Count()
	{
	If tItemSettings.Settings.GetAt(tI).Name = pSettingsName
	{
	Set tItemSettings.Settings.GetAt(tI).Value = pSettingsValue
	Set tStatus = tItemSettings.%Save()
	Quit
	}
	}
	Quit tStatus
}

}
