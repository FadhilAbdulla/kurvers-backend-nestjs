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
    const footer = await this.databaseService.configuration.findFirst({ where: { label: 'footer' } });
    const career = await this.databaseService.job.findFirst({ where: { id: id } });

    return {
      ...Root, ...career, footer: { ...JSON.parse(footer.value) },
    };
  }

  async career_apply(id: number) {
    const footer = await this.databaseService.configuration.findFirst({ where: { label: 'footer' } });

    return {
      ...Root, jobId: id, footer: { ...JSON.parse(footer.value) },
    };
  }

  async contact() {
    const footer = await this.databaseService.configuration.findFirst({ where: { label: 'footer' } });
    const res = await this.databaseService.configuration.findFirst({ where: { label: 'contact' } });
    const transformed = []

    JSON.parse(res.value)?.country.map((it) => {
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


    return {
      ...Root,
      rectData: transformed,
      footer: { ...JSON.parse(footer.value) },
    };
  }

  async terms() {
    const footer = await this.databaseService.configuration.findFirst({ where: { label: 'footer' } });

    return {
      ...Root,
      footer: { ...JSON.parse(footer.value) },
    };
  }

  async privacy() {
    const footer = await this.databaseService.configuration.findFirst({ where: { label: 'footer' } });

    return {
      ...Root,
      footer: { ...JSON.parse(footer.value) },
    };
  }

  async GetPrimaryData(id: string) {
    const res = await this.databaseService.configuration.findFirst({ where: { label: id } });
    const footer = await this.databaseService.configuration.findFirst({ where: { label: 'footer' } });
    if (!res) {
      return null
    }
    else {

      const resp = JSON.parse(res.value)
      return { ...Root, ...resp, footer: { ...JSON.parse(footer.value) } };
    }
  }
}
