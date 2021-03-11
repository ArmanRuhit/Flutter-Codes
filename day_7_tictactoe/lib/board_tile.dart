import 'package:day_7_tictactoe/tile_state.dart';
import 'package:flutter/material.dart';

class BoardTile extends StatelessWidget {

  BoardTile({Key key, this.tileState, this.dimension, this.onPressed}):super(key: key);
  final double dimension;
  final Function onPressed;
  final TileState tileState;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      child: TextButton(
        onPressed: onPressed,
        child: _widgetForTileState(),
      ),
    );
  }

  Widget _widgetForTileState(){
    Widget widget;

    switch(tileState){
      case TileState.EMPTY:{
        widget = Container();
      }
      break;
      case TileState.CROSS:{
        widget = Image.asset('images/x.png');
      }
      break;

      case TileState.CIRCLE:{
        widget = Image.asset('images/o.png');
      }
      break;
    }
    return widget;
  }
}
