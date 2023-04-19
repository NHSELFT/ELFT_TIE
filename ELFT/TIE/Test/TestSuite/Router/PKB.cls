/// Each Test Method is a Scenario
/// Syntax to Run this Test case --w ##class(ELFT.TIE.Test.TestSuite.Router.PKB).RunTests()
/// Above command will invoke all Methods in this class that begins with the word "Test"
/// Example : 
/// TestNumberEquals() {
/// Set x=y=1
/// do $$$AssertEquals(x,y,"x equals y")
/// 	}
/// 
Class ELFT.TIE.Test.TestSuite.Router.PKB Extends ELFT.TIE.Test.Base.TestCase
{

Property ServiceName As %String [ InitialExpression = "From_RiO_ADT_TCP_HL7" ];

Property PKBRouter As %String [ InitialExpression = "PKB_Router" ];

Property Operation As %String [ InitialExpression = "To_PKB_ALL_HTTP" ];

/*
Method TestValidADTA28InterfacefromService() As %Status
{
	Set tStatus = $$$OK
	Set tResponse = ##class(EnsLib.HL7.Message).%New()	
	Set tHL7Message = ..QuitHL7AsObject("A28FromRiOTestMessage")
	Set tStatus = ..SendRequestToRouter(..ServiceName,..PKBRouter,tHL7Message,.tSessionId,.tResponse)
	Do ..AssertFinalStep(tStatus,..Operation,.tOutcome,.tReason,tResponse,tSessionId)

	Do $$$LogMessage(tReason)
	Do $$$AssertTrue(tOutcome)	
	Quit tStatus
}

Method TestValidADTA31InterfacefromService() As %Status
{
	Set tStatus = $$$OK
	Set tResponse = ##class(EnsLib.HL7.Message).%New()	
	Set tHL7Message = ..QuitHL7AsObject("A31FromRiOTestMessage")
	Set tStatus = ..SendRequestToRouter(..ServiceName,..PKBRouter,tHL7Message,.tSessionId,.tResponse)
	Do ..AssertFinalStep(tStatus,..Operation,.tOutcome,.tReason,tResponse,tSessionId)

	Do $$$LogMessage(tReason)
	Do $$$AssertTrue(tOutcome)	
	Quit tStatus
}


Method TestValidADTA04toSIUS12InterfacefromService() As %Status
{
	Set tStatus = $$$OK
	Set tResponse = ##class(EnsLib.HL7.Message).%New()	
	Set tHL7Message = ..QuitHL7AsObject("A04FromRiOTestMessage")
	Set tStatus = ..SendRequestToRouter(..ServiceName,..PKBRouter,tHL7Message,.tSessionId,.tResponse)
	Do ..AssertFinalStep(tStatus,..Operation,.tOutcome,.tReason,tResponse,tSessionId)

	Do $$$LogMessage(tReason)
	Do $$$AssertTrue(tOutcome)	
	Quit tStatus
}

Method TestValidADTA08toSIUS13InterfacefromService() As %Status
{
	Set tStatus = $$$OK
	Set tResponse = ##class(EnsLib.HL7.Message).%New()	
	Set tHL7Message = ..QuitHL7AsObject("A08FromRiOTestMessage")
	Set tStatus = ..SendRequestToRouter(..ServiceName,..PKBRouter,tHL7Message,.tSessionId,.tResponse)
	Do ..AssertFinalStep(tStatus,..Operation,.tOutcome,.tReason,tResponse,tSessionId)

	Do $$$LogMessage(tReason)
	Do $$$AssertTrue(tOutcome)	
	Quit tStatus
}

Method TestValidADTA11toSIUS15InterfacefromService() As %Status
{
	Set tStatus = $$$OK
	Set tResponse = ##class(EnsLib.HL7.Message).%New()	
	Set tHL7Message = ..QuitHL7AsObject("A11FromRiOForCancelAppointmentTestMessage")
	Set tStatus = ..SendRequestToRouter(..ServiceName,..PKBRouter,tHL7Message,.tSessionId,.tResponse)
	Do ..AssertFinalStep(tStatus,..Operation,.tOutcome,.tReason,tResponse,tSessionId)

	Do $$$LogMessage(tReason)
	Do $$$AssertTrue(tOutcome)	
	Quit tStatus
}

Method TestValidADTA08toSIUS26InterfacefromService() As %Status
{
	Set tStatus = $$$OK
	Set tResponse = ##class(EnsLib.HL7.Message).%New()	
	Set tHL7Message = ..QuitHL7AsObject("A11FromRiOForDNAAppointmentTestMessage")
	Set tStatus = ..SendRequestToRouter(..ServiceName,..PKBRouter,tHL7Message,.tSessionId,.tResponse)
	Do ..AssertFinalStep(tStatus,..Operation,.tOutcome,.tReason,tResponse,tSessionId)

	Do $$$LogMessage(tReason)
	Do $$$AssertTrue(tOutcome)	
	Quit tStatus
}
*/
Method TestADTRemoveMSHNegative() As %Status
{
	Set tStatus = $$$OK
	#Dim tHL7Message As EnsLib.HL7.Message
	Set tResponse = ##class(EnsLib.HL7.Message).%New()
	Set tHL7Message = ..QuitHL7AsObject("A28FromRiOTestMessage")
	Set tStatus = tHL7Message.RemoveSegmentAt("MSH")
	
	//Check MSH is not present
	Do $$$LogMessage("Check If MSH Removed")
	Do $$$AssertEquals(tHL7Message.GetValueAt("MSH"),"")
	
	Set tStatus = ..SendRequestToRouter(..ServiceName,..PKBRouter,tHL7Message,.tSessionId,.tResponse)
	Do $$$LogMessage("Check if the message will fail without MSH segment")
	Do ..AssertFinalStep(tStatus,..Operation,.tOutcome,.tReason,tResponse,tSessionId)

	Do $$$LogMessage(tReason)
	Do $$$AssertNotTrue(tOutcome)	
	Quit tStatus
}

Method TestADTRemovePIDNegative() As %Status
{
	Set tStatus = $$$OK
	#Dim tHL7Message As EnsLib.HL7.Message
	Set tResponse = ##class(EnsLib.HL7.Message).%New()
	Set tHL7Message = ..QuitHL7AsObject("A28FromRiOTestMessage")
	Set tStatus = tHL7Message.RemoveSegmentAt("PID")
	
	//Check PID is not present
	Do $$$LogMessage("Check If PID Removed")
	Do $$$AssertEquals(tHL7Message.GetValueAt("PID"),"")
	
	Set tStatus = ..SendRequestToRouter(..ServiceName,..PKBRouter,tHL7Message,.tSessionId,.tResponse)
	Do $$$LogMessage("Check if the message will fail without PID segment")
	Do ..AssertFinalStep(tStatus,..Operation,.tOutcome,.tReason,tResponse,tSessionId)

	Do $$$LogMessage(tReason)
	Do $$$AssertNotTrue(tOutcome)	
	Quit tStatus
}

Method TestIntefaceforTextMessage() As %Status
{
	Set tStatus = $$$OK
	Set tResponse = ##class(EnsLib.HL7.Message).%New()
	Set tTextMessage = "HI!! I am Text Message. My only purpose is to try to break this interface.Lets see If I can."
	Do $$$LogMessage("Passing the bad text message")
	Set tStatus = ..SendRequestToRouter(..ServiceName,..PKBRouter,tTextMessage,.tSessionId,.tResponse)
	Do $$$LogMessage("Check if the message will fail if a text message comes")
	Do ..AssertFinalStep(tStatus,..Operation,.tOutcome,.tReason,tResponse,tSessionId)

	Do $$$LogMessage(tReason)
	Do $$$AssertNotTrue(tOutcome)	
	
	Quit tStatus
}

}
