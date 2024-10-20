class Contato{
  String nome;
  String numeroTelefone;
  String email;
  Contato(this.nome, this.numeroTelefone, this.email);

  @override
  String toString() {
    return 'Nome: $nome | Telefone: $numeroTelefone | Email: $email';
  }
}