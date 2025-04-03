import { HttpException, Injectable } from '@nestjs/common';
// import { CreatePageDto } from './dto/create-page.dto';
// import { UpdatePageDto } from './dto/update-page.dto';
import { DatabaseService } from 'src/database/database.service';
import { Root, FooterItems, ContactEdit } from './entities/constant';

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

    const res = await this.databaseService.configuration.findMany();
    const ContactDetails = this.ConvertData(ContactEdit, res);
    const transformed = Object.fromEntries(
      Object.entries(ContactDetails).map(([key, value]) => {
        const parsed = JSON.parse(String(value)); // Parse the JSON string
        const htmlString = `
          <p class='fw-bold'>${parsed.heading}</p>
          <p>${parsed.address1}</p>
          ${parsed.address2 ? `<p>${parsed.address2}</p>` : ''}
          
          ${parsed.email ? `<a href='mailto:${parsed.email}' class='pointer email'>${parsed.email}</a>` : ''}
          ${parsed.phone ? `<a href='tel:${parsed.phone}' class='pointer email'>${parsed.phone}</a>` : ''}
        `;
        return [key, htmlString.trim()]; // Return the transformed key-value pair
      })
    );
    console.log(transformed, ContactDetails);

    return {
      ...Root,
      ...transformed,
      footer: { ...JSON.parse(footer.value) },
    };
  }

  async terms() {
    const res = await this.databaseService.configuration.findMany();

    return {
      ...Root,
      footer: { ...this.ConvertData(FooterItems, res) },
    };
  }

  async privacy() {
    const res = await this.databaseService.configuration.findMany();

    return {
      ...Root,
      footer: { ...this.ConvertData(FooterItems, res) },
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
