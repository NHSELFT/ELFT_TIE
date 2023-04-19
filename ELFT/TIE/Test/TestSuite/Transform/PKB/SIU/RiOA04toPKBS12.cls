/// Each Test Method is a Scenario
/// Syntax to Run this Test case --  w ##class(ELFT.TIE.Test.TestSuite.Transform.PKB.SIU.RiOA04toPKBS12).RunTests()
/// Above command will invoke all Methods in this class that begins with the word "Test"
/// Example : 
/// TestNumberEquals() {
/// Set x=y=1
/// do $$$AssertEquals(x,y,"x equals y")
/// 	}
/// 
Class ELFT.TIE.Test.TestSuite.Transform.PKB.SIU.RiOA04toPKBS12 Extends ELFT.TIE.Test.Base.TestCase
{

Method TestMessageMappingsForA04toS12Transformation() As %Status
{
	
	Set tStatus = $$$OK
	Set tTargetHL7Message = ##class(EnsLib.HL7.Message).%New()
	Set tHL7Message = ..QuitHL7AsObject("A04FromRiOTestMessage")
	Set tStatus = ##class(ELFT.TIE.Transform.PKB.SIU.RiOA04ToPKBS12).Transform(tHL7Message,.tTargetHL7Message)

	//Check Transform Success
	Do $$$LogMessage("Check Transform Success"_tStatus)
	Do $$$AssertEquals(tStatus,$$$OK)

	//Check MessageType
	Do $$$LogMessage("Check MessageType")
	Do $$$AssertEquals("SIU",tTargetHL7Message.GetValueAt("MSH:MessageType.messagetype"))	
	Do $$$AssertEquals("S12",tTargetHL7Message.GetValueAt("MSH:MessageType.triggerevent"))
	
	//Check AppointmentID
	Do $$$AssertEquals(tHL7Message.GetValueAt("PV1:VisitNumber.ID"),tTargetHL7Message.GetValueAt("SCH:PlacerAppointmentID.entityidentifier"))	
	
	//Check Appointment Time
	Do $$$AssertEquals(tHL7Message.GetValueAt("PV1:AdmitDateTime"),tTargetHL7Message.GetValueAt("SCH:AppointmentTimingQuantity(1).startdatetime"))	
    
   	//Check Appointment Type
	Do $$$AssertEquals(tHL7Message.GetValueAt("ZU3:8"),tTargetHL7Message.GetValueAt("SCH:AppointmentType"))	

	//Check Family Name of Consulting Doctor
	Do $$$AssertEquals(tHL7Message.GetValueAt("PV1:ConsultingDoctor(1).familyname.surname"),tTargetHL7Message.GetValueAt("RGSgrp(1).AIPgrp(1).AIP:PersonnelResourceID(1).familyname(1).surname"))	

	//Check Given Name of Consulting Doctor
	Do $$$AssertEquals(tHL7Message.GetValueAt("PV1:ConsultingDoctor(1).givenname"),tTargetHL7Message.GetValueAt("RGSgrp(1).AIPgrp(1).AIP:PersonnelResourceID(1).givenname"))	

	//Check ID of Consulting Doctor
	Do $$$AssertEquals(tHL7Message.GetValueAt("PV1:ConsultingDoctor(1).IDnumberST"),tTargetHL7Message.GetValueAt("RGSgrp(1).AIPgrp(1).AIP:PersonnelResourceID(1).IDnumberST"))	

	//Check Prefix of Consulting Doctor
	Do $$$AssertEquals(tHL7Message.GetValueAt("PV1:ConsultingDoctor(1).prefix"),tTargetHL7Message.GetValueAt("RGSgrp(1).AIPgrp(1).AIP:PersonnelResourceID(1).prefix"))	

	//Check Suffix of Consulting Doctor
	Do $$$AssertEquals(tHL7Message.GetValueAt("PV1:ConsultingDoctor(1).suffix"),tTargetHL7Message.GetValueAt("RGSgrp(1).AIPgrp(1).AIP:PersonnelResourceID(1).suffix"))	

	
    Quit tStatus
}

}
