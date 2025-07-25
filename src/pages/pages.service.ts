import { HttpException, Injectable } from '@nestjs/common';
// import { CreatePageDto } from './dto/create-page.dto';
// import { UpdatePageDto } from './dto/update-page.dto';
import { DatabaseService } from 'src/database/database.service';
import { Root, ContactData } from './entities/constant';

@Injectable()
export class PagesService {
  constructor(private readonly databaseService: DatabaseService) { }

  ConvertData(Items, Data) {
    return Data.reduce((acc, item) => {
      if (Items.includes(item.label)) {
        acc[item.label] = item.value;
      }
      //  else {
      //   acc[item.label] = '<p>sample</p>';
      // }
      return acc;
    }, {});
  }

  async career() {
    const res = await this.GetPrimaryData('career')
    const career = await this.databaseService.job.findMany({
      where: {
        isDeleted: false,
        isActive: true,
      },
    });

    return {
      ...res,
      career: career,
    };
  }

  async career_focus(id: number) {
    const main = await this.GetMinimalPageData()
    const career = await this.databaseService.job.findFirst({ where: { id: id } });
    return { ...main, ...career };
  }

  async career_apply(id: number) {
    const main = await this.GetMinimalPageData()
    return { ...main, jobId: id };
  }

  async contact() {
    const main = await this.GetMinimalPageData()
    const res = await this.databaseService.configuration.findFirst({ where: { label: 'contact' } });
    const transformed = []

    this.safeParse(res.value)?.country.map((it) => {
      const countOfMapElement = transformed.filter(sub => sub.mapElement.includes(it.mapElement)).length;
      let trnsfrm: any = {
        heading: it.heading,
        countryIdentifier: it.countryIdentifier,
        mapElement: countOfMapElement > 0 ? `${it.mapElement}${countOfMapElement}` : it.mapElement,
      }
      const htmlString = `
      <p class='fw-bold'>${it.heading}</p>
      <p>${it.address1}</p>
      ${it.address2 ? `<p>${it.address2}</p>` : ''}
      
      ${it.email ? `<a href='mailto:${it.email}' class='pointer email'>${it.email}</a>` : ''}
      ${it.phone ? `<a href='tel:${it.phone}' class='pointer email'>${it.phone}</a>` : ''}
    `;
      trnsfrm = { ...trnsfrm, content: htmlString }
      transformed.push({ ...trnsfrm, ...ContactData[it.mapElement] })
    })

    return { ...main, rectData: transformed };
  }



  async GetPrimaryData(id: string) {
    const [res, datArray] = await Promise.all([
      this.databaseService.configuration.findFirst({ where: { label: id } }),
      this.databaseService.configuration.findMany({
        where: { label: { in: ['footer', 'element'] } },
      }),
    ]);

    if (!res) return null;

    const dat = Object.fromEntries(datArray.map(item => [item.label, item]));
    return {
      ...Root,
      ...this.safeParse(res.value),
      footer: this.safeParse(dat.footer?.value || '{}'),
      element: this.safeParse(dat.element?.value || '{}'),
    };
  }

  async GetMinimalPageData() {
    const datArray = await this.databaseService.configuration.findMany({
      where: { label: { in: ['footer', 'element'] } }
    })

    const dat = Object.fromEntries(datArray.map(item => [item.label, item]));
    return {
      ...Root,
      footer: this.safeParse(dat.footer?.value || '{}'),
      element: this.safeParse(dat.element?.value || '{}'),
    };

  }


  safeParse = (str: string) => {
    try {
      return JSON.parse(str);
    } catch {
      return {};
    }
  };
}
