#include <Trade/Trade.mqh>
CTrade trade;

int rsi_h;

double rsi[];

int bars;
bool new_candle() {
   int current_bars = Bars(_Symbol, _Period);
   
   if (current_bars != bars) {
      bars = current_bars;
      return true;
   }
   
   return false;
}

bool sell_condition() {
   return rsi[0] > 70;
}

void trailing_stop() {
   for (int i = 0; i < PositionsTotal(); i++) {
      ulong ticket = PositionGetTicket(i);
      PositionSelectByTicket(ticket);
      
      double previous_sl = PositionGetDouble(POSITION_SL);
      double current_price = PositionGetDouble(POSITION_PRICE_CURRENT);
      if (current_price < previous_sl-6000*_Point)
         trade.PositionModify(ticket, previous_sl-3000*_Point, 0);
   }
}

int OnInit() {
   rsi_h = iRSI(_Symbol, _Period, 14, PRICE_CLOSE);
   if (rsi_h == INVALID_HANDLE) {
      Print("No se ha podido cargar el rsi");
      return INIT_FAILED;
   }
   
   ArraySetAsSeries(rsi, true);
   
   return INIT_SUCCEEDED;
}

void OnDeinit(const int reason) {
   if (rsi_h != INVALID_HANDLE) IndicatorRelease(rsi_h);
}

void OnTick() {
   CopyBuffer(rsi_h, 0, 1, 1, rsi);
   
   trailing_stop();
   
   if (sell_condition() && new_candle()) {
      double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
      trade.Sell(0.1, _Symbol, Bid, Bid+2000*_Point);
   }
}