Class ELFT.TIE.Test.Data.HL7.ORM Extends %RegisteredObject
{

Method ORMMessage(ByRef pDocType As %String = "") As %String
{
	Set pDocType = "2.4:ORM_O01"
	Quit "MSH|^~\&||26589||69853|20060112123508|HJONES|ORM^O01|162|P|2.3||"_$C(13,10)_
	"PID|1||59863512||SMITH^JOSEPH^Y^^^||19840116|M|||26 FIRST ST^^MADISON^WI^53705^USA^^^|||||||1568459|"_$C(13,10)_
	"ORC|NW|06-CH0002703|||||^^^^^ROUTINE|||||12^GRANT^JILL^^^^||||"_$C(13,10)_
	"OBR|1|06CH0002703||10216|||200601121233|||HJONES|O|||||12^GRANT^JILL^^^^||312|||||||||^^^^^ROUTINE"_$C(13,10)_
	"OBX|1||18||||-||||||||||62110|XE OBX|2||19||||-||||||||||62110|XE"_$C(3)
}

}
