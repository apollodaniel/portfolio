# Portfolio

This is my own portfolio made in Typescript, React, React Router, NextUI, and TailwindCSS.

> This is a single page application (SPA).

### [Versão em Português](#portfólio--explicação-em-português-)

## Navigation

The portfolio consists of two screens:

-   `/` -> Main Screen
-   `/projects/all` -> All Projects List

### Routes

The routes available are:

#### Main Screen

-   `/` -> Presentation section
-   `/about-me` -> Detailed info about me
-   `/projects` -> Best Projects section
-   `/contact` -> Contact section

#### All Projects Screen

-   `/projects/all` -> All Projects list

As you can see, most routes are sections within the main screen.
When navigating to a main screen route, the screen will automatically scroll to the relevant section.

> [!WARNING]
> Manually scrolling to other sections does not change the route.

## Projects

The projects are fetched using the [Github Scraper API](https://github.com/apollodaniel/github-scraper-api) created by me.
This API retrieves profile information and repositories based on a username.

Projects can be viewed on the `/projects` route, and all projects are listed under `/projects/all`.

> The API URL used in this project points to my own hosted version. Change the URL before use.
> The CORS policy restricts access to my hosted portfolio URL only.

---

## Portfólio ( Explicação em Português )

Este é meu portfólio pessoal, desenvolvido em Typescript, React, React Router, NextUI e TailwindCSS.

> Este é um aplicativo de página única (SPA).

## Navegação

O portfólio consiste em duas telas:

-   `/` -> Tela Principal
-   `/projects/all` -> Lista de Todos os Projetos

### Rotas

As rotas disponíveis são:

#### Tela Principal

-   `/` -> Seção de Apresentação ( Início )
-   `/about-me` -> Informações detalhadas sobre mim
-   `/projects` -> Seção dos Melhores Projetos
-   `/contact` -> Seção de Contato

#### Tela de Todos os Projetos

-   `/projects/all` -> Lista de Todos os Projetos

Como você pode ver, a maioria das rotas são seções na tela principal.
Ao navegar para uma rota da tela principal, a tela rolará automaticamente para a seção escolhida.

> [!WARNING]
> Rolar manualmente para outras seções não altera a rota.

## Projetos

Os projetos são obtidos usando a [Github Scraper API](https://github.com/apollodaniel/github-scraper-api), criada por mim.
Esta API recupera informações de perfil e repositórios usando um nome de usuário.

Os projetos podem ser visualizados na rota `/projects`, e todos os projetos estão listados em `/projects/all`.

> A URL da API usada neste projeto aponta para minha versão hospedada. Altere a URL antes de usar.
> A política de CORS da API restrinje o acesso apenas à URL do portfólio hospedado.
