/*
  Warnings:

  - You are about to drop the column `activityId` on the `Activity_log` table. All the data in the column will be lost.
  - You are about to drop the `Activity` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `activity` to the `Activity_log` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Activity_log" DROP CONSTRAINT "Activity_log_activityId_fkey";

-- DropForeignKey
ALTER TABLE "Role_Permission" DROP CONSTRAINT "Role_Permission_permissionId_fkey";

-- AlterTable
ALTER TABLE "Activity_log" DROP COLUMN "activityId",
ADD COLUMN     "activity" TEXT NOT NULL;

-- DropTable
DROP TABLE "Activity";

-- AddForeignKey
ALTER TABLE "Role_Permission" ADD CONSTRAINT "Role_Permission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES "Permission"("id") ON DELETE CASCADE ON UPDATE CASCADE;
