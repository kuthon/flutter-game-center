import 'package:cocos_game/games/common_vars/game_common_vars.dart';
import 'package:cocos_game/games/core/entity.dart';
import 'package:flutter/material.dart';

class Player extends Entity {
  Player() : super(spriteName: "spaceRocket", width: 50, height: 90, numberOfSprites: 1) {
    x = GameCommonVars.screenWidth / 2 - width / 2;
    y = 10;
  }

  @override
  Widget build() {
    return Positioned(
        bottom: y,
        left: x,
        child: visible ?
        Container(
            child: sprites[currentSprite],
            width: width,
            height: height
        )
            :
        SizedBox.shrink());
  }

  @override
  void move() {
    if (dx > 1)
      x+=2;
    if (dx > 50)
      x++;
    if (dx > 100)
      x++;
    if (dx > 150)
      x++;
    if (dx > 200)
      x++;
    if (dx > 250)
      x++;
    if (dx < -1)
      x-=2;
    if (dx < -50)
      x--;
    if (dx < -100)
      x--;
    if (dx < -150)
      x--;
    if (dx < -200)
      x--;
    if (dx < -50)
      x--;


    if (x > GameCommonVars.screenWidth - width)
      x = GameCommonVars.screenWidth - width;
    if (x < 0)
      x = 0;

  }

  @override
  void update() {
    move();
  }
}