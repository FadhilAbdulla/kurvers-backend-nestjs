import { Controller, Get, Param, ParseIntPipe, Render } from '@nestjs/common';
import { PagesService } from './pages.service';

@Controller('')
export class PagesController {
  constructor(private readonly pagesService: PagesService) {}

  @Get()
  @Render('home')
  home() {
    return this.pagesService.home();
  }
  @Get('about')
  @Render('about')
  about() {
    return this.pagesService.about();
  }
  @Get('turnkey')
  @Render('turnkey')
  turnkey() {
    return this.pagesService.turnkey();
  }
  @Get('product')
  @Render('product')
  product() {
    return this.pagesService.product();
  }
  @Get('valves')
  @Render('valves')
  valves() {
    return this.pagesService.valves();
  }
  @Get('career')
  @Render('career')
  career() {
    return this.pagesService.career();
  }
  @Get('career-focus/:id')
  @Render('career-focus')
  career_focus(@Param('id', ParseIntPipe) id: number) {
    return this.pagesService.career_focus(id);
  }

  @Get('career-apply/:id')
  @Render('career-apply')
  career_apply(@Param('id', ParseIntPipe) id: number) {
    return this.pagesService.career_apply(id);
  }
  @Get('contact')
  @Render('contact')
  contact() {
    return this.pagesService.contact();
  }
  @Get('terms')
  @Render('terms')
  terms() {
    return this.pagesService.terms();
  }
  @Get('privacy')
  @Render('privacy')
  privacy() {
    return this.pagesService.privacy();
  }
}
