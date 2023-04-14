/// Created from: C:\Users\shwetac\Downloads\ELFT\PKB\Schema0.xsd
Class ELFT.TIE.Wrapper.PKB.Request.Body Extends (%RegisteredObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://schemas.xmlsoap.org/soap/envelope/";

Parameter XMLNAME = "soapenv:Body";

Parameter XMLSEQUENCE = 1;

Property acceptMessage As ELFT.TIE.Wrapper.PKB.Request.acceptMessage(REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://wsssl.hl7api.patientsknowbest.com/", XMLNAME = "wss:acceptMessage", XMLREF = 1) [ Required ];

}
