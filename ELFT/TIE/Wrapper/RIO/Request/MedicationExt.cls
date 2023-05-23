Class ELFT.TIE.Wrapper.RIO.Request.MedicationExt Extends (%Persistent, %XML.Adaptor)
{

Parameter XMLNAME = "Medications";

Property DrugName As %String(MAXLEN = "", XMLNAME = "DrugName");

Property Dose As %String;

Property Frequency As %String;

Property DrugNote As %String(MAXLEN = "", XMLNAME = "DrugNote");

Property NoOfDaysSupplied As %String;

Property GPToContinuePrescribing As %String;

Property Route As %String;

Storage Default
{
<Data name="MedicationExtDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DrugName</Value>
</Value>
<Value name="3">
<Value>Dose</Value>
</Value>
<Value name="4">
<Value>Frequency</Value>
</Value>
<Value name="5">
<Value>DrugNote</Value>
</Value>
<Value name="6">
<Value>NoOfDaysSupplied</Value>
</Value>
<Value name="7">
<Value>GPToContinuePrescribing</Value>
</Value>
<Value name="8">
<Value>Route</Value>
</Value>
</Data>
<DataLocation>^ELFT.TIE.Wra3D8E.MedicationExtD</DataLocation>
<DefaultData>MedicationExtDefaultData</DefaultData>
<IdLocation>^ELFT.TIE.Wra3D8E.MedicationExtD</IdLocation>
<IndexLocation>^ELFT.TIE.Wra3D8E.MedicationExtI</IndexLocation>
<StreamLocation>^ELFT.TIE.Wra3D8E.MedicationExtS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
