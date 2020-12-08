import 'package:quotes/redux/actions/action.dart';
import 'package:quotes/redux/actions/quotes_action.dart';
import 'package:quotes/redux/models/app_state.dart';
import 'package:quotes/redux/services/favqs.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createInitMiddleware(
  QuoteApiService quoteApiService,
){
	return[
	  TypedMiddleware<AppState, InitAppAction>(_init(quoteApiService)),
    TypedMiddleware<AppState, InitAppAction>(_init(quoteApiService)),
    TypedMiddleware<AppState, GetNewQuotesAction>(_newQuotes(quoteApiService)),
    TypedMiddleware<AppState, SaveQuotesAction>(_saveQuote(quoteApiService)),
    TypedMiddleware<AppState, DeleteQuotesAction>(_delQuote(quoteApiService))
  ];
}

void Function(Store<AppState> store, InitAppAction action, NextDispatcher next)
_init(QuoteApiService quoteApiService) {
  	return (store, action, next) {

      quoteApiService.getQOTD(5).then((value){
        store.dispatch(new SavedQuotesAction(value));
        store.dispatch(new AllLoadedAction());
        quoteApiService.getQuote().then((value){
          store.dispatch(new SaveLocalQuotesAction(value));
        });
      });
      
    	next(action);
	};
}


void Function(Store<AppState> store, GetNewQuotesAction action, NextDispatcher next)
_newQuotes(QuoteApiService quoteApiService) {
  	return (store, action, next) {

      quoteApiService.getQOTD(2).then((value){
        store.dispatch(new SaveNewQuotesAction(value));
        store.dispatch(new AllLoadedAction());
      });

    	next(action);
	};
}


void Function(Store<AppState> store, SaveQuotesAction action, NextDispatcher next)
_saveQuote(QuoteApiService quoteApiService) {
  	return (store, action, next) {

      quoteApiService.saveQuote(action.quote).then((value){
        store.dispatch(new SaveLocalQuotesAction(value));
      });

    	next(action);
	};
}

void Function(Store<AppState> store, DeleteQuotesAction action, NextDispatcher next)
_delQuote(QuoteApiService quoteApiService) {
  	return (store, action, next) {

      quoteApiService.delQuote(action.quote).then((value){
        store.dispatch(new SaveLocalQuotesAction(value));
      });

    	next(action);
	};
}