-- CreateEnum
CREATE TYPE "roles" AS ENUM ('USER', 'ADMIN', 'MANAGER', 'FORMATEUR', 'CLIENT_PARTICIPANT', 'CLIENT_MANAGER');

-- CreateEnum
CREATE TYPE "status" AS ENUM ('FREE', 'PAID', 'PREMIUM', 'CANCELED');

-- CreateEnum
CREATE TYPE "FieldType" AS ENUM ('TEXT', 'TEXTAREA', 'RADIO', 'CHECKBOX', 'SELECT', 'DATE', 'TIME', 'DATETIME', 'EMAIL', 'NUMBER', 'PASSWORD', 'FILE', 'HIDDEN', 'COLOR', 'RANGE', 'TEL', 'URL', 'SEARCH', 'MONTH', 'WEEK', 'IMAGE', 'BUTTON', 'SUBMIT', 'RESET', 'BOOLEAN');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "lastname" VARCHAR(255),
    "firstname" VARCHAR(255),
    "email" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(255),
    "password" VARCHAR(255) NOT NULL,
    "fonction" VARCHAR(255),
    "avatar" VARCHAR(255),
    "status" "status" NOT NULL DEFAULT 'FREE',
    "entreprise_id" INTEGER,
    "role" "roles" NOT NULL DEFAULT 'USER',
    "resetToken" VARCHAR(255),
    "resetTokenExpiry" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "mailVerified" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "evaluations" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "note_globale" INTEGER NOT NULL DEFAULT 0,
    "commentaire" TEXT,
    "formateur_id" TEXT,
    "participant_id" TEXT,
    "contrat_id" INTEGER,

    CONSTRAINT "evaluations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "companies" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT,
    "city" TEXT,
    "zipcode" TEXT,
    "country" TEXT,
    "logo" TEXT,

    CONSTRAINT "companies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contrats" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "begin_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "nombre_de_seances" INTEGER,
    "theme" TEXT NOT NULL,
    "client_id" INTEGER NOT NULL,

    CONSTRAINT "contrats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contrat_methodes" (
    "id" SERIAL NOT NULL,
    "contrat_id" INTEGER NOT NULL,
    "methode_id" INTEGER NOT NULL,

    CONSTRAINT "contrat_methodes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tags" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "tags_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "methode_tags" (
    "id" SERIAL NOT NULL,
    "methode_id" INTEGER NOT NULL,
    "tag_id" INTEGER NOT NULL,

    CONSTRAINT "methode_tags_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "methodes" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "methodes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "forms" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "published" BOOLEAN NOT NULL DEFAULT true,
    "user_id" TEXT NOT NULL,
    "methode_id" INTEGER,
    "company_id" INTEGER,

    CONSTRAINT "forms_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "fields" (
    "id" SERIAL NOT NULL,
    "type" "FieldType" NOT NULL DEFAULT 'TEXT',
    "label" TEXT,
    "form_id" INTEGER NOT NULL,

    CONSTRAINT "fields_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "field_values" (
    "id" SERIAL NOT NULL,
    "value" TEXT,
    "field_id" INTEGER NOT NULL,
    "form_id" INTEGER NOT NULL,
    "evaluation_id" INTEGER,

    CONSTRAINT "field_values_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE INDEX "email" ON "users"("email");

-- CreateIndex
CREATE INDEX "lastname" ON "users"("lastname");

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_entreprise_id_fkey" FOREIGN KEY ("entreprise_id") REFERENCES "companies"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "evaluations" ADD CONSTRAINT "evaluations_formateur_id_fkey" FOREIGN KEY ("formateur_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "evaluations" ADD CONSTRAINT "evaluations_participant_id_fkey" FOREIGN KEY ("participant_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "evaluations" ADD CONSTRAINT "evaluations_contrat_id_fkey" FOREIGN KEY ("contrat_id") REFERENCES "contrats"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contrats" ADD CONSTRAINT "contrats_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "companies"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contrat_methodes" ADD CONSTRAINT "contrat_methodes_contrat_id_fkey" FOREIGN KEY ("contrat_id") REFERENCES "contrats"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contrat_methodes" ADD CONSTRAINT "contrat_methodes_methode_id_fkey" FOREIGN KEY ("methode_id") REFERENCES "methodes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "methode_tags" ADD CONSTRAINT "methode_tags_methode_id_fkey" FOREIGN KEY ("methode_id") REFERENCES "methodes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "methode_tags" ADD CONSTRAINT "methode_tags_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "tags"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "forms" ADD CONSTRAINT "forms_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "forms" ADD CONSTRAINT "forms_methode_id_fkey" FOREIGN KEY ("methode_id") REFERENCES "methodes"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "forms" ADD CONSTRAINT "forms_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "companies"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fields" ADD CONSTRAINT "fields_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "forms"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "field_values" ADD CONSTRAINT "field_values_field_id_fkey" FOREIGN KEY ("field_id") REFERENCES "fields"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "field_values" ADD CONSTRAINT "field_values_form_id_fkey" FOREIGN KEY ("form_id") REFERENCES "forms"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "field_values" ADD CONSTRAINT "field_values_evaluation_id_fkey" FOREIGN KEY ("evaluation_id") REFERENCES "evaluations"("id") ON DELETE SET NULL ON UPDATE CASCADE;
