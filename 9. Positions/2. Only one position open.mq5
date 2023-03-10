#include <Trade/Trade.mqh>
CTrade trade;
ulong trade_ticket = 0;

//+------------------------------------------------------------------+
//|    Variables                                                     |
//+------------------------------------------------------------------+
int macd_h;
double macd[];
double signal[];

int bars = 0;

//+------------------------------------------------------------------+
//|    Functions                                                     |
//+------------------------------------------------------------------+
bool sell_signal()
  {
   return signal[1] < macd[1] && signal[0] > macd[0];
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool buy_signal()
  {
   return signal[1] > macd[1] && signal[0] < macd[0];
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
   if (!PositionSelectByTicket(trade_ticket)) {
      trade_ticket = 0;
      return true;
   }
   
   return false;
  }

//+------------------------------------------------------------------+
//|     Events                                                       |
//+------------------------------------------------------------------+
int OnInit()
  {
// Loading the MACD handle
   macd_h = iMACD(_Symbol, _Period, 12, 26, 9, PRICE_CLOSE);
//iMA(_Symbol, _Period, 12, 0, MODE_SMA, PRICE_CLOSE);
   if(macd_h == INVALID_HANDLE)
     {
      Print("MACD couldn't be loaded");
      return INIT_FAILED;
     }

// Setting the array as series
   ArraySetAsSeries(macd, true);
   ArraySetAsSeries(signal, true);

   return INIT_SUCCEEDED;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   if(macd_h != INVALID_HANDLE)
      IndicatorRelease(macd_h);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
// Loading the MACD data
   CopyBuffer(macd_h, MAIN_LINE, 1, 3, macd);
   CopyBuffer(macd_h, SIGNAL_LINE, 1, 3, signal);

// Sell cross
   if(sell_signal() && new_candle() && operation_closed())
     {
      double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
      trade.Sell(0.01, _Symbol, Bid, Bid+100*_Point, Bid-200*_Point);
      trade_ticket = trade.ResultOrder();
     }
// Buy cross
   else
      if(buy_signal() && new_candle() && operation_closed())
        {
         double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
         trade.Buy(0.01, _Symbol, Ask, Ask-100*_Point, Ask+200*_Point);
         trade_ticket = trade.ResultOrder();
        }

  }
//+------------------------------------------------------------------+
