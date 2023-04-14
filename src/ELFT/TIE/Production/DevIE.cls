Class ELFT.TIE.Production.DevIE Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="ELFT.TIE.Production.DevIE" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="From_RiO_ADT_TCP_HL7" Category="RiO,PKB" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.4_TIE</Setting>
    <Setting Target="Host" Name="TargetConfigNames">PKB_Router</Setting>
    <Setting Target="Adapter" Name="Port">1234</Setting>
  </Item>
  <Item Name="Ens.Alert" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="0" Enabled="true" Foreground="false" Comment="This handles Alert routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">ELFT.TIE.Production.DevIE</Setting>
  </Item>
  <Item Name="PKB_Router" Category="RiO,PKB" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">ELFT.TIE.Rule.PKB</Setting>
  </Item>
  <Item Name="To_PKB_ALL_HTTP" Category="" ClassName="ELFT.TIE.Operation.PKB.HTTP.HL7Sender" PoolSize="1" Enabled="true" Foreground="true" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="URL">/services/hl7</Setting>
    <Setting Target="Adapter" Name="HTTPPort">7443</Setting>
    <Setting Target="Adapter" Name="HTTPServer">sandbox.patientsknowbest.com</Setting>
    <Setting Target="Adapter" Name="Credentials">PKB</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">1</Setting>
    <Setting Target="Adapter" Name="SSLConfig">DummySSL</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">2</Setting>
  </Item>
  <Item Name="PKB_Process" Category="" ClassName="ELFT.TIE.Process.PKB.Hl7Packager" PoolSize="1" Enabled="true" Foreground="true" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
</Production>
}

}
