class Session {
  const Session(
    this.id,
    this.currentPlayer,
    this.deck,
    this.players,
    this.table,
  );

  final String id;
  final CurrentPlayer currentPlayer;
  final List<String> deck;
  final List<String> players;
  final List<String> table;
}

class CurrentPlayer {
  const CurrentPlayer(
    this.id,
    this.sessionId,
    this.cards,
    this.name,
    this.state,
  );

  final String id;
  final String sessionId;
  final List<String> cards;
  final String name;
  final String state;
}
