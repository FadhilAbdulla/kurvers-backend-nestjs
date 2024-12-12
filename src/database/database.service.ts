import { Injectable, OnModuleInit } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class DatabaseService extends PrismaClient implements OnModuleInit {
  async onModuleInit() {
    await this.$connect();
  }
  async logActivity(activity: string, action: string): Promise<void> {
    try {
      await this.activity_log.create({
        data: {
          activity,
          action,
          user: {
            connect: { id: 1 }, // Connect to the existing user
          },
        },
      });
    } catch (error) {
      console.error('Error logging activity:', error);
      // Optionally, you can handle errors here (e.g., send them to a monitoring system)
    }
  }
}
