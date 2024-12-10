import { Injectable } from '@nestjs/common';
// import { CreatePageDto } from './dto/create-page.dto';
// import { UpdatePageDto } from './dto/update-page.dto';
import { DatabaseService } from 'src/database/database.service';
import { Root, FooterItems, ContactEdit } from './entities/constant';

@Injectable()
export class PagesService {
  constructor(private readonly databaseService: DatabaseService) {}

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

  async home() {
    const res = await this.databaseService.configuration.findMany();
    const bannersData = await this.databaseService.banner.findMany({
      where: {
        type: { in: ['home', 'gogreen'] },
        isDeleted: false,
      },
    });

    const data = {
      ...Root,
      banner: bannersData.filter((banner) => banner.type === 'home'),
      gogreen: bannersData.filter((banner) => banner.type === 'gogreen'),
      counter: { ...this.ConvertData(['home_established', 'home_locations_count', 'home_projects_completed'], res) },
      footer: { ...this.ConvertData(FooterItems, res) },
    };
    console.log(data);

    return data;
  }

  async about() {
    const res = await this.databaseService.configuration.findMany();

    return {
      ...Root,
      footer: { ...this.ConvertData(FooterItems, res) },
    };
  }

  async turnkey() {
    const res = await this.databaseService.configuration.findMany();

    return {
      ...Root,
      footer: { ...this.ConvertData(FooterItems, res) },
    };
  }

  async product() {
    const res = await this.databaseService.configuration.findMany();
    const product = this.ConvertData(['product-range'], res);
    return {
      ...Root,
      ...JSON.parse(String(product?.['product-range'])),
      footer: { ...this.ConvertData(FooterItems, res) },
    };
  }

  async valves() {
    const res = await this.databaseService.configuration.findMany();
    const valves = this.ConvertData(['kurvers-valves'], res);

    return {
      ...Root,
      ...JSON.parse(String(valves?.['kurvers-valves'])),
      footer: { ...this.ConvertData(FooterItems, res) },
    };
  }

  async career() {
    const res = await this.databaseService.configuration.findMany();
    const career = await this.databaseService.job.findMany({
      where: {
        isDeleted: false,
        isActive: true,
      },
    });

    console.log(career);

    return {
      ...Root,
      career: career,
      ...this.ConvertData(['career_apply_mail'], res),
      footer: { ...this.ConvertData(FooterItems, res) },
    };
  }

  async career_focus(id: number) {
    const res = await this.databaseService.configuration.findMany();
    const career = await this.databaseService.job.findFirst({ where: { id: id } });

    return {
      ...Root,
      ...career,
      footer: { ...this.ConvertData(FooterItems, res) },
    };
  }

  async career_apply(id: number) {
    const res = await this.databaseService.configuration.findMany();

    const data = {
      ...Root,
      jobId: id,
      footer: { ...this.ConvertData(FooterItems, res) },
    };

    return data;
  }

  async contact() {
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
      footer: { ...this.ConvertData(FooterItems, res) },
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
}
