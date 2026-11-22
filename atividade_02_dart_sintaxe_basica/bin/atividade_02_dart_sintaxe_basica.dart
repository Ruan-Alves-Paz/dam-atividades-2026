
abstract class Livro {
  final String codigo;
  final String? autor;
  String _titulo;

  Livro({
    required this.codigo,
    required String titulo,
    this.autor,
  }) : _titulo = titulo.trim();

  String get titulo => _titulo;

  set titulo(String novoTitulo) {
    String tituloLimpo = novoTitulo.trim();

    if (tituloLimpo.isNotEmpty) {
      _titulo = tituloLimpo;
    }
  }

  String get descricao;

  String get autorFormatado => autor?.trim().isNotEmpty == true
      ? autor!.trim()
      : 'Autor desconhecido';
}


extension ReferenciaLivro on Livro {
  String get referencia => '$titulo - $autorFormatado';
}


abstract class Emprestavel {
  bool get disponivel;
  bool emprestar();
  bool devolver();
}


class LivroFisico extends Livro implements Emprestavel {
  final int numeroPaginas;
  bool _disponivel = true;

  LivroFisico({
    required super.codigo,
    required super.titulo,
    super.autor,
    required this.numeroPaginas,
  });

  @override
  bool get disponivel => _disponivel;

  @override
  String get descricao =>
      'Livro físico | Código: $codigo | Título: $titulo | '
      'Autor: $autorFormatado | Páginas: $numeroPaginas';

  @override
  bool emprestar() {
    if (!_disponivel) {
      return false;
    }

    _disponivel = false;
    return true;
  }

  @override
  bool devolver() {
    if (_disponivel) {
      return false;
    }

    _disponivel = true;
    return true;
  }
}

class LivroDigital extends Livro {
  final double tamanhoMB;

  LivroDigital({
    required super.codigo,
    required super.titulo,
    super.autor,
    required this.tamanhoMB,
  });

  @override
  String get descricao =>
      'Livro digital | Código: $codigo | Título: $titulo | '
      'Autor: $autorFormatado | Tamanho: ${tamanhoMB} MB';
}

void main() {
  // Criando livros
  LivroFisico livroFisico1 = LivroFisico(
    codigo: 'F001',
    titulo: 'Clean Code',
    autor: 'Robert C. Martin',
    numeroPaginas: 464,
  );

  LivroFisico livroFisico2 = LivroFisico(
    codigo: 'F002',
    titulo: 'O Hobbit',
    numeroPaginas: 310,

  );

  LivroDigital livroDigital1 = LivroDigital(
    codigo: 'D001',
    titulo: 'Dart para Iniciantes',
    autor: 'João Silva',
    tamanhoMB: 5.8,

  );



  LivroDigital livroDigital2 = LivroDigital(
    codigo: 'D002',
    titulo: 'Programação Orientada a Objetos',
    autor: 'Maria Souza',
    tamanhoMB: 12.4,
  );



  List<Livro> biblioteca = [
    livroFisico1,
    livroFisico2,
    livroDigital1,
    livroDigital2,
  ];

  print('===== CATÁLOGO DA BIBLIOTECA =====');

  for (Livro livro in biblioteca) {
    print(livro.descricao);
    print('Referência: ${livro.referencia}');
    print('-------------------------------');
  }



  print('\n===== ALTERAÇÃO DO TÍTULO =====');

  print('Título original: ${livroFisico1.titulo}');

  livroFisico1.titulo = '  Clean Code - 2ª edição  ';
  print('Título atualizado: ${livroFisico1.titulo}');

  livroFisico1.titulo = '   ';
  print('Após título em branco: ${livroFisico1.titulo}');

  
  print('\n===== EMPRÉSTIMOS =====');

  print('Disponível inicialmente: ${livroFisico1.disponivel}');

  bool primeiroEmprestimo = livroFisico1.emprestar();
  print('Primeiro empréstimo aceito: $primeiroEmprestimo');
  print('Disponível após empréstimo: ${livroFisico1.disponivel}');

  bool segundoEmprestimo = livroFisico1.emprestar();
  print('Segundo empréstimo aceito: $segundoEmprestimo');

  bool devolucao = livroFisico1.devolver();
  print('Devolução realizada: $devolucao');
  print('Disponível após devolução: ${livroFisico1.disponivel}');

  
  bool segundaDevolucao = livroFisico1.devolver();
  print('Devolver novamente: $segundaDevolucao');
  print('Estado final: ${livroFisico1.disponivel}');
}
