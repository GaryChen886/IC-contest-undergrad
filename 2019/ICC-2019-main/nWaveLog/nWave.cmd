wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/phong/hw6_ICC_uni/build/CONV.fsdb}
wvResizeWindow -win $_nWave1 1920 31 897 202
wvResizeWindow -win $_nWave1 1920 23 1920 1017
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_CONV"
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_CONV/caddr_wr\[11:0\]} \
{/testfixture/u_CONV/cdata_wr\[19:0\]} \
{/testfixture/u_CONV/clk} \
{/testfixture/u_CONV/convTemp\[43:0\]} \
{/testfixture/u_CONV/counterRead\[3:0\]} \
{/testfixture/u_CONV/crd} \
{/testfixture/u_CONV/csel\[2:0\]} \
{/testfixture/u_CONV/current_State\[3:0\]} \
{/testfixture/u_CONV/cwr} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/idataTemp\[19:0\]} \
{/testfixture/u_CONV/idata\[19:0\]} \
{/testfixture/u_CONV/next_State\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_CONV/caddr_wr\[11:0\]} \
{/testfixture/u_CONV/cdata_wr\[19:0\]} \
{/testfixture/u_CONV/clk} \
{/testfixture/u_CONV/convTemp\[43:0\]} \
{/testfixture/u_CONV/counterRead\[3:0\]} \
{/testfixture/u_CONV/crd} \
{/testfixture/u_CONV/csel\[2:0\]} \
{/testfixture/u_CONV/current_State\[3:0\]} \
{/testfixture/u_CONV/cwr} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/idataTemp\[19:0\]} \
{/testfixture/u_CONV/idata\[19:0\]} \
{/testfixture/u_CONV/next_State\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetCursor -win $_nWave1 11278.870907 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 10200.413131 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 11009.256463 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 12851.621830 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 35139.749200 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 11009.256463 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 13031.364793 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 11099.127944 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 12896.557571 -snap {("G1" 11)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_CONV"
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_CONV/caddr_wr\[11:0\]} \
{/testfixture/u_CONV/cdata_wr\[19:0\]} \
{/testfixture/u_CONV/clk} \
{/testfixture/u_CONV/convTemp\[43:0\]} \
{/testfixture/u_CONV/counterRead\[3:0\]} \
{/testfixture/u_CONV/crd} \
{/testfixture/u_CONV/csel\[2:0\]} \
{/testfixture/u_CONV/current_State\[3:0\]} \
{/testfixture/u_CONV/cwr} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/idataTemp\[19:0\]} \
{/testfixture/u_CONV/idata\[19:0\]} \
{/testfixture/u_CONV/next_State\[3:0\]} \
{/testfixture/u_CONV/roundTemp\[20:0\]} \
{/testfixture/u_CONV/roundTemp\[20:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_CONV/caddr_wr\[11:0\]} \
{/testfixture/u_CONV/cdata_wr\[19:0\]} \
{/testfixture/u_CONV/clk} \
{/testfixture/u_CONV/convTemp\[43:0\]} \
{/testfixture/u_CONV/counterRead\[3:0\]} \
{/testfixture/u_CONV/crd} \
{/testfixture/u_CONV/csel\[2:0\]} \
{/testfixture/u_CONV/current_State\[3:0\]} \
{/testfixture/u_CONV/cwr} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/idataTemp\[19:0\]} \
{/testfixture/u_CONV/idata\[19:0\]} \
{/testfixture/u_CONV/next_State\[3:0\]} \
{/testfixture/u_CONV/roundTemp\[20:0\]} \
{/testfixture/u_CONV/roundTemp\[20:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvExpandBus -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 59)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetCursor -win $_nWave1 18962.882561 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 24669.721625 -snap {("G1" 11)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetRadix -win $_nWave1 -2Com
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 31050.596799 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 32713.219204 -snap {("G1" 5)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_CONV"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_CONV"
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 42059.853262 -snap {("G2" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetCursor -win $_nWave1 7574997.546820 -snap {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetCursor -win $_nWave1 106853016.644120 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 106864340.450768 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 106869238.446500 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 103203276.275062 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 109209550.687559 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 109202720.454978 -snap {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_CONV/caddr_wr\[11:0\]} \
{/testfixture/u_CONV/cdata_wr\[19:0\]} \
{/testfixture/u_CONV/clk} \
{/testfixture/u_CONV/convTemp\[43:0\]} \
{/testfixture/u_CONV/cdata_rd\[19:0\]} \
{/testfixture/u_CONV/counterRead\[3:0\]} \
{/testfixture/u_CONV/crd} \
{/testfixture/u_CONV/csel\[2:0\]} \
{/testfixture/u_CONV/current_State\[3:0\]} \
{/testfixture/u_CONV/cwr} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/idataTemp\[19:0\]} \
{/testfixture/u_CONV/idata\[19:0\]} \
{/testfixture/u_CONV/next_State\[3:0\]} \
{/testfixture/u_CONV/roundTemp\[20:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_CONV/caddr_wr\[11:0\]} \
{/testfixture/u_CONV/cdata_wr\[19:0\]} \
{/testfixture/u_CONV/clk} \
{/testfixture/u_CONV/convTemp\[43:0\]} \
{/testfixture/u_CONV/cdata_rd\[19:0\]} \
{/testfixture/u_CONV/counterRead\[3:0\]} \
{/testfixture/u_CONV/crd} \
{/testfixture/u_CONV/csel\[2:0\]} \
{/testfixture/u_CONV/current_State\[3:0\]} \
{/testfixture/u_CONV/cwr} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/idataTemp\[19:0\]} \
{/testfixture/u_CONV/idata\[19:0\]} \
{/testfixture/u_CONV/next_State\[3:0\]} \
{/testfixture/u_CONV/roundTemp\[20:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetCursor -win $_nWave1 123701195.446154 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 123698903.723381 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_CONV/caddr_wr\[11:0\]} \
{/testfixture/u_CONV/cdata_wr\[19:0\]} \
{/testfixture/u_CONV/clk} \
{/testfixture/u_CONV/convTemp\[43:0\]} \
{/testfixture/u_CONV/cdata_rd\[19:0\]} \
{/testfixture/u_CONV/col\[5:0\]} \
{/testfixture/u_CONV/col\[5:0\]} \
{/testfixture/u_CONV/row\[5:0\]} \
{/testfixture/u_CONV/counterRead\[3:0\]} \
{/testfixture/u_CONV/crd} \
{/testfixture/u_CONV/csel\[2:0\]} \
{/testfixture/u_CONV/current_State\[3:0\]} \
{/testfixture/u_CONV/cwr} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/idataTemp\[19:0\]} \
{/testfixture/u_CONV/idata\[19:0\]} \
{/testfixture/u_CONV/next_State\[3:0\]} \
{/testfixture/u_CONV/roundTemp\[20:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_CONV/caddr_wr\[11:0\]} \
{/testfixture/u_CONV/cdata_wr\[19:0\]} \
{/testfixture/u_CONV/clk} \
{/testfixture/u_CONV/convTemp\[43:0\]} \
{/testfixture/u_CONV/cdata_rd\[19:0\]} \
{/testfixture/u_CONV/col\[5:0\]} \
{/testfixture/u_CONV/col\[5:0\]} \
{/testfixture/u_CONV/row\[5:0\]} \
{/testfixture/u_CONV/counterRead\[3:0\]} \
{/testfixture/u_CONV/crd} \
{/testfixture/u_CONV/csel\[2:0\]} \
{/testfixture/u_CONV/current_State\[3:0\]} \
{/testfixture/u_CONV/cwr} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/idataTemp\[19:0\]} \
{/testfixture/u_CONV/idata\[19:0\]} \
{/testfixture/u_CONV/next_State\[3:0\]} \
{/testfixture/u_CONV/roundTemp\[20:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 8 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvExpandBus -win $_nWave1 {("G1" 8)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvCollapseBus -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetCursor -win $_nWave1 123687310.302289 -snap {("G2" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetCursor -win $_nWave1 123686366.651735 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 123699353.080787 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 66508759.522139 -snap {("G1" 6)}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_CONV"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_CONV"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_CONV/caddr_wr\[11:0\]} \
{/testfixture/u_CONV/cdata_wr\[19:0\]} \
{/testfixture/u_CONV/clk} \
{/testfixture/u_CONV/convTemp\[43:0\]} \
{/testfixture/u_CONV/cdata_rd\[19:0\]} \
{/testfixture/u_CONV/col\[5:0\]} \
{/testfixture/u_CONV/row\[5:0\]} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/counterRead\[3:0\]} \
{/testfixture/u_CONV/crd} \
{/testfixture/u_CONV/csel\[2:0\]} \
{/testfixture/u_CONV/current_State\[3:0\]} \
{/testfixture/u_CONV/cwr} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/idataTemp\[19:0\]} \
{/testfixture/u_CONV/idata\[19:0\]} \
{/testfixture/u_CONV/next_State\[3:0\]} \
{/testfixture/u_CONV/roundTemp\[20:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_CONV/caddr_wr\[11:0\]} \
{/testfixture/u_CONV/cdata_wr\[19:0\]} \
{/testfixture/u_CONV/clk} \
{/testfixture/u_CONV/convTemp\[43:0\]} \
{/testfixture/u_CONV/cdata_rd\[19:0\]} \
{/testfixture/u_CONV/col\[5:0\]} \
{/testfixture/u_CONV/row\[5:0\]} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/counterRead\[3:0\]} \
{/testfixture/u_CONV/crd} \
{/testfixture/u_CONV/csel\[2:0\]} \
{/testfixture/u_CONV/current_State\[3:0\]} \
{/testfixture/u_CONV/cwr} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/idataTemp\[19:0\]} \
{/testfixture/u_CONV/idata\[19:0\]} \
{/testfixture/u_CONV/next_State\[3:0\]} \
{/testfixture/u_CONV/roundTemp\[20:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvExpandBus -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvCollapseBus -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvExpandBus -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvCollapseBus -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvExpandBus -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 16 17 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 22)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 22)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSelectGroup -win $_nWave1 {G2}
wvSelectGroup -win $_nWave1 {G2}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectGroup -win $_nWave1 {G2}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvExpandBus -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvCollapseBus -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetRadix -win $_nWave1 -format Bin
wvSetCursor -win $_nWave1 66510871.501950 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 66509029.136583 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 105624806.434383 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 105649566.027489 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 105640084.586209 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvExpandBus -win $_nWave1 {("G1" 14)}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSelectSignal -win $_nWave1 {( "G1" 17 )} 
wvSetCursor -win $_nWave1 105648936.927120 -snap {("G1" 9)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_CONV/caddr_wr\[11:0\]} \
{/testfixture/u_CONV/cdata_wr\[19:0\]} \
{/testfixture/u_CONV/clk} \
{/testfixture/u_CONV/convTemp\[43:0\]} \
{/testfixture/u_CONV/cdata_rd\[19:0\]} \
{/testfixture/u_CONV/col\[5:0\]} \
{/testfixture/u_CONV/row\[5:0\]} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/counterRead\[3:0\]} \
{/testfixture/u_CONV/crd} \
{/testfixture/u_CONV/csel\[2:0\]} \
{/testfixture/u_CONV/current_State\[3:0\]} \
{/testfixture/u_CONV/cwr} \
{/testfixture/u_CONV/idataTemp\[19:0\]} \
{/testfixture/u_CONV/resultTemp\[43:0\]} \
{/testfixture/u_CONV/idata\[19:0\]} \
{/testfixture/u_CONV/next_State\[3:0\]} \
{/testfixture/u_CONV/roundTemp\[20:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvCollapseGroup -win $_nWave1 "G2"
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_CONV/caddr_wr\[11:0\]} \
{/testfixture/u_CONV/cdata_wr\[19:0\]} \
{/testfixture/u_CONV/clk} \
{/testfixture/u_CONV/convTemp\[43:0\]} \
{/testfixture/u_CONV/cdata_rd\[19:0\]} \
{/testfixture/u_CONV/col\[5:0\]} \
{/testfixture/u_CONV/row\[5:0\]} \
{/testfixture/u_CONV/iaddr\[11:0\]} \
{/testfixture/u_CONV/counterRead\[3:0\]} \
{/testfixture/u_CONV/crd} \
{/testfixture/u_CONV/csel\[2:0\]} \
{/testfixture/u_CONV/current_State\[3:0\]} \
{/testfixture/u_CONV/cwr} \
{/testfixture/u_CONV/idataTemp\[19:0\]} \
{/testfixture/u_CONV/resultTemp\[43:0\]} \
{/testfixture/u_CONV/idata\[19:0\]} \
{/testfixture/u_CONV/next_State\[3:0\]} \
{/testfixture/u_CONV/roundTemp\[20:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvCollapseGroup -win $_nWave1 "G2"
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 105647184.433234 -snap {("G1" 15)}
wvSetCursor -win $_nWave1 105646195.846939 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 105649071.734342 -snap {("G1" 15)}
wvSelectSignal -win $_nWave1 {( "G1" 18 )} 
wvSetCursor -win $_nWave1 105651048.906931 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 105652801.400817 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 105654733.637666 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 105653115.951002 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 117536767.066024 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 117539283.467501 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 117524948.966229 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 118563189.254303 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 120313211.674449 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 126627934.663226 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 126626946.076931 -snap {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvExpandBus -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 35)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSetCursor -win $_nWave1 126628024.534707 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 126628878.313780 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 126634854.767288 -snap {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvExpandBus -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvUndo -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvExit
