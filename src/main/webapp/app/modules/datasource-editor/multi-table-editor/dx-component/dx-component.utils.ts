export const isValid = (items: any[], columnName: string) => {
  return !items.find(item => item.title.toLowerCase() === columnName.toLowerCase());
}
