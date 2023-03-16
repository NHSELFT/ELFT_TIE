/// 
Class ELFT.TIE.Rule.JACToRIOADTRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="EEAS.TIE.Production.EOEProduction">
<ruleSet name="Siren To LDUH ADT" effectiveBegin="" effectiveEnd="">
<rule name="Pre-Admit(s)" disabled="false">
<constraint name="source" value="Siren_To_LDUH_ADT_HTTP"></constraint>
<constraint name="docCategory" value="2.4"></constraint>
<constraint name="docName" value="ADT_A05,ADT_A38"></constraint>
<when condition="Document.{MSH:MessageType.triggerevent}=&quot;A05&quot;">
<send transform="EEAS.TIE.Transformation.LDUH.SirenA05ToLDUHA05" target="LDUH_ADT_HTTP"></send>
</when>
<when condition="Document.{MSH:MessageType.triggerevent}=&quot;A38&quot;">
<send transform="" target="LDUH_ADT_HTTP"></send>
</when>
<otherwise>
<trace value="&quot;No Condition Matched&quot;"></trace>
<return></return>
</otherwise>
</rule>
</ruleSet>
</ruleDefinition>
}

}
