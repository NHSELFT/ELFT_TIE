Class ELFT.TIE.Wrapper.RIO.Request.DischargeMedication Extends Ens.Request
{

Parameter XMLNAME = "DischargeMedication";

Parameter XMLSEQUENCE = 1;

Property HospitalNo As %String;

Property DateTimeOfMessage As %String;

Property Allergies As list Of ELFT.TIE.Wrapper.RIO.Request.AllergyExt(XMLITEMNAME = "AllergyExt", XMLNAME = "Allergies", XMLPROJECTION = "COLLECTION");

Property Medications As list Of ELFT.TIE.Wrapper.RIO.Request.MedicationExt(XMLITEMNAME = "MedicationExt", XMLNAME = "Medications", XMLPROJECTION = "COLLECTION");

Storage Default
{
<Data name="DischargeMedicationDefaultData">
<Subscript>"DischargeMedication"</Subscript>
<Value name="1">
<Value>HospitalNo</Value>
</Value>
<Value name="2">
<Value>DateTimeOfMessage</Value>
</Value>
<Value name="3">
<Value>Allergies</Value>
</Value>
<Value name="4">
<Value>Medications</Value>
</Value>
</Data>
<DefaultData>DischargeMedicationDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
