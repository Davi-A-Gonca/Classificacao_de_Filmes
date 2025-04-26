Classificação de filmes é um sistema CRUD que utilizando REST. Para o seu backend, foi usado MongoDB; para seu frontend, o Dart e o Flutter foram utilizados. 
O Sistema funciona de maneira eficiente e intuitiva, contendo todas as utilizações do CRUD, porém exigindo alguns pré-requisitos para funcionar.

Como Rodar:
Em um terminal, clone o repositório remoto para um diretório local, rode a classe “Main.java” no diretório “Back-End”, se no terminal mude para o diretório “src\main\java\org\example” dentro de Back-End use o código: javac Main.java

E então mude para o diretório local dentro do projeto clonado chamado Frontend, especificamente no código Main.dart, pois é onde está o projeto em Dart, ainda no terminal use o comando: flutter run

Funcionalidade do código:
Ao rodar o flutter, vai aparecer um site em flutter padrão, com uma caixa no meio escrito "Bem vindo à Classificação de Filmes!", com um botão escrito "ir para o formuláiro".
Ao clicar no botão, aparecerá outro site em flutter, com uma lista de filmes em várias Radio Buttons, uma textbox para colocar a classificação do filme escolhido e outra texbox para um comentário.
Também existe um botão escrito "Cadastrar" que não poderá ser clicado até todos os campos serem preenchidos corretamente, quando forem preenchidos corretamente, com uma nota entre 0-5, um filme escolhido e um comentário feito, o botão será habilitado.
Clicando no botão, o cometário será enviado para o Banco de dados, e uma SnackBar com a frase "Nota e comentário adicionados com sucesso" irá aparecer.
Se você tentar adicionar uma nota fora do intervalo 0-5, ou se tentar adicionar a classificação sem comentário, nota ou filme, o botão para cadastrar ficará inativado.

Ao clicar no botão de "Listas classificações", o dart vai pegar os dados salvos na API e listar eles em um showDialog, se nenhuma classificação estiver cadastrada, aparecerá 'nenhuma classificação encontrada'
