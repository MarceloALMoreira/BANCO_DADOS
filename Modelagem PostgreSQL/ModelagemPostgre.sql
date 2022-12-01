CREATE TABLE "Generos" (
  "generosID" int PRIMARY KEY,
  "genero" varchar NOT NULL
);

CREATE TABLE "Filmes" (
  "filmesID" int PRIMARY KEY,
  "titulo" varchar NOT NULL,
  "generosID" int NOT NULL,
  "valor" decimal(8,2) NOT NULL
);

CREATE TABLE "Cliente" (
  "clienteID" int PRIMARY KEY,
  "nome" varchar NOT NULL,
  "sobrenome" varchar NOT NULL,
  "telefone" varchar NOT NULL,
  "endereco" varchar NOT NULL,
  "cpf" int NOT NULL,
  "dvdsID" int NOT NULL
);

CREATE TABLE "Dvds" (
  "dvdsID" int PRIMARY KEY,
  "quantidade" int NOT NULL,
  "filmesID" int NOT NULL
);

CREATE TABLE "Atores" (
  "atoresID" int PRIMARY KEY,
  "nome" varchar NOT NULL
);

CREATE TABLE "Atores_Filme" (
  "atoresfilmeID" int PRIMARY KEY,
  "filmesID" int NOT NULL,
  "atoresID" int NOT NULL,
  "personagem" varchar NOT NULL
);

CREATE TABLE "Emprestimos" (
  "emprestimosID" int PRIMARY KEY,
  "data" datetime NOT NULL,
  "clienteID" int NOT NULL
);

CREATE TABLE "Filmes_Emprestimos" (
  "filmesemprestimosID" int PRIMARY KEY,
  "emprestimosID" int NOT NULL,
  "filmesID" int NOT NULL
);

CREATE TABLE "Devolucoes" (
  "devolocoesID" int PRIMARY KEY,
  "emprestimosID" int NOT NULL,
  "daa" datetime NOT NULL
);

CREATE TABLE "Filmes_Devolucao" (
  "filmesdevolucao" int PRIMARY KEY,
  "devolocoesID" int NOT NULL,
  "filmesemprestimosID" int NOT NULL
);

ALTER TABLE "Filmes" ADD FOREIGN KEY ("generosID") REFERENCES "Generos" ("generosID");

ALTER TABLE "Cliente" ADD FOREIGN KEY ("dvdsID") REFERENCES "Dvds" ("dvdsID");

ALTER TABLE "Dvds" ADD FOREIGN KEY ("filmesID") REFERENCES "Filmes" ("filmesID");

ALTER TABLE "Atores_Filme" ADD FOREIGN KEY ("filmesID") REFERENCES "Filmes" ("filmesID");

ALTER TABLE "Atores_Filme" ADD FOREIGN KEY ("atoresID") REFERENCES "Atores" ("atoresID");

ALTER TABLE "Emprestimos" ADD FOREIGN KEY ("clienteID") REFERENCES "Cliente" ("clienteID");

ALTER TABLE "Filmes_Emprestimos" ADD FOREIGN KEY ("emprestimosID") REFERENCES "Emprestimos" ("emprestimosID");

ALTER TABLE "Filmes_Emprestimos" ADD FOREIGN KEY ("filmesID") REFERENCES "Filmes" ("filmesID");

ALTER TABLE "Devolucoes" ADD FOREIGN KEY ("emprestimosID") REFERENCES "Emprestimos" ("emprestimosID");

ALTER TABLE "Filmes_Devolucao" ADD FOREIGN KEY ("devolocoesID") REFERENCES "Devolucoes" ("devolocoesID");

ALTER TABLE "Filmes_Devolucao" ADD FOREIGN KEY ("filmesemprestimosID") REFERENCES "Filmes_Emprestimos" ("filmesemprestimosID");
