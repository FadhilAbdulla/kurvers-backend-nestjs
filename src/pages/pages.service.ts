import { Injectable } from '@nestjs/common';
// import { CreatePageDto } from './dto/create-page.dto';
// import { UpdatePageDto } from './dto/update-page.dto';
import { DatabaseService } from 'src/database/database.service';
import { Root, FooterItems } from './entities/constant';

@Injectable()
export class PagesService {
  constructor(private readonly databaseService: DatabaseService) {}

  ConvertData(Items, Data) {
    return Data.reduce((acc, item) => {
      if (Items.includes(item.label)) {
        acc[item.label] = item.value;
      } else {
        acc[item.label] = '<p>sample</p>';
      }
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

    return {
      ...Root,
      banner: bannersData.filter((banner) => banner.type === 'home'),
      gogreen: bannersData.filter((banner) => banner.type === 'gogreen'),
      counter: { ...this.ConvertData(['home_established', 'home_locations_count', 'home_projects_completed'], res) },
      footer: { ...this.ConvertData(FooterItems, res) },
    };
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

    return {
      ...Root,
      footer: { ...this.ConvertData(FooterItems, res) },
    };
  }

  async valves() {
    const res = await this.databaseService.configuration.findMany();

    return {
      ...Root,
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
    // const career = await this.databaseService.job.findFirst({ where: { id: id } });
    console.log(id);

    return {
      ...Root,
      jobId: id,
      footer: { ...this.ConvertData(FooterItems, res) },
    };
  }

  async contact() {
    const res = await this.databaseService.configuration.findMany();

    return {
      ...Root,
      ...this.ConvertData(
        [
          'contact_usa',
          'contact_ger',
          'contact_ner',
          'contact_italy',
          'contact_uk',
          'contact_france',
          'contact_china',
          'contact_sing',
          'contact_uae',
        ],
        res
      ),
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
