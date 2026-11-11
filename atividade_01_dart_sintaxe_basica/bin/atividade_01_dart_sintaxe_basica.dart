enum Classificacao {
  semAvaliacoes,
  baixa,
  regular,
  alta,
}

void main() {
  const notaMinima = 1;
  const notaMaxima = 5;
  const notaPositiva = 4;

  // Todas as notas recebidas representam números inteiros.
  // Algumas estão fora do intervalo permitido.
  final notasRecebidas = <String, List<String>>{
    'Agenda UFAPE': ['5', '4', '5', '0', '3', '6'],
    'Biblioteca Digital': ['3', '2', '4', '1'],
    'Mapa do Campus': [],
    'Restaurante Universitário': ['5', '5', '4', '4', '5'],
    'Transporte Universitário': ['0', '6', '-1'],
  };

  final categoriasPorApp = <String, String>{
    'Agenda UFAPE': 'Organização',
    'Biblioteca Digital': 'Serviços',
    'Mapa do Campus': 'Localização',
    'Restaurante Universitário': 'Serviços',
    'Transporte Universitário': 'Serviços',
  };

  final contatosPorApp = <String, String?>{
    'Agenda UFAPE': 'agenda@exemplo.com',
    'Biblioteca Digital': null,
    'Mapa do Campus': 'mapa@exemplo.com',
    'Restaurante Universitário': 'ru@exemplo.com',
    // Transporte Universitário não possui chave neste mapa.
  };

  final notasValidasPorApp = <String, List<int>>{};
  final descartadasPorApp = <String, int>{};
  final categoriasUnicas = <String>{};

  // QUESTÃO 1 — PREPARAÇÃO DOS DADOS
  for (final app in notasRecebidas.keys) {
    final notasStr = notasRecebidas[app] ?? [];
    final validas = <int>[];
    var descartadas = 0;

    for (final notaStr in notasStr) {
      final nota = int.parse(notaStr);
      if (nota >= notaMinima && nota <= notaMaxima) {
        validas.add(nota);
      } else {
        descartadas++;
      }
    }

    notasValidasPorApp[app] = validas;
    descartadasPorApp[app] = descartadas;
  }

  // Preenchimento do Set de categorias únicas
  categoriasUnicas.addAll(categoriasPorApp.values);

  // QUESTÃO 2 — RELATÓRIO
  print('RELATÓRIO DE AVALIAÇÕES');
  print('======================');

  for (final app in notasValidasPorApp.keys) {
    final categoria = categoriasPorApp[app] ?? 'Não informada';
    final contato = contatosPorApp[app] ?? 'Não informado';

    final validas = notasValidasPorApp[app] ?? [];
    final qtdValidas = validas.length;
    final qtdDescartadas = descartadasPorApp[app] ?? 0;

    String mediaTexto;
    String pctPositivasTexto;
    Classificacao classificacao;

    if (qtdValidas == 0) {
      mediaTexto = 'Não calculado';
      pctPositivasTexto = 'Não calculado';
      classificacao = Classificacao.semAvaliacoes;
    } else {
      final soma = validas.reduce((a, b) => a + b);
      final media = soma / qtdValidas;

      final qtdPositivas = validas.where((n) => n >= notaPositiva).length;
      final pctPositivas = (qtdPositivas / qtdValidas) * 100;

      mediaTexto = media.toStringAsFixed(2);
      pctPositivasTexto = '${pctPositivas.toStringAsFixed(1)}%';

      if (media < 3) {
        classificacao = Classificacao.baixa;
      } else if (media < 4) {
        classificacao = Classificacao.regular;
      } else {
        classificacao = Classificacao.alta;
      }
    }

    String textoClassificacao;
    switch (classificacao) {
      case Classificacao.semAvaliacoes:
        textoClassificacao = 'Sem avaliações';
        break;
      case Classificacao.baixa:
        textoClassificacao = 'Baixa';
        break;
      case Classificacao.regular:
        textoClassificacao = 'Regular';
        break;
      case Classificacao.alta:
        textoClassificacao = 'Alta';
        break;
    }

    print('\nAplicativo: $app');
    print('  Categoria: $categoria');
    print('  Contato: $contato');
    print('  Notas Válidas: $qtdValidas');
    print('  Notas Descartadas: $qtdDescartadas');
    print('  Média: $mediaTexto');
    print('  Notas Positivas: $pctPositivasTexto');
    print('  Classificação: $textoClassificacao');
  }

  print('\nCATEGORIAS ENCONTRADAS');
  for (final categoria in categoriasUnicas) {
    print('- $categoria');
  }
}