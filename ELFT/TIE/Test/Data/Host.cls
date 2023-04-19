/// API Host contains Methods to eject Test Data from Hosts
Class ELFT.TIE.Test.Data.Host Extends (ELFT.TIE.Test.Data.HL7.ADT, ELFT.TIE.Test.Data.HL7.ORM, ELFT.TIE.Test.Data.HL7.ORU, ELFT.TIE.Test.Data.HL7.MDM)
{

Method QuitHL7AsObject(pDataType As %String) As EnsLib.HL7.Message
{
		Set tHLString = $METHOD(##THIS,pDataType,.tDocType)
		Set tHL7Stream = ##class(%GlobalCharacterStream).%New()
		Do tHL7Stream.Write(tHLString)
		Set tHL7Object = ##class(EnsLib.HL7.Message).ImportFromLibraryStream(tHL7Stream)
		Set tHL7Object.DocType = tDocType
		Quit tHL7Object
}

Method QuitHL7AsStream(pDataType As %String) As %GlobalCharacterStream
{
		Set tHLString = $METHOD(##THIS,pDataType,.tDocType)
		Set tHL7Stream = ##class(%GlobalCharacterStream).%New()
		Do tHL7Stream.Write(tHLString)
		Quit tHL7Stream
}

}
