import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { NestExpressApplication } from '@nestjs/platform-express';
import { join } from 'path';

async function bootstrap() {
  console.log(process.env.DATABASE_URL);

  const app = await NestFactory.create<NestExpressApplication>(AppModule);
  app.enableCors();

  // app.useStaticAssets(join(__dirname, '..', 'public'), {
  //   prefix: '/', // Serve files on the root URL
  // });
  // app.setGlobalPrefix('api');
  app.setViewEngine('ejs');

  // Set the views directory (where your .ejs files are located)
  app.setBaseViewsDir(join(__dirname, '..', 'views'));
  app.setGlobalPrefix('api', {
    exclude: [
      '',
      'about',
      'turnkey',
      'product',
      'valves',
      'career',
      'career-focus(/.*)?',
      'career-apply(/.*)?',
      'contact',
      'terms',
      'privacy',
      'api',
    ],
  });
  app.useStaticAssets(join(__dirname, '..', 'uploads'), {
    prefix: '/uploads', // Optional: add a URL prefix
  });
  await app.listen(process.env.PORT ?? 4000);
}
bootstrap();
