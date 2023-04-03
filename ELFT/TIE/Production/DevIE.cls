Class ELFT.TIE.Production.DevIE Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="ELFT.TIE.Production.DevProduction" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Ens.Alert" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="0" Enabled="true" Foreground="false" Comment="This handles Alert routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">ELFT.TIE.Production.DevProduction</Setting>
  </Item>
</Production>
}

}
