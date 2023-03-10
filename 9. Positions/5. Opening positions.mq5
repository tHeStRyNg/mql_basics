#include <Trade/Trade.mqh>
CTrade trade;
ulong trade_ticket;

int rsi_h;

double rsi[];

int bars = Bars(_Symbol, _Period);

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool buy_condition()
  {
   return rsi[0] < 20;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool sell_condition()
  {
   return rsi[0] > 80;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool new_candle()
  {
   int current_bars = Bars(_Symbol, _Period);

   if(bars != current_bars)
     {
      bars = current_bars;
      return true;
     }

   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool operation_closed()
  {
   if(!PositionSelectByTicket(trade_ticket))
     {
      trade_ticket = 0;
      return true;
     }

   return false;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
// Loading the rsi
   rsi_h = iRSI(_Symbol, _Period, 14, PRICE_CLOSE);
   if(rsi_h == INVALID_HANDLE)
     {
      Print("Error loading the RSI");
      return INIT_FAILED;
     }

// Setting the array as a series
   ArraySetAsSeries(rsi, true);
   return INIT_SUCCEEDED;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   if(rsi_h != INVALID_HANDLE)
      IndicatorRelease(rsi_h);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   CopyBuffer(rsi_h, 0, 1, 1, rsi);

// Buy
   if(buy_condition() && new_candle() && operation_closed())
     {
      double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
      
      trade.Buy(0.01, _Symbol, Ask, Ask-60*_Point, Ask+100*_Point);
      trade_ticket = trade.ResultOrder();
     }
// Sell
   else if(sell_condition() && new_candle() && operation_closed())
     {
      double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
      
      trade.Sell(0.01, _Symbol, Bid, Bid+60*_Point, Bid-100*_Point);
      trade_ticket = trade.ResultOrder();
     }
  }
//+------------------------------------------------------------------+
