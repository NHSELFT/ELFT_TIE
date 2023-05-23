Class ELFT.TIE.Wrapper.RIO.Request.AllergyExt Extends (%Persistent, %XML.Adaptor)
{

Parameter XMLNAME = "AllergyExt";

Property AllergyDesc As %String(MAXLEN = "", XMLNAME = "AllergyDesc");

Property AllergyType As %String;

Property AllergyReaction As %String(MAXLEN = "", XMLNAME = "AllergyReaction");

Storage Default
{
<Data name="AllergyExtDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>AllergyDesc</Value>
</Value>
<Value name="3">
<Value>AllergyType</Value>
</Value>
<Value name="4">
<Value>AllergyReaction</Value>
</Value>
</Data>
<DataLocation>^ELFT.TIE.Wrappe3D8E.AllergyExtD</DataLocation>
<DefaultData>AllergyExtDefaultData</DefaultData>
<IdLocation>^ELFT.TIE.Wrappe3D8E.AllergyExtD</IdLocation>
<IndexLocation>^ELFT.TIE.Wrappe3D8E.AllergyExtI</IndexLocation>
<StreamLocation>^ELFT.TIE.Wrappe3D8E.AllergyExtS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
