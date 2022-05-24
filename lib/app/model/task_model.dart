class Task {
  final String titulo;
  final String descricao;
  final bool taCompleta;
  final DateTime criadoEm;

  Task(
    this.titulo,
    this.descricao, {
    bool? taCompleta,
    DateTime? criadoEm,
  })  : taCompleta = taCompleta ?? false,
        criadoEm = criadoEm ?? DateTime.now();

  Task copy({String? titulo, String? descricao, bool? taCompleta}) {
    return Task(
      titulo ?? this.titulo,
      descricao ?? this.descricao,
      taCompleta: taCompleta ?? this.taCompleta,
      criadoEm: criadoEm,
    );
  }
}
