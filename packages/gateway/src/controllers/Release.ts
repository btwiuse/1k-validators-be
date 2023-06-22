import { response } from "./index";
import * as ReleaseService from "../services/Release";
import { logger } from "@1kv/common";

export default class ReleaseController {
  public static async getLatestRelease(context: any): Promise<void> {
    if (await context.cashed()) {
      logger.info(`{Gateway} getLatestRelease is cached`);
      return;
    }
    response(context, 200, await ReleaseService.getLatestRelease());
  }
}
