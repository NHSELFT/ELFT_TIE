/// Each Test Method is a Scenario
/// Syntax to Run this Test case --  w ##class(ELFT.TIE.Test.TestSuite.Transform.PKB.SIU.RiOA11toPKBS26).RunTests()
/// Above command will invoke all Methods in this class that begins with the word "Test"
/// Example : 
/// TestNumberEquals() {
/// Set x=y=1
/// do $$$AssertEquals(x,y,"x equals y")
/// 	}
/// 
Class ELFT.TIE.Test.TestSuite.Transform.PKB.SIU.RiOA11toPKBS26 Extends ELFT.TIE.Test.Base.TestCase
{

Method TestMessageMappingsForA11toS15Transformation() As %Status
{
	
	Set tStatus = $$$OK
	Set tTargetHL7Message = ##class(EnsLib.HL7.Message).%New()
	Set tHL7Message = ..QuitHL7AsObject("A11FromRiOForDNAAppointmentTestMessage")
	Set tStatus = ##class(ELFT.TIE.Transform.PKB.SIU.RiOA11ToPKBS26).Transform(tHL7Message,.tTargetHL7Message)

	//Check Transform Success
	Do $$$LogMessage("Check Transform Success"_tStatus)
	Do $$$AssertEquals(tStatus,$$$OK)

	//Check MessageType
	Do $$$LogMessage("Check MessageType")
	Do $$$AssertEquals("SIU",tTargetHL7Message.GetValueAt("MSH:MessageType.messagetype"))	
	Do $$$AssertEquals("S26",tTargetHL7Message.GetValueAt("MSH:MessageType.triggerevent"))
	
	//Check AppointmentID
	Do $$$AssertEquals(tHL7Message.GetValueAt("PV1:VisitNumber.ID"),tTargetHL7Message.GetValueAt("SCH:PlacerAppointmentID.entityidentifier"))	
	

    Quit tStatus
}

}
