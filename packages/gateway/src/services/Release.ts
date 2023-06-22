import { queries } from "@1kv/common";

export const getLatestRelease = async (): Promise<any> => {
  const release = await queries.getLatestRelease();
  return release;
};
