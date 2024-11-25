-- CreateTable
CREATE TABLE "Banner" (
    "id" SERIAL NOT NULL,
    "banner" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "isButtonVisible" BOOLEAN NOT NULL DEFAULT true,
    "buttonText" TEXT,
    "buttonLink" TEXT,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Banner_pkey" PRIMARY KEY ("id")
);
