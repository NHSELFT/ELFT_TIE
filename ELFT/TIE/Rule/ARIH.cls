/// 
Class ELFT.TIE.Rule.ARIH Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="ELFT.TIE.Production.DevIE">
<ruleSet name="ARIH Rules" effectiveBegin="" effectiveEnd="">
<rule name="ORUs from Barts to ARIH v2" disabled="false">
<constraint name="source" value="From_Barts_ORU_TCP_HL7"></constraint>
<constraint name="docCategory" value="2.4"></constraint>
<constraint name="docName" value="ORU_R01"></constraint>
<when condition="1">
<send transform="" target="To_ARIH_ORU_TCP_HL7"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
