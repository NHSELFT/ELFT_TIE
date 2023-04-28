Class ELFT.TIE.Test.Data.HL7.ADT Extends %RegisteredObject
{

Method A04FromRiOTestMessage(ByRef pDocType As %String = "") As %String
{
	Set pDocType = "2.4_TIE:ADT_A01"
	Quit "MSH|^~\&|Rio|ELFT|HL7API|PKB|20201104140442||ADT^A04|4446817523|P|2.4|"_$C(13,10)_
	"PID|||4446817523^^^NHS^NH{status:01}||TESTING^C^^^Ms||19510503||||^^^^^||||en||||||||||||||||"_$C(13,10)_
	"PD1|||EHS HOSPITAL^^10101"_$C(13,10)_
	"PV1|1|I|NICU^ROOM 01^01^RP401^D^^^^^^|Elect Plan|||||2342^Jones^Bob^^^Dr.^^|Acute Med||||LA Foster|||||1001001036|SELF|||||||||||||||||||||Adm*Conf|||20180508111929"_$C(13,10)_
	"PV2||GENERAL||||||20180508|||||||||||||n|N"_$C(13,10)_
	"OBX|1|TX|ADMINCAT^ADMINISTRATIVE CATEGORY CODE|1|NHS|||||||||20180508"_$C(13,10)_
	"DG1|1||^Test|Test||^A"_$C(13,10)_
	"ZU3|1|||||First Appointment||Face-To-Face|||"_$C(13,10)
}

Method A08FromRiOTestMessage(ByRef pDocType As %String = "") As %String
{
	Set pDocType = "2.4_TIE:ADT_A01"
	Quit "MSH|^~\&|Rio|ELFT|HL7API|PKB|20201104140442||ADT^A08|4446817523|P|2.4|"_$C(13,10)_
	"PID|||4446817523^^^NHS^NH{status:01}||TESTING^C^^^Ms||19510503||||^^^^^||||en||||||||||||||||"_$C(13,10)_
	"PD1|||EHS HOSPITAL^^10101"_$C(13,10)_
	"PV1|1|I|NICU^ROOM 01^01^RP401^D^^^^^^|Elect Plan|||||2342^Jones^Bob^^^Dr.^^|Acute Med||||LA Foster|||||1001001036|SELF|||||||||||||||||||||Adm*Conf|||20180508112919"_$C(13,10)_
	"PV2||GENERAL||||||20180508|||||||||||||n|N"_$C(13,10)_
	"OBX|1|TX|ADMINCAT^ADMINISTRATIVE CATEGORY CODE|1|NHS|||||||||20180508"_$C(13,10)_
	"DG1|1||^Test|Test||^A"_$C(13,10)_
	"ZU3|1|||||First Appointment||Face-To-Face|||"_$C(13,10)
}

Method A11FromRiOForCancelAppointmentTestMessage(ByRef pDocType As %String = "") As %String
{
	Set pDocType = "2.4_TIE:ADT_A09"
	Quit "MSH|^~\&|Rio|ELFT|HL7API|PKB|20201104140442||ADT^A08|4446817523|P|2.4|"_$C(13,10)_
	"PID|||4446817523^^^NHS^NH{status:01}||TESTING^C^^^Ms||19510503||||^^^^^||||en||||||||||||||||"_$C(13,10)_
	"PD1|||EHS HOSPITAL^^10101"_$C(13,10)_
	"PV1|1|I|NICU^ROOM 01^01^RP401^D^^^^^^|Elect Plan|||||2342^Jones^Bob^^^Dr.^^|Acute Med||||LA Foster|||||1001001036|SELF|||||||||||||||||||||Adm*Conf|||20180508112919"_$C(13,10)_
	"PV2||GENERAL||||||20180508|||||||||||||n|N"_$C(13,10)_
	"OBX|1|TX|ADMINCAT^ADMINISTRATIVE CATEGORY CODE|1|NHS|||||||||20180508"_$C(13,10)_
	"DG1|1||^Test|Test||^A"_$C(13,10)_
	"ZU3|1||2^CancelledByClient|||||Face-To-Face|||"_$C(13,10)
}

Method A11FromRiOForDNAAppointmentTestMessage(ByRef pDocType As %String = "") As %String
{
	Set pDocType = "2.4_TIE:ADT_A09"
	Quit "MSH|^~\&|Rio|ELFT|HL7API|PKB|20201104140442||ADT^A11|4446817523|P|2.4|"_$C(13,10)_
	"PID|||4446817523^^^NHS^NH{status:01}||TESTING^C^^^Ms||19510503||||^^^^^||||en||||||||||||||||"_$C(13,10)_
	"PD1|||EHS HOSPITAL^^10101"_$C(13,10)_
	"PV1|1|I|NICU^ROOM 01^01^RP401^D^^^^^^|Elect Plan|||||2342^Jones^Bob^^^Dr.^^|Acute Med||||LA Foster|||||1001001036|SELF|||||||||||||||||||||Adm*Conf|||20180508112919"_$C(13,10)_
	"PV2||GENERAL||||||20180508|||||||||||||n|N"_$C(13,10)_
	"OBX|1|TX|ADMINCAT^ADMINISTRATIVE CATEGORY CODE|1|NHS|||||||||20180508"_$C(13,10)_
	"DG1|1||^Test|Test||^A"_$C(13,10)_
	"ZU3|1||4^Did Not Attend|||||Face-To-Face|||"_$C(13,10)
}

Method A28FromRiOTestMessage(ByRef pDocType As %String = "") As %String
{
	Set pDocType = "2.4_TIE:ADT_A05"
	Quit "MSH|^~\&|Rio|ELFT|HL7API|PKB|20201104140442||ADT^A28|4446817523|P|2.4|"_$C(13,10)_
	"PID|||4446817523^^^NHS^NH{status:01}||TESTING^C^^^Ms||19510503||||^^^^^||||en||||||||||||||||"_$C(13,10)_
	"DG1|||F200^Paranoid schizophrenia^ICD10||201007290300||||||||||||"_$C(13,10)_
	"DG1|||Z911^Personal history of noncompliance with medical treatment and regimen^ICD10||201402170345||||||||||||"_$C(13,10)_
	"DG1|||Z915^Personal history of self-harm^ICD10||201701160900||||||||||||"_$C(13,10)_
	"DG1|||Z637^Other stressful life events affecting family and household^ICD10||202001091030||||||||||||"_$C(13,10)_
	"DG1|||Z637^Other stressful life events affecting family and household^ICD10||202005061057||||||||||||"_$C(13,10)_
	"DG1|||I10X^Essential (primary) hypertension^ICD10||201412191130||||||||||||"_$C(13,10)_
	"DG1|||Z911^Personal history of noncompliance with medical treatment and regimen^ICD10||201810290900||||||||||||"_$C(13,10)_
	"DG1|||K590^Constipation^ICD10||202007100645||||||||||||"_$C(13,10)_
	"DG1|||M139^Arthritis, unspecified^ICD10||202007100645||||||||||||"_$C(13,10)_
	"DG1|||R05X^Cough^ICD10||202005061057||||||||||||"_$C(13,10)_
	"DG1|||Z038^Observation for other suspected diseases and conditions^ICD10||202005061057||||||||||||"_$C(13,10)_
	"DG1|||Z290^Isolation^ICD10||202005061057||||||||||||"_$C(13,10)_
	"DG1|||M139^Arthritis, unspecified^ICD10||202005061057||||||||||||"_$C(13,10)
}

Method A31FromRiOTestMessage(ByRef pDocType As %String = "") As %String
{
	Set pDocType = "2.4_TIE:ADT_A05"
	Quit "MSH|^~\&|Rio|ELFT|HL7API|PKB|20201104140442||ADT^A28|4446817523|P|2.4|"_$C(13,10)_
	"PID|||4446817523^^^NHS^NH{status:01}||TESTING^C^^^Ms||19510503||||^^^^^||||en||||||||||||||||"_$C(13,10)_
	"PD1|||Herne Hill Group Practice, 74 Herne Hill, East Brixton, London^GPPRC^G85016|G3427020^Dickinson^G^^^Dr.^^0035"_$C(13,10)_
	"NK1|1|Massett^David^^^Mr|HUS^Husband|239 Milkwood Road^LONDON^^^SE24 0JE^ZZ993CZ^HOME|7274 8854||NOK^Next of Kin|20051115|||||||MALE|19660726000000"_$C(13,10)_
	"PV1|1|O|OPTH^^^KCH^^^^^Ophthalmology  Eye Suite 2, Second Floor OPD|NSP||||G9604465^Miller^S^^^Dr.|HUNPA^Hunter^P A^^^Mr^130|OPHTHAL||||||||NHS|V2360459|||||||||||||||||||||||||20051110094500"_$C(13,10)
}

}
