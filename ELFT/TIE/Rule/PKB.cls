/// 
Class ELFT.TIE.Rule.PKB Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="ELFT.TIE.Production.DevIE">
<ruleSet name="PKB Rules" effectiveBegin="" effectiveEnd="">
<rule name="ADTs from RiO to PKB" disabled="false">
<constraint name="source" value="From_RiO_ADT_TCP_HL7"></constraint>
<constraint name="docCategory" value="2.4_TIE"></constraint>
<when condition="(HL7.{MSH:9.2}=&quot;A28&quot;)&amp;&amp;(CheckNHSNumberVerified(HL7.{PID:3.5})=1)">
<send transform="" target="PKB_Process"></send>
<return></return>
</when>
<when condition="(HL7.{MSH:9.2} = &quot;A31&quot;)&amp;&amp;(CheckNHSNumberVerified(HL7.{PID:3.5})=1)">
<send transform="" target="PKB_Process"></send>
<return></return>
</when>
</rule>
<rule name="ADTs from RiO - SIU(Appointments) to PKB" disabled="false">
<constraint name="source" value="From_RiO_ADT_TCP_HL7"></constraint>
<constraint name="docCategory" value="2.4_TIE"></constraint>
<when condition="(HL7.{MSH:9.2} = &quot;A04&quot;)&amp;&amp;(CheckNHSNumberVerified(HL7.{PID:3.5})=1)">
<send transform="ELFT.TIE.Transform.PKB.SIU.RiOA04ToPKBS12" target="PKB_Process"></send>
<return></return>
</when>
<when condition="(HL7.{MSH:9.2} = &quot;A08&quot;)&amp;&amp;(CheckNHSNumberVerified(HL7.{PID:3.5})=1)">
<send transform="ELFT.TIE.Transform.PKB.SIU.RiOA08ToPKBS13" target="PKB_Process"></send>
<return></return>
</when>
<when condition="(HL7.{MSH:9.2}=&quot;A11&quot;)&amp;&amp;(CheckNHSNumberVerified(HL7.{PID:3.5})=1)&amp;&amp;(CheckIfAppointmentIsCancelled(HL7.{ZU3:3.1})=1)">
<send transform="ELFT.TIE.Transform.PKB.SIU.RiOA11ToPKBS15" target="PKB_Process"></send>
<return></return>
</when>
<when condition="(HL7.{MSH:9.2}=&quot;A11&quot;)&amp;&amp;(CheckNHSNumberVerified(HL7.{PID:3.5})=1)&amp;&amp;(CheckIfAppointmentIsDNA(HL7.{ZU3:3.1})=1)">
<send transform="ELFT.TIE.Transform.PKB.SIU.RiOA11ToPKBS26" target="PKB_Process"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
