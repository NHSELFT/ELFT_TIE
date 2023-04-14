Class ELFT.TIE.Helper.Util Extends Ens.Rule.FunctionSet
{

/// Check NHS Number is verified
ClassMethod CheckNHSNumberVerified(pNHSVerfiedStatus As %String) As %String
{
	If pNHSVerfiedStatus'=""
	{
		Set tNH = $Extract(pNHSVerfiedStatus,*-1 )
	}
	Quit tNH
}

ClassMethod ConvertHL7ToString(pHL7Message As EnsLib.HL7.Message) As %String
{
	
	Set tSegCount = pHL7Message.SegCount
	Set tOutputString= ""
	Set tSegIndex = 1
	While tSegIndex<=tSegCount
	{
		Set tSegment = pHL7Message.GetSegmentAt(tSegIndex)
	 	Set tOutputString = tOutputString_tSegment.OutputToString()
	 	If tSegIndex'=tSegCount
	 	{ 
	 		Set tOutputString = tOutputString_$C(13,10)
	 	}
	 	Set tSegIndex = tSegIndex+1
	 }
	Quit tOutputString
}

}
