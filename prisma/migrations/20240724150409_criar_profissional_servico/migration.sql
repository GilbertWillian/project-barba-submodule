-- CreateTable
CREATE TABLE "profissional" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "avaliacao" DOUBLE PRECISION NOT NULL,
    "quantidadeAvaliacoes" INTEGER NOT NULL,

    CONSTRAINT "profissional_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "servico" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "preco" DOUBLE PRECISION NOT NULL,
    "qtdeSlots" INTEGER NOT NULL,
    "imageURL" TEXT NOT NULL,

    CONSTRAINT "servico_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "servico_nome_key" ON "servico"("nome");
