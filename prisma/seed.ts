import { PrismaClient } from '@prisma/client';
import * as fs from 'fs';
import * as path from 'path';

const prisma = new PrismaClient();

async function main() {
  // Read the SQL file
  const seedFilePath = path.join(__dirname, 'seed.sql');
  const seedSQL = fs.readFileSync(seedFilePath, 'utf8');

  // Execute the SQL commands
  await prisma.$executeRawUnsafe(seedSQL);

  console.log('Database has been seeded!');
}

main()
  .catch((e) => {
    console.error('Error while seeding the database:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
