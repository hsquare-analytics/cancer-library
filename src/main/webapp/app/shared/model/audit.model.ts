export interface IAudit {
  id?: number;
  principal?: string;
  auditEventDate?: Date;
  auditEventType?: string;
  data?: any;
}

export const defaultValue: Readonly<IAudit> = {};
