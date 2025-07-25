import { Controller, Get, Param, ParseIntPipe, Render } from '@nestjs/common';
import { PagesService } from './pages.service';

@Controller('')
export class PagesController {
  constructor(private readonly pagesService: PagesService) { }

  @Get()
  @Render('home')
  home() {
    return this.pagesService.GetPrimaryData('home')
    // return this.pagesService.home();
  }
  @Get('about')
  @Render('about')
  about() {
    return this.pagesService.GetPrimaryData('about')
    // return this.pagesService.about();
  }
  @Get('turnkey')
  @Render('turnkey')
  turnkey() {
    return this.pagesService.GetPrimaryData('turkey')
  }
  @Get('product')
  @Render('product')
  product() {
    return this.pagesService.GetPrimaryData('productRange')
  }
  @Get('valves')
  @Render('valves')
  valves() {
    return this.pagesService.GetPrimaryData('valves')
  }

  @Get('quality')
  @Render('quality')
  async quality() {
    console.log(await this.pagesService.GetPrimaryData("quality"));

    return this.pagesService.GetPrimaryData("quality");
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
    return this.pagesService.GetMinimalPageData();
  }
  @Get('privacy')
  @Render('privacy')
  privacy() {
    return this.pagesService.GetMinimalPageData();
  }

}
