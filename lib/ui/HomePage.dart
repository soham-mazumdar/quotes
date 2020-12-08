import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:quotes/redux/actions/navigator_actions.dart';
import 'package:quotes/redux/actions/quotes_action.dart';
import 'package:quotes/redux/models/app_state.dart';
import 'package:quotes/redux/models/quote.dart';
import 'package:quotes/utils/ui_constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store)
      {
        final Map<String, dynamic> args = {
          "isLoading" : store.state.isLoading,
          "quotes" : store.state.quotes,
          "routes" : store.state.routes,
          "navigate" : (arg){
            return store.dispatch(NavigatorPushAction('/saved'));
          },
          "getQuotes": (){
            return store.dispatch(GetNewQuotesAction());
          },
          "saveQuote": (Quote quote){
            return store.dispatch(SaveQuotesAction(quote));
          }
        };
        return args;
      },
      builder: (context, args){
        final Function navigate = args["navigate"];
        final bool isLoading = args["isLoading"];
        final List<Quote> quotes = args['quotes'];
        final Function getQuotes = args["getQuotes"];
        final Function saveQuote = args["saveQuote"];

        CardController controller;
        double _height = MediaQuery.of(context).size.height;
        double _width = MediaQuery.of(context).size.width;

        return Scaffold(
          body: isLoading ? Container(
            height: _height,
            width: MediaQuery.of(context).size.width,
            color: Colors.teal,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  height: _height * 0.2,
                  width: _width,
                  child: Container(height: _height * 0.2,color: AppColors.one)
                ),
                Positioned(
                  top: _height * 0.2,
                  height: _height * 0.2,
                  width: _width,
                  child: Container(height: _height * 0.2,color: AppColors.two)
                ),
                Positioned(
                  top: _height * 0.4,
                  height: _height * 0.2,
                  width: _width,
                  child: Container(height: _height * 0.2,color: AppColors.three)
                ),
                Positioned(
                  top: _height * 0.6,
                  height: _height * 0.2,
                  width: _width,
                  child: Container(height: _height * 0.2,color: AppColors.four)
                ),
                Positioned(
                  top: _height * 0.8,
                  height: _height * 0.2,
                  width: _width,
                  child: Container(height: _height * 0.2,color: AppColors.five)
                ),
                Positioned(
                  height: _height,
                  width: _width,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo.png',width: 150,),
                        SizedBox(height: 70),
                        CircularProgressIndicator(),
                        SizedBox(height: 70),
                        Text('Fetching some incredible quotes for you')
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 40,
                    width: _width,
                    color: AppColors.five,
                    alignment: Alignment.center,
                    child: Text('Powered by favqs.com'),
                  )
                )
              ],
            )
          ) : Container(
            height: _height,
            width: MediaQuery.of(context).size.width,
            color: Colors.teal,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  height: _height * 0.2,
                  width: _width,
                  child: Container(height: _height * 0.2,color: AppColors.one)
                ),
                Positioned(
                  top: _height * 0.2,
                  height: _height * 0.2,
                  width: _width,
                  child: Container(height: _height * 0.2,color: AppColors.two)
                ),
                Positioned(
                  top: _height * 0.4,
                  height: _height * 0.2,
                  width: _width,
                  child: Container(height: _height * 0.2,color: AppColors.three)
                ),
                Positioned(
                  top: _height * 0.6,
                  height: _height * 0.2,
                  width: _width,
                  child: Container(height: _height * 0.2,color: AppColors.four)
                ),
                Positioned(
                  top: _height * 0.8,
                  height: _height * 0.2,
                  width: _width,
                  child: Container(height: _height * 0.2,color: AppColors.five)
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      navigate('/saved');
                    },
                    child: Icon(
                      Icons.bookmark,
                      size: 26.0,
                      color: Colors.white,
                    ),
                  )
                ),
                Positioned(
                  height: _height,
                  width: _width,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height:50),
                        Image.asset('assets/images/logo.png',width: 150,),
                        SizedBox(height:40),
                        SizedBox(height:40),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: TinderSwapCard(
                            swipeUp: true,
                            swipeDown: true,
                            orientation: AmassOrientation.BOTTOM,
                            totalNum: quotes.length,
                            stackNum: 3,
                            swipeEdge: 1.0,
                            maxWidth: MediaQuery.of(context).size.width,// * 0.9,
                            maxHeight: MediaQuery.of(context).size.height,// * 0.9,
                            minWidth: MediaQuery.of(context).size.width * 0.8,
                            minHeight: MediaQuery.of(context).size.width * 0.8,
                            cardBuilder: (context, index){
                              return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 3,
                                      color: AppColors.four,
                                    )
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        right: 0,
                                        child: Icon(Icons.format_quote,color: AppColors.four,size: 90,),
                                      ),
                                      Container(
                                        child: ListView(
                                          children: [
                                            Text(
                                              quotes[index].body,
                                              style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w300
                                              ),
                                            ),
                                            SizedBox(height: 20,),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                '-' + quotes[index].author,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: (){
                                            Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                behavior: SnackBarBehavior.floating,
                                                content: Text('saved')
                                              )
                                            );
                                            saveQuote(quotes[index]);
                                          },
                                          child: Icon(Icons.bookmark_border_rounded,color: AppColors.four,),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                            },
                            cardController: controller = CardController(),
                            // swipeUpdateCallback:
                            //     (DragUpdateDetails details, Alignment align) {
                            //   /// Get swiping card's alignment
                            //   if (align.x < 0) {
                            //     //Card is LEFT swiping
                            //   } else if (align.x > 0) {
                            //     //Card is RIGHT swiping
                            //   }
                            // },
                            
                            swipeCompleteCallback:
                              (CardSwipeOrientation orientation, int index) {
                                // print(index);
                                // if(index == 2)
                                  getQuotes();
                                /// Get orientation & index of swiped card!
                              },
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 40,
                    width: _width,
                    color: AppColors.five,
                    alignment: Alignment.center,
                    child: Text('Powered by favqs.com'),
                  )
                )
              ],
            )
          )
        );
      },
    );
  }
}