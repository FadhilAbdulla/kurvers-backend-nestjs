export class UpdatePermissionDto {
  permission: {
    PermissionName: string;
    WRITE: boolean;
    READ: boolean;
    UPDATE: boolean;
    DELETE: boolean;
  }[];
}
