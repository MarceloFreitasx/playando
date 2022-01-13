# Playando

![image](https://badgen.net/badge/Flutter/2.5.3) ![image](https://badgen.net/badge/license/MIT/blue)
<br>
<br>
### Tecnologias Usadas

Esta aplicação mobile possui as seguintes tecnologias:
* Flutter (2.5.3)
* Clean Architecture
* Injeção de Dependência
* Gerenciamento de Rotas
* Gerenciamento de Estado
* Persistência de Dados
* Comunicação API

<br>

### Resumo

O objetivo desse projeto é desenvolver uma aplicação mobile que adicione vídeos do YouTube a uma lista, usando os dados da API do YouTube. Além disso, se o usuário fechar o app e retornar depois, sua lista deve estar disponível da mesma forma que se apresentava na última alteração.

<br>

### Requisitos

[ ✔ ] Se houver uma lista armazenada, ela deve ser restaurada.

[ ✔ ] O usuário pode digitar uma url do YouTube ou o título de um vídeo a ser buscado.

[ ✔ ] Se o usuário digitar uma url do YouTube, o botão deve exibir o texto “adicionar”, caso contrário, deve exibir “buscar”.

[ ✔ ] Se o usuário clicar em “buscar”, um modal deve ser aberto com uma lista de vídeos para que um possa ser escolhido.

[ ✔ ] Ao adicionar um vídeo, ele deve aparecer no final da playlist com título e thumbnail obtidos pela API do YouTube. 

[ ✔ ] Os vídeos da lista podem ser filtrados por palavras-chave encontradas nos títulos. Isto significa que “criando promo” dá match em “Criando sua primeira promoção”. A ordem das palavras-chave no título deve ser respeitada.

[ ✔ ] Ao clicar em filtrar, o botão “filtrar” muda para “limpar filtro”. Clicando no mesmo botão, a lista volta ao estado inicial.

[ ✔ ] Ao clicar no botão de play sobre o vídeo, o estado do botão deve mudar e o vídeo pode ser pausado clicando no mesmo botão.

[ ✔ ] Se um vídeo estiver tocando e o usuário clicar no botão de play de outro vídeo, o primeiro vídeo deve pausar.

[ ✔ ] Ao clicar no “x” sobre o vídeo, o vídeo deve ser removido da lista.

[ ✔ ] Os títulos dos vídeos devem ocupar no máximo 2 linhas e mostrar “...” no final da 2ª linha caso excedam.

[ ✔ ] As thumbnails devem usar a proporção de 16:9 (ex.: 480x270, 320x180). Se a imagem utilizada não tiver essa proporção, ela deve ser cortada e centralizada.

<br>

### Installation

1. Caso não tenha o flutter instalado, [clique aqui](https://flutter.dev/docs/get-started/install/) e leia sua documentação.
2. Instale o Flutter 2.5.3
3. Faça o clone do projeto e vá para a pasta raiz.
4. Altere a constante <b>TOKEN</b> em ```lib/env/development.dart``` para sua chave secreta do google
5. Caso não tenha a chave [clique aqui](console.cloud.google.com/apis/library/youtube.googleapis.com) e configure seu token para YouTube Data API v3
4. Execute o comando ```flutter pub get``` para baixar as dependências.
5. Execute o comando ```flutter run```.