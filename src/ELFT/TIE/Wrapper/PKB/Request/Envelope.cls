/// 
Class ELFT.TIE.Wrapper.PKB.Request.Envelope Extends (%RegisteredObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter ELEMENTQUALIFIED = 1;

Parameter NAMESPACE = "http://schemas.xmlsoap.org/soap/envelope/";

Parameter XMLNAME = "soapenv:Envelope";

Parameter XMLSEQUENCE = 1;

Property Header As %String(MAXLEN = "", XMLNAME = "soapenv:Header");

Property Body As ELFT.TIE.Wrapper.PKB.Request.Body(XMLNAME = "soapenv:Body") [ Required ];

Property soapenv As %String(XMLNAME = "xmlns:soapenv", XMLPROJECTION = "ATTRIBUTE") [ InitialExpression = "http://schemas.xmlsoap.org/soap/envelope/", Required ];

Property wss As %String(XMLNAME = "xmlns:wss", XMLPROJECTION = "ATTRIBUTE") [ InitialExpression = "http://wsssl.hl7api.patientsknowbest.com/", Required ];

}
