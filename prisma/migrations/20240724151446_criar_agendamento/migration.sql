/*
  Warnings:

  - You are about to drop the column `imageUrl` on the `profissional` table. All the data in the column will be lost.
  - You are about to drop the column `imageURL` on the `servico` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[nome]` on the table `profissional` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `imagemUrl` to the `profissional` table without a default value. This is not possible if the table is not empty.
  - Added the required column `imagemURL` to the `servico` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "profissional" DROP COLUMN "imageUrl",
ADD COLUMN     "imagemUrl" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "servico" DROP COLUMN "imageURL",
ADD COLUMN     "imagemURL" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "agendamento" (
    "id" SERIAL NOT NULL,
    "emailCliente" TEXT NOT NULL,
    "data" TIMESTAMPTZ(3) NOT NULL,
    "profissionalId" INTEGER NOT NULL,

    CONSTRAINT "agendamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_AgendamentoToServico" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_AgendamentoToServico_AB_unique" ON "_AgendamentoToServico"("A", "B");

-- CreateIndex
CREATE INDEX "_AgendamentoToServico_B_index" ON "_AgendamentoToServico"("B");

-- CreateIndex
CREATE UNIQUE INDEX "profissional_nome_key" ON "profissional"("nome");

-- AddForeignKey
ALTER TABLE "agendamento" ADD CONSTRAINT "agendamento_profissionalId_fkey" FOREIGN KEY ("profissionalId") REFERENCES "profissional"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AgendamentoToServico" ADD CONSTRAINT "_AgendamentoToServico_A_fkey" FOREIGN KEY ("A") REFERENCES "agendamento"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AgendamentoToServico" ADD CONSTRAINT "_AgendamentoToServico_B_fkey" FOREIGN KEY ("B") REFERENCES "servico"("id") ON DELETE CASCADE ON UPDATE CASCADE;
