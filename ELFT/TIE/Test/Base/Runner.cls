Include Ensemble

Class ELFT.TIE.Test.Base.Runner Extends %RegisteredObject
{

Property Hook As %String [ InitialExpression = "EnsLib.Testing.Service" ];

Property HookAPI As %String [ InitialExpression = "SendTestRequest" ];

Parameter Suite = "ELFT.TIE.Test.TestSuite";

Property Page As %String [ InitialExpression = "EnsPortal.VisualTrace.zen" ];

ClassMethod FindClasses(tSuite As %String = "") As %Status
{
 Set tStatus=$$$OK
 Set tQuery = "SELECT * from %Dictionary.CompiledClass where id like '"_tSuite_"%'"
 Set tResultSet=##Class(%ResultSet).%New()
 Set tStatus=tResultSet.Prepare(tQuery)
 Write:$$$ISERR(tStatus) tStatus,!
 Set tStatus=tResultSet.Execute()
 While tResultSet.Next() 
 {
 	If $Find(tResultSet.Data("ID"),tSuite)
	{
		Write tResultSet.Data("ID"),!
		Set tStatus = ..RunByName(tResultSet.Data("ID"),tSuite)
	}
     
 }
 	Quit tStatus
}

ClassMethod RunTestCase(pTests As %UnitTest.TestCase)
{
	#Dim tCompiledClassObj as %Dictionary.CompiledClass
	#Dim tMethod as %Dictionary.CompiledMethod 
	
	Set tCompiledClassObj = ##class(%Dictionary.CompiledClass).%OpenId(pTests.%ClassName(1))
	
	Set tKey = ""
	Do 
	{
    	Set tMethod = tCompiledClassObj.Methods.GetNext(.tKey)
    	If (tMethod '= "") 
    	{
        	Write tMethod.Name,!
        	If $Extract(tMethod.Name, 1, 4) = "Test" 
        	{
	        	Write "Test : "_tMethod.Name,!
	        	Do pTests.OnBeforeOneTest()
	        	Do $ZOBJMETHOD(pTests, tMethod.Name)
	        	Do pTests.OnAfterOneTest()
        	}
    	}
    
 	} While (tKey '= "")
 	
 	Do pTests.OnAfterAllTests()
}

ClassMethod GetServerURL(pIncludeNamespace As %Boolean = 0) As %String
{
	Set tStatus = ##class(%RoutineMgr).GetWebServerPort(.p, .h, .up, .tUrl)
	Set tUrl = $REPLACE(tUrl,"192.168.47.20","127.0.0.1")
 	If ($$$ISERR(tStatus)) || ($G(tUrl)="") Set tUrl = "http://127.0.0.1:52775/"
 	If pIncludeNamespace Set tUrl = tUrl_"csp/healthshare/"_$ZCONVERT($ZNSPACE,"l")_"/"
 	Quit tUrl
}

ClassMethod GetMeTrace(pSessionId As %String) As %String
{
	Quit ..GetServerURL(1)_##class(ELFT.TIE.Test.Base.Runner).%New().Page_"?SESSIONID="_pSessionId
}

ClassMethod SetTestRoot()
{
 	Set ^UnitTestRoot = "C:\Temp"
 	Set ^UnitTestRoot("Environment") = ""
}

ClassMethod RunByName(className As %String, suite As %String = "") As %Status
{
	Set tStatus = ##class(%UnitTest.Manager).DebugRunTestCase(suite,className, "/noload/norecursive")
	Quit tStatus
}

ClassMethod RunTests() As %String
{
	Do ..SetTestRoot()
	Do ..RunByName(..%ClassName(1))
	Write !, ""
	Set URL = ..GetServerURL(0)_"csp/sys/%25UnitTest.Portal.Indices.cls?Index="_$O(^UnitTest.Result(""),-1)_"&$NAMESPACE="_$ZNSPACE
	Quit URL
}

/// Run All Test Cases 
/// Set tStatus=##class(ELFT.TIE.Test.Base.Runner).RunAll()
ClassMethod RunAll() As %Status
{
	Set tStatus = $$$OK
	Set tStatus = ..FindClasses(..#Suite)
	Set tUrl = ..GetServerURL(0)_"csp/sys/%25UnitTest.Portal.Indices.cls?Index="_$O(^UnitTest.Result(""),-1)_"&$NAMESPACE="_$ZNSPACE
    Write !!, tUrl
	Quit tStatus
}

Method AssertFinalStep(pStatus As %Status, pTargetConfigName As %String, ByRef pOutcome As %Boolean = 0, ByRef pReason As %String = "", pResponse As %RegisteredObject, pSessionId As %String) As %Status
{
	
	If ^UnitTestRoot("Environment") = ""
	{
		Set (tACELFTeck,tStatusCheck,tQueueCheck)=0
		
		Set pReason="Check "
		Set pReason=pReason_"Message Delivered to Router "
		Set:($$$ISOK(pStatus)) tStatusCheck = 1
		
		If (tStatusCheck) 
		{
			If $IsObject(pResponse)  
				{
					If (pResponse.GetValueAt("MSA:1")="AA") 
					{
						Set pReason=pReason_"and ACK from Router "
						Set tACELFTeck = 1
					}
					
				 }
		}
		If (tACELFTeck) 
		{
			Set tQueueCheck = ##class(Ens.Queue).GetCount(pTargetConfigName) 
			If (tQueueCheck>0)
			{
				Do ##class(Ens.Queue).AbortQueue(pTargetConfigName)
				Set pReason=pReason_"and  Queue Count of "_pTargetConfigName
			}
		}
		If (tQueueCheck) 
		{
			Set tMessageCount=0
			Set pReason=pReason_" and Message Delivered to "_pTargetConfigName
			&SQL(SELECT Count(*) into :tMessageCount FROM Ens.MessageHeader where SessionId=:pSessionId and TargetConfigName=:pTargetConfigName )
		}
		
		If ((tStatusCheck)&& (tACELFTeck) && (tQueueCheck)&& (tMessageCount)) Set pOutcome=1
	}
	ElseIf ^UnitTestRoot("Environment") = "Staging"
	{
		Set tMessageCount=0
		Set pReason="Check if message successfully delivered to "_pTargetConfigName		
		&SQL(SELECT Count(*) into :tMessageCount FROM Ens.MessageHeader where SessionId=:pSessionId and TargetConfigName=:pTargetConfigName )
		Set pOutcome=tMessageCount
	}
	Quit $$$OK
}

}
