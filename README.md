# Curso de Clean Code e Clean Architecture com Rodrigo Branas - Início 01/04/24

## Documentação para estudo

Esta documentação prevê o passo a passo de como foi montado o projeto, para entender as etapas e como foi evoluindo durante o curso.

Deixarei o repositório público, mas objetivo é para meu estudo, minhas reflexões, meu jeito de fazer as coisas. 

## Etapa 1 - Preparando Ambiente

A linguagem a ser utilizada no andamento do curso será Node.js, usando typescript. Não é obrigatório a usá-la, mas deve selecionar uma linguagem que tenha pelo menos Orientação a Objetos. Utilizarei o Node.js como aprendizado, para mim será interessante conhecer já que não tenho experiência nenhuma com ela.

Projeto em Node.js, utilizando typescript.

1. Primeiro criei um repositório com o git, utilizando, `git init` para versionamento. Não foi bem na sequencia, mas vou deixar aqui descrito que coloquei um arquivo na raiz `.gitignore`, colocando os diretórios:
 - node_modules
1. Na sequência, instalar o Node. No meu caso, utilizando Ubuntu, usei o gerenciador `apt install node`. Verifiquei versão `node -v` tudo certo, nesse caso instalou `V.21.7.1`
1. O Branas sugeriu trabalhar com `nvm`, no qual é um gerenciador de ambiente Node, podendo selecionar o uso de diferentes versões para cada projeto. Não lembro se instalei, pois apenas usei um `nvm -v` e saiu a versão `0.39.7`. Ao utilizar `nvm list`, vi que eu já tinha duas versões de node instalado. Quaisquer outras dúvidas no nvm, basta `nvm -h`, é muito bom o help.
1. Próximo passo é um `npm init`, isso vai fazer com que se crie o básico para iniciar um projeto Node.
1. Branas sugeriu criar duas pastas na raiz projeto, uma `srv`e outra `test`, não precisa nem explicar cada uma né.
1. Agora, em vez de utilizar o npm para instalar as dependências, Branas sugeriu utilizar o yarn. Pois é um gerenciador de pacote mais rápido e mais moderno. Instalei utilizando `npm install yarn -g`, no cado o `-g` representa instalação global, ou seja, entendo que estará disponível para todos os projetos Node.
1. Continuamos agora a instalar passo a passo as dependências dos pacotes para o projeto, com o yarn é claro. Começando com o `yarn add typescript`, no qual instalou o pacote em `node_modules`, e colocou a referência `"typescript": "^5.4.3"` no `package.json` no qual é onde fica registrado quais pacotes utilizamos no projeto. Vou os pacotes tudo em uma linha só:
 `yarn add typescript @types/jest ts-node ts-jest`, também é possível fazer com o npm: `npm install typescript @types/jest ts-node ts-jest`
1. Agora falamos do *npx*, no qual é um executor de node. Ainda não tenho grandes conhecimentos disto, mas é como se chamasse um script para executar no sistema, tipo um .sh, mas em linguagem node. No caso iniciamos com `npx tsc --init` que cria um arquivo de config `tsconfig.json` possibilitando configurações sobre o projeto e typescript, ainda preciso aprofundar conhecimento sobre essas configs...
1. Na sequencia, para executar o *jest* de maneira mais rápida, usamos o `npx ts-jest config:init`, no qual ele cria um arquivo de config `jest.config.js`, no que preciso também aprofundar mais conhecimento nessas configs...
1. Agora com a config do jest, conseguimos apenas executar `npx jest` e ele sai testando. Para validar o teste, Branas deixou uma classe de exemplo `src/Circle.ts` e o test `test/Circle.test.ts`.
1. Aí acho que fechou essa primeira etapa. Como escrevi depois que fiz tudo, se algo não funcionar, tem que dar uma pesquisada.

## Etapa 2 - Objetivo

Utilizando as técnicas de refactoring que vimos na aula, refatore o código do UC1 - Signup, disponível em:

https://github.com/rodrigobranas/cccat16_1/blob/master/src/api.ts

### UC1 - Signup
Ator: Passageiro, Motorista
Input: name, email, cpf, carPlate, password, isPassenger, isDriver
Output: account_id

- deve verificar se o email já existe e lançar um erro caso já exista
- deve gerar o account_id (uuid)
- deve validar o nome, email e cpf
- deve apenas salvar a senha, por enquanto em claro

Para testar adequadamente o UC1 será necessário criar o UC2 - GetAccount.

### UC2 - GetAccount
Input: account_id
Output: todas as informações da conta

Observações:

Crie uma API REST para interagir com os use cases criados por meio do protocolo HTTP e não se esqueça de também criar testes para a API.
O modelo de dados está disponível em https://github.com/rodrigobranas/cccat16_1/blob/master/create.sql

### Alterações no Projeto

1. Criei um docker-compose.yaml para subir 3 containers iniciais
- postgress
  - Deixe banco com volume na máquina, assim ele vai manter os dados depois que eu derrubar o container.
  - Os scripts de migration ficarão nas pasta `./database/migrations`
- phpmyadmin (client para acesso a gerenciamento de banco)
- flyway (para começar versionar scripts de banco)
  - Tive que adapatar algumas coisas para rodar o Flyway depois de levantar o banco, pois tudo está em container, tem que esperar ele abrir as conexões para poder conectar e atualizar o migration. Observe isso no container `flyway` dentro do `docker-compose.yaml`, utilizei o script `./scripts/wait-for-it.sh` retirado de `https://github.com/vishnubob/wait-for-it`

1. Bibliotecas instaladas que achei no projeto exemplo:
- `yarn add @types/express`
- `yarn add axios`
- `yarn add express`
- `yarn add nodemon`
- `yarn add postgres`