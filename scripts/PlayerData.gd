extends Node

var playerMoney: int = 1000000

enum PlayerState {
    PAUSED,
    PLAYING,
}
var currentPlayerState = PlayerState.PLAYING